\name{climatology}
\alias{climatology}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Summarize several periods of satellite data}
\description{
  Calculate coverage, mean, standard deviation, minimum and maximum by pixel for a set of satellite images
}
\usage{
climatology(satin.obj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{
   a satin object with several images as returned by \code{\link{read.oceancolor}} or \code{\link{getGridData}}
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
 An object of  \code{\link{class}} ``satin'' (a list) with components:
  \item{longitude}{a vector of longitudes}
  \item{latitude}{a vector of latitudes}
  \item{rs.data}{an array with coverage, sum, mean, standard deviation, minimum and
        maximum for every latitude longitude of extracted SST or Chl-a values }
  \item{rs.name}{full name of remote sensed variable}
  \item{rs.units}{variable measurement units}
  \item{period}{a character vector indicating "coverage", "mean", "std. dev.", ..., 
        and dates for summarized periods}
  \item{itype }{ a string indicating the type of product }
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{ Héctor Villalobos }
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{ \code{\link[satin]{scaleSatin}}}
%% ~~objects to See Also as \code{\link{help}}, ~~~

\examples{
\dontrun{
 fl <- list.files() # Directory with 5 hdf files of sst data
 Msst <- read.oceancolor(fl, lats=c(20, 30), lons=c(-120, -110) )
 cMsst <- climatology(Msst)
 plotSatin(cMsst)
 plotSatin(cMsst, file=2) }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
