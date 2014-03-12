\name{scaleSatin}
\alias{scaleSatin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Spatial re-scaling of satellite data }
\description{
  This function down-scales satellite data by quadrants of user defined size (in degrees), calculating the value given by a function.
}
\usage{
scaleSatin(satin.obj, extent = 1, FUN = mean, format = "wide")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{ satin object as returned by \code{read.oceancolor}}
  \item{extent}{ size in degrees of the squared quadrant for the summary }
  \item{FUN}{ summary function, defaults to \code{mean}}
  \item{format}{ Default is \code{format = "wide"}, producing a satin object suitable for creating a map with \code{plotSatin}. When \code{format = "long"}, a four column data frame with longitude, latitude, period and parameter values is produced.}
}
\value{
If \code{format = "wide"} (the default), a satin object as produced by \code{read.oceancolor}. 

If \code{format="long"}, a data frame with columns: longitude, latitude, period and parameter values.
}
\author{ Héctor Villalobos }

%\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
data(dbsst)
sst0.5 <- scaleSatin(dbsst, extent = 0.5) 
plotSatin(sst0.5)

scaleSatin(dbsst, extent = 1, format = "long")
}

