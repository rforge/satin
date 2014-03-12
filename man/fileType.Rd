\name{fileType}
\alias{fileType}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download space and time-oriented oceanographic data
}
\description{
To get space and time-oriented oceanographic data in several common file formats from BloomWatch server.
}
\usage{
fileType(lons, lats, dates, dataset, timeperiod, filetype)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lons}{
the minimum and maximum desired longitude values, in the range -180W to 180E, or 0 to 360E, regardless of the range of the original data. For example, c(-118, -105.5) is the same that c(242, 254.5).
}
  \item{lats}{
the minimum and maximum desired latitude values, in the range -90S to 90N. Values are in decimal degrees north. For example, c(22.2, 32.5).
}
  \item{dates}{
the minimum and maximum dates in ISO 8601 format: YYYY-MM-DD. For example, c("2013-01-01", "2013-06-30").
}
  \item{dataset}{
the data set of the oceanographic data. Use \code{\link{dataSetQuery}} to get this 7 carchacter "BloomWatch" data set name. For example, "TBAssta" which corresponds to "global" sea surface temperature, with a spatial resolution of 0.1degrees.
}
  \item{timeperiod}{
is the name of a time period. For data files which represent composites of several day's worth of data, the timeperiod indicates the length of the composite. For example, for a 3day time period, if the centered time is 2006-08-04 12:00:00, the data is a composite (the mean) of all satellite passes from 2006-08-03 00:00:00 until 2006-08-06 00:00:00.
}
  \item{filetype}{
the type of data file that you want to download. For example, you can use one of the following: ".asc", "ESRI.asc", "GoogleEarth", ".grd", ".hdf", ".mat", ".nc", ".ncHeader", "small.png", "medium.png", "large.png", "transparent.png", ".tif", ".xyz", and "FGDC".
}
}
\details{
This function provides a set of tools to get oceanographic data in several format files. However we strogly recomend to use \code{\link{dataSetQuery}}, \code{\link{timePeriod}}, and \code{\link{getDates}} functions in order to make your query more adequately, due to large database differing in spatial and temporal coverage.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp?get=griddata}
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360Info.html}
}
\author{
Raul O Martinez-Rincon and Héctor Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dataSetQuery}}, \code{\link{timePeriod}}, \code{\link{getDates}}
}
\examples{
## Get "large.png" files of monthly sea surface temperature with a spatial 
## resolution of 0.1degrees of the northwest of Mexico from january to 
## march 2013.

## Query and settings
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
timeperiod <- "1month"
getDates(dataset, timeperiod)
range(getDates(dataset, timeperiod))
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
dates <- c("2013-01-01", "2013-03-30")
filetype <- "large.png"

## download files with oceanographic data
fileType(lons, lats, dates, dataset, timeperiod, filetype)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
