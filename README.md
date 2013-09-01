Plotting probe vehicle GPS data on Google Earth
===============================================

For the tutorial introduction, see this blogpost: http://libreknwldg.blogspot.in/2013/08/plotting-probe-vehicle-gps-data-on.html

1)	Clone the repository:
	$ git clone https://github.com/arkebi/plottingGPSData.git

2)	Start R:
	$ R

3)	Change your working directory to the folder plottingGPSData:
	> setwd("path/to/plottingGPSData")

4)	Load the source code of the script:
	> source("createTrajectoryKML.R")

5)	Run the script with the file name as the argument:
	> createTrajectoryKML("SampleGPSData.csv")