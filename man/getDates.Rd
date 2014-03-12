\name{getDates}
\alias{getDates}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get available dates
}
\description{
To get all available dates of your desired oceanographic data.
}
\usage{
getDates(dataset, timeperiod)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataset}{
the data set of the oceanographic data. Use \code{\link{dataSetQuery}} to get this 7 carchacter "BloomWatch" data set name. For example, "TBAssta" which corresponds to "global" sea surface temperature, with a spatial resolution of 0.1degrees.
}
  \item{timeperiod}{
is the name of a time period. For data files which represent composites of several day's worth of data, the timeperiod indicates the length of the composite. For example, for a 3day time period, if the centered time is 2006-08-04 12:00:00, the data is a composite (the mean) of all satellite passes from 2006-08-03 00:00:00 until 2006-08-06 00:00:00.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Raul O Martinez-Rincon and Héctor Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{dataSetQuery}}, \code{\link{timePeriod}}
}
\examples{
## Make a query of all availables dates of monthly sea surface temperature 
## with a spatial resolution of 0.1degrees

## Query and settings
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
dataset <- "TBAssta" # or 
dataset <- dataSetQuery(dataset = 40)
timePeriod(dataset)
timeperiod <- "1month"
getDates(dataset, timeperiod)

## If you your query gets to many results you can also use
range(getDates(dataset, timeperiod))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
