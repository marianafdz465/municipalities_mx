library(dplyr)
library(fuzzyjoin)
library(reclin)
library(tidyverse)



df_dictionary_mx <- read_csv("./data_raw/df_mexico.csv")

dummy_states <- read_csv("./data_raw/dummy_states.csv")




df %>%
  # Left join based on stringdist using city and city_actual cols
  stringdist_left_join(df2, by = c("entidad" = "entidad_actual")) %>%
  # Select the name, city, and city_actual cols
  select(entidad, entidad_actual, municipio)


#1. Hacer pairs para comparar


# States ------------------------------------------------------------------

df_dictionary_states <- df_dictionary_mx %>%
  group_by(entidad, nom_abr, cve_ent) %>%
  summarise_each(funs()) %>%
  ungroup() %>%
  select(entidad, nom_abr, cve_ent)

#(If we only have states )
dummy_states <- dummy_states %>%
    rename(entidad = Entidad)

df_new <- df_dictionary_states %>%
  stringdist_left_join(dummy_states,
                       by = c(misspelling = "entidad")) %>%
    select(entidad, nom_abr, cve_ent)

df_new <- stringdist_right_join(dummy_states, df_dictionary_states, by = "entidad", method = "dl" ,
                               ignore_case = TRUE, max_dist = 4)
