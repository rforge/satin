pkgname <- "satin"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('satin')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("attrib.oceancolor")
### * attrib.oceancolor

flush(stderr()); flush(stdout())

### Name: attrib.oceancolor
### Title: Read attributes from an hdf file
### Aliases: attrib.oceancolor
### Keywords: oceancolor hdf

### ** Examples

## Not run: 
##D 
##D attrib.oceancolor("A20131052013112.L3m_8D_NSST_4.h5")
## End(Not run)



cleanEx()
nameEx("climatology")
### * climatology

flush(stderr()); flush(stdout())

### Name: climatology
### Title: Summarize several periods of satellite data
### Aliases: climatology

### ** Examples

## Not run: 
##D  fl <- list.files() # Directory with 5 hdf files of sst data
##D  Msst <- read.oceancolor(fl, lats=c(20, 30), lons=c(-120, -110) )
##D  cMsst <- climatology(Msst)
##D  plotSatin(cMsst)
##D  plotSatin(cMsst, file=2) 
## End(Not run)



cleanEx()
nameEx("cutSatin")
### * cutSatin

flush(stderr()); flush(stdout())

### Name: cutSatin
### Title: Select and cut an area of interest from an image
### Aliases: cutSatin
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ## load and display data
##D    data(dbsst)
##D    plotSatin(dbsst)
##D   
##D ## cut an area of interest. *** draw a polygon ***
##D    dbsst.cut <- cutSatin(dbsst)
##D ## look at the polygon coordinates  
##D    dbsst.cut$polygon
##D ## display the area of interest
##D    plotSatin(dbsst.cut$aoi)
## End(Not run)



cleanEx()
nameEx("dataSetList")
### * dataSetList

flush(stderr()); flush(stdout())

### Name: dataSetList
### Title: List of the available oceanographic data.
### Aliases: dataSetList
### Keywords: datasets

### ** Examples

data(dataSetList)





cleanEx()
nameEx("dataSetQuery")
### * dataSetQuery

flush(stderr()); flush(stdout())

### Name: dataSetQuery
### Title: Data set queries of the oceanographic data
### Aliases: dataSetQuery
### Keywords: ~kwd1 ~kwd2

### ** Examples

## To see all available oceanographic data use:
dataSetQuery()

## Make a query for temperature, or the same query using incomplete words 
## and ignoring case.
dataSetQuery(parameter = "temperature")
dataSetQuery(parameter = "temPer")
## In both examples you will get 33 posible images containing temperature

## If you want sea surface temperature with a spatial resolution of 
## 0.1 degrees use:
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
## In this query you will get only 4 options.

## To get the data set id for "SST,Blended,0.1degrees,Global,EXPERIMENTAL" use:
dataSetQuery(dataset = 40)




cleanEx()
nameEx("dbsst")
### * dbsst

flush(stderr()); flush(stdout())

### Name: dbsst
### Title: SST sample data - Aqua Modis sensor
### Aliases: dbsst
### Keywords: datasets

### ** Examples

data(dbsst)
str(dbsst)
plotSatin(dbsst)



cleanEx()
nameEx("dchla")
### * dchla

flush(stderr()); flush(stdout())

### Name: dchla
### Title: Chlorophyll sample data - Aqua Modis sensor
### Aliases: dchla
### Keywords: datasets

### ** Examples

data(dchla)
str(dchla)
plotSatin(dchla)

## view in logarithmic scale
plotSatin(dchla, log=TRUE)



cleanEx()
nameEx("dmap")
### * dmap

flush(stderr()); flush(stdout())

### Name: dmap
### Title: Map of northwest Mexico from GSHHG
### Aliases: dmap
### Keywords: datasets

### ** Examples

  data(dmap)
   plot(dmap, xlim=c(-130, -105) , ylim=c(20, 42), xaxs="i", yaxs="i", 
        axes=TRUE, col="beige", lty=1, border="grey70"); box()



cleanEx()
nameEx("fileType")
### * fileType

