\name{isolineSatin}
\alias{isolineSatin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Obtaining isolines from satellite data }
\description{
  User defined isolines are calculated from satellite data and returned as polylines
}
\usage{
isolineSatin(satin.obj, levels, image = 1, plot = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{ a satin object as returned by \code{read.oceancolor} }
  \item{levels}{ vector of desired isolines }
  \item{image}{ number of image to process }
  \item{plot}{ logical, if \code{TRUE} a plot is produced (the default) }
}
\details{
  Polyline coordinates of desired isolines are calculated via \code{contourLines} and \code{convCP} (from \pkg{PBSMapping} package). Perhaps only interesting with sea surface temperatures (isotherms).
}
\value{
  a data frame object of class "PolySet". See \code{help(PolySet)} for a complete description
}
\author{ Héctor Villalobos, from code in examples of \pkg{PBSMapping} package}
\references{
  Schnute, J.T., Boers, N.M., Haigh, R. and Couture-Beil, A. 2011. PBS Mapping 2.62: user's guide revised from Canadian Technical Report of Fisheries and Aquatic Sciences 2549:vi + 112 p. Last updated Feb 29, 2011.
}
\seealso{ \code{\link{contourLines}}, \code{convCP}, \code{PolySet} }
\examples{
data(dbsst)
sst0.5 <- scaleSatin(dbsst, extent=0.5) 
isolin <- isolineSatin(sst0.5, levels=c(13, 17, 21))
plotSatin(dbsst)
addLines(isolin$PolySet, col="black")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line