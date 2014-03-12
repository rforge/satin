timePeriod <-
function(dataset){
  dataset <- as.character(dataset)
  urlbase <- 'http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp'
  dateCall <- paste(urlbase, '?get=griddata&dataset=', dataset, 
                    "&timePeriod=", sep = '')
  string <- readLines(dateCall)
  stind <- regexpr(paste('dataSet=', dataset, "&amp;timePeriod=", 
                         sep = ""), string)  
  tt.stind <- rep(NA, length(stind))
  for(i in 1:length(stind)) {if (stind[i] > -1) {tt.stind[i] <- i} }
  tt.stind <- na.omit(tt.stind)
  allDates <- rep(NA, length(tt.stind))
  for(i in 1:length(tt.stind)){
    str2 <- string[tt.stind[i]]
    tp <- strsplit(str2, split=";")[[1]][4]
    tp <- strsplit(tp, split="=")[[1]][2]
    tp <- strsplit(tp, split="&")[[1]][1]
    allDates[i] <- tp    
  }
  allDates <- na.omit(allDates)
  centeredTime <- unique(allDates)
  print(centeredTime)
}
