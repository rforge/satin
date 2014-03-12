getDates <-
function(dataset, timeperiod){
  dataid <- dataset
  duration <- timeperiod
  urlbase <- 'http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp'
  dateCall <- paste(urlbase, '?get=griddata&dataset=', dataid, '&timeperiod=', 
                    duration, '&centeredTime=', sep="")
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
  centeredTime
}
