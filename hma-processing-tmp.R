#hma-processing-tmp

# get libraries

# set highest level of directory possible

# 
# create a list of .nc file names that are PAIRED with a list of .csv file names
#

# assert that lists are same size


nsrc <- length(ncFilenames)

for (isrc in (1:nsrc)){
  ncPath <- paste0(BASE1, ncFilenames[isrc])
  csvPath <- paste0(BASE2, csvFilenames[isrc])
  
  attr <- get_att(open_nc(ncPath))
  originDate <- attr$GETORIGINDATE
  
  src <- tidync(ncPath) %>% hyper_array
  rawDates <- attr(src)$transforms$dates $ WHATEVER
  
  datesCorrected <- as.Date(rawDates, origin = originDate)
  
  rm(src) 
  
  runoff <- read.csv(csvPath) # and perofrm any necessary modifications
  
  # create as dataframe
  runoff$dates <- datesCorrected
}

# CAN TURN THIS INTO FUNCTION EASILY BY COPYING INNER LOOP. INPUT SHOULD BE 
# ncPATH AND csvPath, 

#  FOR OTHER PRODUCTS:
#  1) generalize cdf to geotiff-raster files 
#  2) ensure GEE code is sufficiently generalized
#  3) run GEE code and download csv files for other products
#  4) generalize function from for loop to allow easy selection, given runoff

#####################
#####################
#####################

#
# For some nc, pick a few random nonzero values. For all timepoints, explore all
# values at the same index.
# Write function for exploring at same index, giving index and filename
# Write function for exploring over all timepoints, giving filename and lat/lon 