flush(stderr()); flush(stdout())

### Name: fileType
### Title: Download space and time-oriented oceanographic data
### Aliases: fileType
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Get "large.png" files of monthly sea surface temperature with a spatial 
## resolution of 0.1degrees of the northwest of Mexico from january to 
## december 2012.

## Query and settings
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
timeperiod <- "1month"
getADates(dataset, timeperiod)
range(getADates(dataset, timeperiod))
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
dates <- c("2012-01-01", "2012-12-30")
filetype <- "large.png"

## download files with oceanographic data
fileType(lons, lats, dates, dataset, timeperiod, filetype)




cleanEx()
nameEx("fileTypeBathy")
### * fileTypeBathy

flush(stderr()); flush(stdout())

### Name: fileTypeBathy
### Title: Download integrated land topography and ocean bathymetry data.
### Aliases: fileTypeBathy
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Get a ".xyz" of integrated land topography and ocean bathymetry 
## with a spatial resolution of 0.1 degrees of the northwest of Mexico.

## Settings
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
resolution <- 0.1
filetype <- ".xyz"

fileTypeBathy(lons, lats, resolution, filetype)
## The downloaded file ("tmp_254.5E32.5N.xyz") contains 3 columns: 
## longitude (in 0 - 360E format), latitude, and the altimetry




cleanEx()
nameEx("genColorPal")
### * genColorPal

flush(stderr()); flush(stdout())

### Name: genColorPal
### Title: Generating color palettes for satellite data
### Aliases: genColorPal

### ** Examples

genColorPal(10, 30, length=10)



cleanEx()
nameEx("getADates")
### * getADates

flush(stderr()); flush(stdout())

### Name: getADates
### Title: Get available dates
### Aliases: getADates
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Make a query of all availables dates of monthly sea surface temperature 
## with a spatial resolution of 0.1degrees

## Query and settings
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
timeperiod <- "1month"
getADates(dataset, timeperiod)

## If you your query gets to many results you can also use
range(getADates(dataset, timeperiod))




cleanEx()
nameEx("getGridBathy")
### * getGridBathy

flush(stderr()); flush(stdout())

### Name: getGridBathy
### Title: Download integrated land topography and ocean bathymetry data
### Aliases: getGridBathy
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Get land topography and ocean bathymetry of the northwest of Mexico 
## with a spatial resolution of 0.05 degrees.

## Settings
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
resolution <- 0.05

my.data <- getGridBathy(lons, lats, resolution)
names(my.data)
range(my.data$data)

## Create color palettes for bathymetry and topography data.
bathy.pal <- colorRampPalette(c("navyblue", "blue3", "blue", "cyan"))
topo.pal <- colorRampPalette(c("#2F6503", "#D3D19E", "#D3A744", "#988618",
                               "#4C3516"))

## Create a map with bathymetry and topography data.
filled.contour(x = my.data$longitude, y = my.data$latitude, t(my.data$data), 
               zlim = c(-5000, 4000), nlevels = 30, 
               col = c(bathy.pal(10), topo.pal(20)))

## Only bathymetry
filled.contour(x = my.data$longitude, y = my.data$latitude, t(my.data$data), 
               zlim = c(-5000, 0), nlevels = 30, 
               color.palette = bathy.pal)

## Only topography
filled.contour(x = my.data$longitude, y = my.data$latitude, t(my.data$data), 
               zlim = c(0, 4000), nlevels = 30, 
               color.palette = topo.pal)
               



cleanEx()
nameEx("getGridData")
### * getGridData

flush(stderr()); flush(stdout())

### Name: getGridData
### Title: Download space grid oceanographic data
### Aliases: getGridData
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Get monthly sea surface temperature data with a spatial resolution 
## of 0.1degrees of the northwest of Mexico from january to december 2012.

## Query and settings
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
timeperiod <- "1month"
getADates(dataset, timeperiod)
range(getADates(dataset, timeperiod))
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
dates <- c("2012-01-01", "2012-12-30")

