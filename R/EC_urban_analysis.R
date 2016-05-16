#### TITLE: EC urban (UTM) data ####
#
#
#   Date: 2016-05-16
#   Version: 1.0
#

#### * Preliminaries ####
source('R/tool_convert_magic.R')
source('R/tool_convert_magic_num.R')
source('R/tool_proc_dat2.R')
source('R/tool_charactersNumeric.R')
source('R/tool_asNumeric.R')

#### * Data import ####

df_urban <- read.csv('data/eddypro_Husna_Urban_full_output_2016-05-13T140804_exp.csv',
                     header = TRUE, skip = 1)

# Use the proc_dat2 function to process the data
df_EC <- proc_dat2(df_urban,h_names)

