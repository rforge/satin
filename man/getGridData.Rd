\name{getGridData}
\alias{getGridData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download space grid oceanographic data
}
\description{
To download space and time-oriented oceanographic data from the BloomWatch server.
}
\usage{
getGridData(lons, lats, dates, dataset, timeperiod, keep.nc = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lons}{
 a vector with western- and eastern-most longitudes, in the range -180W to 180E, or 0 to 360E. Values are in decimal degrees. For example, c(-118, -105.5) or c(242, 254.5)
}
  \item{lats}{
a vector with southern- and northern-most  latitudes. Values are in decimal degrees. For example, c(22.2, 32.5)
}
  \item{dates}{
the minimum and maximum dates in ISO 8601 format: YYYY-MM-DD. For example, c("2013-01-01", "2013-06-30")
}
  \item{dataset}{
the data set of the oceanographic data. Use \code{\link{dataSetQuery}} to get this 7 carchacter "BloomWatch" data set name. For example, "TBAssta" which corresponds to "global" sea surface temperature, with a spatial resolution of 0.1degrees
}
  \item{timeperiod}{
is the name of a time period. For data files which represent composites of several day's worth of data, the timeperiod indicates the length of the composite. For example, for a 3day time period, if the centered time is 2006-08-04 12:00:00, the data is a composite (the mean) of all satellite passes from 2006-08-03 00:00:00 until 2006-08-06 00:00:00
}
  \item{keep.nc}{
logical indicating if .nc files are stored in your current working directory
}
}
\details{
This function provides a set of tools to get oceanographic data from the BloomWatch server (\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360Info.html}). However we strogly recomend to use \code{\link{dataSetQuery}}, \code{\link{timePeriod}}, and \code{\link{getDates}} functions in order to make your query more adequately, due to large database differing in spatial and temporal coverage.  The user must specify the minimum and maximum latitude and longitude limits within the interval (-90,     90) and (-180, 180) respectively.
}
\value{
\code{\link{getGridData}} returns an object of  \code{\link{class}} ``satin'' (a list) with components:
\item{longitude}{a vector of longitudes values of selected area.}
\item{latitude}{a vector of latitudes values of selected area.}
\item{rs.data}{an array of three dimensions with downloaded remote sensed data (e.g. sea surface temperature). Dimensios represents: 1 = latitudes; 2 = longitudes; and 3 = time}
\item{rs.name}{a character indicating the name of remote sensed variable or its abreviation}
\item{rs.units}{a character indicating the units of the remote sensed variable}
\item{period}{a character vector indicating downloaded time period}
\item{itype}{a character indicating where oceanographic data were obtained from. For example, "bloomWatch" indicating data were obtained from BloomWatch server}
}
\references{
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp?get=griddata}
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360Info.html}
}
\author{
Raul O Martinez-Rincon and Hector Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dataSetQuery}}, \code{\link{timePeriod}}, \code{\link{getDates}}, \code{\link{plotSatin}}, \code{\link{fileType}}
}
\examples{
## Get monthly sea surface temperature data with a spatial resolution 
## of 0.1degrees of the northwest of Mexico from january to march 2013.

## Query and settings
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
timeperiod <- "1month"
getDates(dataset, timeperiod) # or
range(getDates(dataset, timeperiod))#if you want to see the date's range
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
dates <- c("2013-01-01", "2013-03-30")

## download data
my.sst.data <- getGridData(lons, lats, dates, dataset, timeperiod, keep.nc = FALSE)

## plotting the first downloaded data (i.e. january)
plotSatin(my.sst.data)

## plotting the second downloaded data (i.e. february)
plotSatin(my.sst.data, image = 2)
 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
