\name{timePeriod}
\alias{timePeriod}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get time periods available of the oceanographic data
}
\description{
To get all time periods available of the oceanographic data.
}
\usage{
timePeriod(dataset)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataset}{
the data set of the oceanographic data. Use \code{\link{dataSetQuery}} to get this 7 carchacter "BloomWatch" data set name. For example, "TBAssta" which corresponds to global sea surface temperature, with a spatial resolution of 0.1degrees.
}
}
\details{
%%
}
\value{
\code{\link{timePeriod}} return a character vector indicating all time periods available for the oceanographic data.

For data files which represent composites of several day's worth of data, the timeperiod indicates the length of the composite. For example, for a 3day time period, if the centered time is 2006-08-04 12:00:00, the data is a composite (the mean) of all satellite passes from 2006-08-03 00:00:00 until 2006-08-06 00:00:00.
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
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
\code{\link{dataSetQuery}}
}
\examples{
## Make a query of all time periods available of global sea surface temperature
## with a spatial resolution of 0.1deggres

dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
