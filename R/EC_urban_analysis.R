#### TITLE: EC urban (UTM) data ####
##
##  Author: Yusri Yusup, PhD
##  Date: 2016-05-16
##  Version: 1.0
##  R Script to import and process urban EC data from UTM
##
##

#### * Preliminaries ####
source('R/tool_convert_magic.R')
source('R/tool_convert_magic_num.R')
source('R/tool_charactersNumeric.R')
source('R/tool_asNumeric.R')

#### * Data import and process ####
df_urban <- read.csv(file.choose(),
                     header = TRUE, skip = 1)
# Remove the first row
df_urban <- df_urban[-1,]
# Remove the first column
df_urban <- df_urban[,-1]
# Renumber the row numbers
rownames(df_urban) <- NULL
# Using convert_magic to convert all columns to 'character' first
df_urban <- convert_magic(df_urban[,c(seq(1,ncol(df_urban)))],
                          c(rep('character',times = ncol(df_urban))))
# Changing all the '-9999.0' or '-9999' (missing data) to NA
for (i in 1:length(df_urban)){
  df_urban[i][df_urban[i] == '-9999' | df_urban[i] == '-9999.0'] <- NA
}
rm(i)
# Formatting time
time_stamp <- paste(df_urban$date,df_urban$time)
# Might need to change format of date 1/1/2014 or 2014-1-1
time_stamp <- strptime(time_stamp,"%Y-%m-%d %H:%M")
df_urban$time <- time_stamp
df_urban <- df_urban[,c(-1)]
colnames(df_urban)[1] <-'time_stamp'
# Remove 'DOY', don't know what it is for...
df_urban <- df_urban[,c(-2)]
# Changing all relevant columns to factors
df_urban$daytime <- as.factor(df_urban$daytime)
df_urban$file_records <- as.factor(df_urban$file_records)
df_urban$used_records <- as.factor(df_urban$used_records)
df_urban$qc_Tau <- as.factor(df_urban$qc_Tau)
df_urban$qc_H <- as.factor(df_urban$qc_H)
df_urban$spikes_hf <- as.factor(df_urban$spikes_hf)
df_urban$amplitude_resolution_hf <- as.factor(df_urban$amplitude_resolution_hf)
df_urban$drop_out_hf <- as.factor(df_urban$drop_out_hf)
df_urban$absolute_limits_hf <- as.factor(df_urban$absolute_limits_hf)
df_urban$skewness_kurtosis_hf <- as.factor(df_urban$skewness_kurtosis_hf)
df_urban$skewness_kurtosis_sf <- as.factor(df_urban$skewness_kurtosis_sf)
df_urban$discontinuities_hf <- as.factor(df_urban$discontinuities_hf)
df_urban$discontinuities_sf <- as.factor(df_urban$discontinuities_sf)
df_urban$timelag_hf <- as.factor(df_urban$timelag_hf)
df_urban$timelag_sf <- as.factor(df_urban$timelag_sf)
df_urban$attack_angle_hf <- as.factor(df_urban$attack_angle_hf)
df_urban$non_steady_wind_hf <- as.factor(df_urban$non_steady_wind_hf)
df_urban$model <- as.factor(df_urban$model)
# Change all non-factors (or characters) to numeric)
df_urban <- charactersNumeric(df_urban)
# Change column name of (z-d)/L to Z.L
colnames(df_urban)[which(colnames(df_urban) == 'X.z.d..L')] <- 'Z.L'
# Remove 'ET' because the only column different with other data sets
df_urban$ET <- NULL


#### * Cleanup ####
rm(time_stamp)
