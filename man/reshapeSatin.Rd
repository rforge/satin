\name{reshapeSatin}
\alias{reshapeSatin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Reshape a satin object as a data frame
}
\description{
 An object of class ``satin''  is reshaped as a data frame with longitude, latitude and a column of remote sensed data for every image.
}
\usage{
reshapeSatin(x, direction = "long")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ an object of class ``satin'' or a data frame produced with this function }
  \item{direction}{either ``long'', when one wishes to reshape a satin object as a data frame or ``wide'', when the opposite behavior is desired (see details).}
}
\details{
This is  mainly an utility function called by \code{\link{cutSatin}} function. However, it may be useful when the user wants to arrange the satellite data as a data frame, with rows representing pixels whose longitude and latitude coordinates are in the  first two columns and their data values in the remaining column(s). The attributes describing the type of data and units of the remote sensed variable (``rs.name'' and ``rs.units'', respectively), and the period(s) averaged are preserved. Specifying \code{direction = "wide"} reverses the operation.
}
\value{
When \code{direction = "long"} a data frame with at least three columns: ``x'', ``y'' for longitude and latitude coordinates, and ``rs.data'' for the variable(s). When 
\code{direction = "wide"} a satin object as produced by \code{read.oceancolor}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
 Héctor Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{read.oceancolor}
}
\examples{
data(dbsst)
X <- reshapeSatin(dbsst, direction = "long")
head(X)
attributes(X)
Y <- reshapeSatin(X, direction = "wide")
str(Y)
plotSatin(Y)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
