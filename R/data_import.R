# Import the data
raw_csat <- read.csv('data/CR1000_ts_data.dat', skip = 4, header = FALSE)
# Column names
#header <- readLines('data/CR1000_ts_data.dat',3)
#header <- header[2]
#header <- gsub("[[:punct:]]",",",header)
#header <- strsplit(header,split=',')
#header <- unlist(header)


header <- c('timestamp', 'record', 'Ux', 'Uy', 'Uz', 'Ts', 'diag_sonic')

names(raw_csat) <- header

rm(header)

raw_csat$timestamp <- strptime(raw_csat$timestamp,'%Y-%m-%d %H:%M:%OS')
