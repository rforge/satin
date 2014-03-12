\name{read.oceancolor}
\alias{read.oceancolor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Read satellite data from Oceancolor hdf files
}
\description{
 Remote sensing data downloaded from the Oceancolor web page (see details) for a user defined area is extracted from hdf  files
}
\usage{
read.oceancolor(file, lons, lats)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{ name of the hdf file(s) to be read}
  \item{lons}{ a vector with western- and eastern-most longitudes }
  \item{lats}{ a vector with southern- and northern-most  latitudes }
}
\details{
  This function relies on the \pkg{h5r} package, therefore only hdf version 5 (v5) files can be read. It has been tested with files with data from Aqua Modis and SeaWiFS sensors, downloaded from the oceancolor web page (\url{http://oceancolor.gsfc.nasa.gov/cgi/l3}). These hdf files are available as  v4, but they were converted to v5 with h4h5tools (\url{http://www.hdfgroup.org/h4toh5}). The user must specify the minimum and maximum latitude and longitude limits within the interval (-90,  90) and (-180, 180) respectively. 
}
\value{
 An object of  \code{\link{class}} ``satin'' (a list) with components:
  \item{longitude}{a vector of longitudes of the area of interest (aoi)}
  \item{latitude}{a vector of latitudes of the aoi }
  \item{rs.data}{an array of remote sensed data }
  \item{rs.name}{full name of remote sensed variable}
  \item{rs.units}{variable measurement units}
  \item{period}{date or averaging period}
  \item{itype }{ a string indicating the type of product }
}
\author{
 Héctor Villalobos and Eduardo González-Rodríguez
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
\dontrun{
 
 # read a single file
 sst <- read.oceancolor("A20101822010212.L3m_MO_SST4_4.h5", 
                        lats=c(20, 30), lons=c(-130, -105))

 # read several files residing in a directory 
 setwd("D:/data")
 fi <- list.files(pattern = glob2rx("*.h5"))
 lats <- c(20, 25)
 lons <- c(-115, -110)
 mSST <- read.oceancolor(fi, lats, lons)      

 # plotting the first processed file
 plotSatin(mSST) 

 # plotting the second processed file
 plotSatin(mSST, image = 2)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ hdf }
\keyword{ oceancolor }% __ONLY ONE__ keyword per line