## download data
my.data <- getGridData(lons, lats, dates, dataset, timeperiod)
names(my.data)

## Create color palette for sea surface temperature
my.pal <- colorRampPalette(c("purple", "blue4", "blue", "cyan", "green", 
                             "yellow", "orange", "red", "darkred"))

image(x = my.data$longitude, y = my.data$latitude, t(my.data$data[, , 1]), 
      col = my.pal(40), main = my.data$period[1])

filled.contour(x = my.data$longitude, y = my.data$latitude, 
               t(my.data$data[, , 1]), zlim = c(12, 34), nlevels = 40, 
               color.palette = my.pal, main = my.data$period[1])



cleanEx()
nameEx("isolineSatin")
### * isolineSatin

flush(stderr()); flush(stdout())

### Name: isolineSatin
### Title: Obtaining isotherms from SST data
### Aliases: isolineSatin

### ** Examples

data(dbsst)
sst0.5 <- scaleSatin(dbsst, extent=0.5) 
isolin <- isolineSatin(sst0.5, levels=c(17, 19, 21))
plotSatin(dbsst)
addLines(isolin$PolySet, col="white")



cleanEx()
nameEx("plotSatin")
### * plotSatin

flush(stderr()); flush(stdout())

### Name: plotSatin
### Title: Easy maps from satellite data
### Aliases: plotSatin

### ** Examples


  ## SST data (Aqua Modis)
  data(dbsst)
  plotSatin(dbsst)
  plotSatin(dbsst, map=dmap, colbar.pos="t")

  ## Chl-a concentration data (Aqua Modis) in actual units and in logarithmic scale
  data(dchla)
  plotSatin(dchla, map=dmap, xlim=c(-130, -105), ylim=c(20, 40))
  x11()
  plotSatin(dchla, map=dmap, xlim=c(-130, -105), ylim=c(20, 40), log = TRUE)  




cleanEx()
nameEx("read.oceancolor")
### * read.oceancolor

flush(stderr()); flush(stdout())

### Name: read.oceancolor
### Title: Read satellite data from Oceancolor hdf files
### Aliases: read.oceancolor
### Keywords: hdf oceancolor

### ** Examples

## Not run: 
##D  sst <- read.oceancolor("A20101822010212.L3m_MO_SST4_4.h5", 
##D                  lats=c(20, 30), lons=c(-130, -105))
##D 
##D # directory with 4 oceancolor hdf files 
##D     setwd("D:/data")
##D     fi <- list.files()
##D     lats <- c(20, 25)
##D     lons <- c(-115, -110)
##D     multiSST <- read.oceancolor(fi, lats, lons)      
##D 
##D # mapping the first processed file
##D     satinView(multiSST) 
##D 
##D # mapping the second processed file
##D     satinView(multiSST, file = 2)
## End(Not run)



cleanEx()
nameEx("reshapeSatin")
### * reshapeSatin

flush(stderr()); flush(stdout())

### Name: reshapeSatin
### Title: Reshape a satin object as a data frame and viceversa
### Aliases: reshapeSatin
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(dbsst)
X <- reshapeSatin(dbsst, direction = "long")
head(X)
attributes(X)
Y <- reshapeSatin(X, direction = "wide")
str(Y)
satinView(Y)



cleanEx()
nameEx("scaleSatin")
### * scaleSatin

flush(stderr()); flush(stdout())

### Name: scaleSatin
### Title: Spatial re-scaling of satellite data
### Aliases: scaleSatin

### ** Examples

data(dbsst)
sst0.2 <- scaleSatin(dbsst, extent = 0.5) 
plotSatin(sst0.5)

scaleSatin(dbsst, extent=1, format = "long")



cleanEx()
nameEx("timePeriod")
### * timePeriod

flush(stderr()); flush(stdout())

### Name: timePeriod
### Title: Get time periods available of the oceanographic data
### Aliases: timePeriod
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Make a query of all time periods available of global sea surface temperature
## with a spatial resolution of 0.1deggres

dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
