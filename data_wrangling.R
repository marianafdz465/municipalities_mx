##************************************************************************
## Script Name:
## Purpose:
##
##
## Created: 2020-10-06
## Authors: Mariana Fernández
##
## GitHub: marianafdz465
##
##
##************************************************************************



# Libraries ---------------------------------------------------------------

library(dplyr)


# Load Data Set -----------------------------------------------------------

df <- read_csv("./data_raw/municipios.csv")


# Data Wrangling ----------------------------------------------------------

#Select Columns

df_mexico <- df %>%
  select(Nom_Ent,
         Nom_Abr,
         Cve_Ent,
         Nom_Mun,
         clave) %>%
  rename(entidad = Nom_Ent,
         nom_abr = Nom_Abr,
         cve_ent = Cve_Ent,
         municipio = Nom_Mun,
         cve_mun = clave)


# Save new Data frame
write.csv(df_mexico, "data_raw/df_mexico.csv",
            row.names = FALSE)
