\name{dataSetQuery}
\alias{dataSetQuery}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data set queries of the oceanographic data
}
\description{
To make a query of the oceanographic data availables in the BloomWatch server.
}
\usage{
dataSetQuery(parameter = NULL, resolution = NULL, others = NULL, dataset = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{parameter}{
a character string indicating which oceanographic data is desired.
}
  \item{resolution}{
a character string indicating the desired spatial resolution. For example, 4.4km, 0.1degrees, 0.0125degrees, etc.
}
  \item{others}{
a character string indicating a query based on the full description of the data set. For example, use modis to find all oceanographic data obtained from the Moderate-resolution Imaging Spectroradiometer.
}
  \item{dataset}{
the number indicating the desired data set. For example, if dataset=40 then "TBAssta". This data set corresponds to "global" sea surface temperature, with a spatial resolution of 0.1degrees.
}
}
\details{
All arguments of this function ignore case during matching, that is, words don't differ in meaning based on difering use of uppercase and lowercase letters. You can also use incomplete words, example, "temp", "Temper", "temperatur", etc.
}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
\references{
\url{http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360Info.html}
}
\author{
Raul O Martinez-Rincon and Héctor Villalobos
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
## To see all available oceanographic data use:
dataSetQuery()

## Make a query for temperature, or the same query using incomplete words 
## and ignoring case.
dataSetQuery(parameter = "temperature")
dataSetQuery(parameter = "temPer")
## In both examples you will get 33 posible images containing temperature

## If you want sea surface temperature with a spatial resolution of 
## 0.1 degrees use:
dataSetQuery(parameter = "temperature", resolution = "0.1degrees")
## In this query you will get only 4 options.

## To get the data set id for "SST,Blended,0.1degrees,Global,EXPERIMENTAL" use:
dataSetQuery(dataset = 40)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
