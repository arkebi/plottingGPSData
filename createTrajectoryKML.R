# Script:   createTrajectoryKML.R
# Author:   Rakesh Behera
# Date:   16/08/13
# Modified: 19/08/13
# Purpose:  This script reads a typical GPS log CSV file into a data frame,
#       creates an sp object out of it, assigns a CRS, creates an STIDF
#       and plots the KML by triggering Google Earth

createTrajectoryKML <- function(tripFile = "SampleGPSData.csv"){
  library(sp);
  library(plotKML);
  tripData <- read.csv(tripFile);
  tripData$ctime <- as.POSIXct(strptime(as.character(tripData$Timestamp),"%d/%m/%Y %H:%M:%S"),format="%d/%m/%Y %H:%M:%S");
  library(spacetime);
  sp <- SpatialPoints(tripData[,c("Longitude","Latitude")]);
  proj4string(sp) <- CRS("+proj=longlat +datum=WGS84");
  tripData.st <- STIDF(sp, time = tripData$ctime, data = tripData[,c("Speed","Distance")]);
  tripDataAnim <- tripData.st[1:nrow(tripData)];
  plotKML(tripDataAnim[,,"Speed"], dtime = 24);
}