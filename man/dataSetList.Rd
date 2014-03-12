\name{dataSetList}
\alias{dataSetList}
\docType{data}
\title{
List of the available oceanographic data.
}
\description{
Data frame with oceanographic data available on the BloomWatch  server.
}
\usage{data(dataSetList)}
\format{
  A data frame with 115 rows and 6 columns described below.
  \describe{
    \item{\code{DatasetID}}{name of the dataset. For example, ``TBAssta'' which corresponds to ``global'' sea surface temperature, with a spatial resolution of 0.1degrees.}
    \item{\code{Param.name}}{name of the oceanographic data.}
    \item{\code{Spa.res}}{spatial resolution. For example, 4.4km, 0.1degree, 0.0125degrees, etc.}
    \item{\code{Spa.cov}}{spatial coverage. For example, data can be global or space delimited like ``WestUS''.}
    \item{\code{Spa.cov.descr}}{a brief description of the spatial coverage. For example, if spatial coverage is ``WestUS'' it refers to a squared area covering from 155W to 105W longitude and from 20N to 51N latitude.}
    \item{\code{Full.descr}}{a character vector indicating some attributes of the oceanographic data. For example, ``SST, Blended, 0.1 degrees, Global, EXPERIMENTAL'' indicates that data are sea surface temperature (SST), blended, with spatial resolution of 0.1degrees, global coverage, and it is considered as experimental by BloomWatch server.}
  }
}
%\details{
%%  ~~ If necessary, more details than the __description__ above ~~
%}
\source{
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp?get=griddata}
}
\references{
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360Info.html}
}
\examples{
data(dataSetList)


}
\keyword{datasets}
