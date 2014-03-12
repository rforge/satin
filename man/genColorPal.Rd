\name{genColorPal}
\alias{genColorPal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Generating color palettes for satellite data }
\description{
  A color palette is generated with user defined intervals of SST or chlorophyll-a  data. Resulting object is suitable for use in \code{plotSatin} function.
}
\usage{
genColorPal(min, max, length, col)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{min}{ minimum value. }
  \item{max}{ maximum value. }
  \item{length}{ number of colors. }
  \item{col}{ an optional vector of color names to be used. Defaults to a set of colors adequate for this purpose if none is specified. }
}
\details{
  \code{genColorPal} returns a set of colors interpolated via \code{colorRampPalette} and the corresponding breaks in the same units as \code{min} and \code{max} arguments. Resulting vectors of colors and breaks are meant to be supplied to \code{plotSatin} function.  
}
\value{
  A list with componentes
  \item{pal}{ a vector of interpolated colors. }
  \item{breaks}{a vector of color breaks.}
}
%\references{ ~put references to the literature/web site here ~ }
\author{ Héctor Villalobos }
%\note{ ~~further notes~~ 

% ~Make other sections like Warning with \section{Warning }{....} ~
%}
\seealso{ \code{colorRampPalette} }
\examples{
genColorPal(10, 30, length=10)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

