fileType <-
function(lons, lats, dates, dataset, timeperiod, filetype){
  
  f.type <- c(".asc", "ESRI.asc", "GoogleEarth", ".grd", ".hdf", ".mat", ".nc", 
              ".ncHeader", "small.png", "medium.png", "large.png", 
              "transparent.png", ".tif", ".xyz", "FGDC")
  
  if ( !any(filetype == f.type) ){
    #cat(f.type)
    warning("Not allowed file type")
    stop()
  }
    
  
  centeredTime <- getDates(dataset, timeperiod)
  if (length(centeredTime) < 1){
    stop ("Selected time period is not available")
  }
  
  urlbase <- 'http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp'
  dateCall <- paste(urlbase, '?get=griddata&dataset=', dataset, '&timeperiod=', 
                    timeperiod, '&centeredTime=', sep="")
  string <- readLines(dateCall)
  stind <- regexpr('<span', string)
  tt.stind <- rep(NA, length(stind))
  for(i in 1:length(stind)){ if (stind[i] > -1) {tt.stind[i] <- i} }
  tt.stind <- na.omit(tt.stind)
  allDates <- rep(NA, length(tt.stind))
  for(i in 1:length(tt.stind)){
    str2 <- string[tt.stind[i]:tt.stind[i] + 1]
    stind2 = regexpr('....-..-..', str2)
    for(ii in 1:length(stind2)){
      if (stind2[ii] > -1) {
        allDates[i] <- substring(str2, first = stind2[ii], last = stind2[ii] + 18)
      }
    }
  }
  allDates <- na.omit(allDates)
  centeredTime <- unique(allDates)
  year <- substring(centeredTime, first = 1, last = 4)
  month <- substring(centeredTime, first = 6, last = 7)
  day <- substring(centeredTime, first = 9, last = 10)
  hour <- substring(centeredTime, first = 12, last = 13)
  minute <- substring(centeredTime, first = 15, last = 16)
  second <- substring(centeredTime, first = 18, last = 19)
  satTime <- ISOdatetime(year, month, day, hour, minute, second)
  dates <- strptime(dates, format = "%Y-%m-%d")  
  #for(i in 1:length(lons)){ if (lons[i] < 0) {lons[i] <- lons[i] + 360} }
  xmax <- max(lons)
  xmin <- min(lons)
  ymax <- max(lats)
  ymin <- min(lats)
  tmax <- max(dates)
  tmin <- min(dates)
  tind <- satTime[satTime >= tmin & satTime <= tmax]
  if (length(tind) == 0) {
    stop ("There is not data available for requested dates or area. 
          Use getDates to get available dates of requested variable")
  }
  else{
    for(i in 1:length(tind)){
      dateStr <- substring(tind[i], first = 1, last = 10)
      timeStr <- substring(tind[i], first = 12, last = 19)
      dowloadCall <- paste(urlbase, '?get=griddata&dataset=', dataset, 
                           '&minlon=', xmin, '&maxlon=', xmax, '&minlat=', 
                           ymin, '&maxlat=', ymax, '&timeperiod=', timeperiod, 
                           '&centeredTime=~', dateStr, 'T', timeStr, '&filetype=', 
                           filetype, sep = "")
      destFile <- getwd()
      xmean <- mean(xmax, xmin)
      ymean <- mean(ymax, ymin)
      fileDate <- substring(tind[i], first = 1, last = 10)
      fileOut <- paste(destFile, "/", dataset, "_", i, "_", xmean, "E", ymean, 
                       "N", fileDate, filetype, sep = "")
      download.file(dowloadCall, destfile = fileOut, cacheOK = TRUE, mode = "wb")
    }      
  }    
}
