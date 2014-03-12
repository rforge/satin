\name{dchla}
\alias{dchla}
\docType{data}
\title{
 Chlorophyll sample data - Aqua Modis sensor
}
\description{
  Mean chlorophyll-a concentration in April 15-22 2013 off northwest Mexico
}
\usage{data(dchla)}
\format{
A list of 7

 $ longitude  : a vector of longitudes (length=600)
 
 $ latitude   : a vector of latitudes (length=528) 
 
 $ rs.data       : an array [528, 600, 1] of mean chlorophyll-a concentration
 
 $ rs.name : character string of variable full name ("Chlorophyll a concentration")
 
 $ rs.units: character string of variable units ("mg m^-3")
 
 $ period     : character string of averaging period in data ("2013 Apr 15-22")
 
 $ itype      : character string giving the type of data ("oceancolor")
  
 - attr(*, "class")= chr "satin"
}
\details{
Source data file (A20131052013112.L3m_8D_CHL_chlor_a_4km.bz2) was obtained from the link below, then uncompressed and converted to hdf v5 with h4h5tools (\url{http://www.hdfgroup.org/h4toh5}) before being processed with the \code{\link{read.oceancolor}} function.   The selected area covers from 20 to 42 degrees of latitude North and from 130 to 105 degrees of longitude West.
}
\source{
  \url{http://oceancolor.gsfc.nasa.gov/cgi/l3}
}
\references{
  \url{http://oceancolor.gsfc.nasa.gov/DOCS/publications.html}
}
\examples{
data(dchla)
str(dchla)
plotSatin(dchla)

## view it in logarithmic scale
plotSatin(dchla, log=TRUE)
}
\keyword{datasets}


