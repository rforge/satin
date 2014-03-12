read.oceancolor <- function(file, lons, lats)
{
  # Function to get start (end)  year and day from Product name attribute 
  queryDate <- function(prod.name) {
    split_1 <- unlist(strsplit(prod.name, "\\."))
    sY <- as.numeric( substr(split_1[1], 2, 5) )
    sD <- as.numeric( substr(split_1[1], 6, 8) )
    if ( nchar(split_1[1]) > 8) {
      eY <- sY
      eD <- as.numeric( substr(split_1[1], 13, 15) )
    }  
    seYD <- list(sY = sY, eY = eY, sD = sD, eD = eD)
    seYD  
  }  
  
  # Function to determine the date or averaging period of the data
  avg.period <- function(sY, sD, eY, eD){ 
  	bDt <- strptime(paste(sY, sD, sep = "-"), "%Y-%j")
  	bday <- days(bDt)
  	bmonth <- months(bDt, abbreviate = TRUE)
  	eDt <- strptime(paste(eY, eD, sep = "-"), "%Y-%j")
  	eday <- days(eDt)
  	emonth <- months(eDt, abbreviate = TRUE)
  	if ( bDt == eDt ){
  		avp <- as.character(bDt)
  	} else {
  		if (bmonth == emonth){
  			avp <- paste(sY, bmonth, paste(bday, eday, sep="-"), sep=" ")
  		} else {
  			avp <- paste(paste(sY, bmonth, bday, sep=" "), paste(eY, emonth, eday, 
  																													 sep=" "), sep="-")
  		}
  	}
  	avp
  }
  
  # read attributes of HDF file
  h5 <- H5File(fileName = file[1])
  Attr <- attrib.oceancolor(file[1])  
  ni <- length(file)
  avps <- rep("0000-00-00", ni)
  
  # get sensor, parameter, units, scaling, etc.
  sensorN <-  Attr[[charmatch("Sensor Name", names(Attr))]]
  pname <- Attr[[charmatch("Parameter", names(Attr))]]
  punits <- Attr[[charmatch("Units", names(Attr))]]
  scaling <- Attr[[charmatch("Scaling", names(Attr))]]
  slope <- Attr[[charmatch("Slope", names(Attr))]]
  intercept <- Attr[[charmatch("Intercept", names(Attr))]]
 
  # construct latitude and longitude vectors
  swpLat <- Attr[[charmatch("SW Point Latitude", names(Attr))]]
  swpLon <- Attr[[charmatch("SW Point Longitude", names(Attr))]]
  latStep <- Attr[[charmatch("Latitude Step", names(Attr))]]
  lonStep <- Attr[[charmatch("Longitude Step", names(Attr))]]
  lat <- seq(swpLat, 90, latStep)
  lon <- seq(swpLon, 180, lonStep)
  xlon <- lon >= min(lons) & lon <= max(lons)
  ylat <- lat >= min(lats) & lat <= max(lats)
  longit <- lon[xlon]
  latit <- sort(lat[ylat])
  
  # processing first hdf file
  h5Cont <- listH5Contents(h5)
  ndata <- h5Cont$l3m_data$name
  d <- getH5Dataset(h5, ndata)
  data <- readH5Data(d)
  data <- matrix(data, nrow=d@dims[1], byrow=TRUE)
  data <- data[sort.list(nrow(data):1), ]
  dmin <- Attr[[charmatch("Data Minimum", names(Attr))]]
  dmax <- Attr[[charmatch("Data Maximum", names(Attr))]]
  par.aoi <- data[ylat, xlon]
  if (scaling != "linear") 
  	stop ("Scaling is not linear, code must be reviewed. Please contact package maintainer")
  par.aoi <- (slope * par.aoi) + intercept
  par.aoi[par.aoi > dmax | par.aoi < dmin] <- NA
  D <- array(NA, dim=c(dim(par.aoi)[1], dim(par.aoi)[2], ni))
  D[ , , 1] <-  par.aoi
  
  # start and end dates
  sY <- Attr[[charmatch("Period Start Year", names(Attr))]]
  sD <- Attr[[charmatch("Period Start Day", names(Attr))]]
  eY <- Attr[[charmatch("Period End Year", names(Attr))]]
  eD <- Attr[[charmatch("Period End Day", names(Attr))]]
  
  if ( any(c(sY, sD, eY, eD) == 0 ) ){
    sY <- Attr[[charmatch("Start Year", names(Attr))]]
    sD <- Attr[[charmatch("Start Day", names(Attr))]]
    eY <- Attr[[charmatch("End Year", names(Attr))]]
    eD <- Attr[[charmatch("End Day", names(Attr))]]
  } 
  if ( any(c(sY, sD, eY, eD) == 0 ) ){
    prodN <-  Attr[[charmatch("Product Name", names(Attr))]]
    sY <- queryDate(prodN)[['sY']]
    sD <- queryDate(prodN)[['sD']]
    eY <- queryDate(prodN)[['eY']]
    eD <- queryDate(prodN)[['eD']]
  }
  avps[1] <- avg.period(sY, sD, eY, eD)
  	
  # if there are more than one hdf file to process
  if ( ni > 1){
    for ( h in 2:ni ){
    	h5 <- H5File(fileName = file[h])
    	Attr <- attrib.oceancolor(file[h])  
    	h5Cont <- listH5Contents(h5)
    	ndata <- h5Cont$l3m_data$name
    	d <- getH5Dataset(h5, ndata)
      data <- readH5Data(d)
  	  data <- matrix(data, nrow=d@dims[1], byrow=TRUE)
    	data <- data[sort.list(nrow(data):1), ]
  	  dmin <- Attr[[charmatch("Data Minimum", names(Attr))]]  
  	  dmax <- Attr[[charmatch("Data Maximum", names(Attr))]]
    	par.aoi <- data[ylat, xlon]
    	if (scaling != "linear")
  		  stop ("Scaling is not linear, code must be revised. Please contact package maintainer")
  		par.aoi <- (slope * par.aoi) + intercept
    	par.aoi[par.aoi > dmax | par.aoi < dmin] <- NA
  	  D[ , , h] <- par.aoi

      # start and end dates
      sY <- Attr[[charmatch("Period Start Year", names(Attr))]]
  	  sD <- Attr[[charmatch("Period Start Day", names(Attr))]]
  	  eY <- Attr[[charmatch("Period End Year", names(Attr))]]
  	  eD <- Attr[[charmatch("Period End Day", names(Attr))]]
      
    	if ( any(c(sY, sD, eY, eD) == 0 ) ){
    	  sY <- Attr[[charmatch("Start Year", names(Attr))]]
    	  sD <- Attr[[charmatch("Start Day", names(Attr))]]
    	  eY <- Attr[[charmatch("End Year", names(Attr))]]
    	  eD <- Attr[[charmatch("End Day", names(Attr))]]
    	}
    	if ( any(c(sY, sD, eY, eD) == 0) ){
    	  prodN <-  Attr[[charmatch("Product Name", names(Attr))]]
    	  sY <- queryDate(prodN)[['sY']]
    	  sD <- queryDate(prodN)[['sD']]
    	  eY <- queryDate(prodN)[['eY']]
    	  eD <- queryDate(prodN)[['eD']]
    	}
  	  avps[h] <- avg.period(sY, sD, eY, eD)
    }
  }

  satin.obj <- list(longitude = longit, latitude = latit, rs.data = D, 
  							    rs.name = pname, rs.units = punits, period = avps, 
                    itype = "oceancolor")
  attr(satin.obj, "class") <- "satin" 
  return(satin.obj)
}