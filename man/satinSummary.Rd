\name{satinSummary}
\alias{satinSummary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summaryze oceanographic data obtained with \code{getGridData} or \code{read.oceancolor}.
}
\description{
This functions returns some statistics values of oceanographic data, optionally returns a boxplot with aggregated oceanographic data by dates.
}
\usage{
satinSummary(satin.obj, plot = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{
a satin object with satellite data as returned by read.oceancolor
}
\item{plot}{
if TRUE \code{satinSummary} makes a boxplot with aggregated oceanographic data by dates
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\code{\link{satinSummary}} returns a dataframe with some statiscal vaules.
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Raul O Martinez-Rincon
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## Lets get some data from BloomWatch server
lons <- c(-111, -109)
lats <- c(22, 24)
dates <- c("2013-01-01", "2013-11-30")

dataSetQuery("temp", other = "MODIS")

sst.id <- dataSetQuery(dataset = 52)#WeastUS data

timeperiod <- "1month"

datos.sst <- getGridData(lons, lats, dates, sst.id, timeperiod)

## Just values
satinSummary(datos.sst)

## Values and boxplot
satinSummary(datos.sst, plot = TRUE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
