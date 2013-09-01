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