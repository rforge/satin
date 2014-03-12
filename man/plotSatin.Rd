\name{plotSatin}
\alias{plotSatin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Easy maps from satellite data
}
\description{
 Visualisation of satellite data (mainly SST and chlorophyll-a concentration) from Aqua Modis and SeaWiFS products.
}
\usage{
plotSatin(satin.obj, image = 1, xlim = NULL, ylim = NULL, 
          zlim = NULL, xoffs = 0, yoffs = 0, map = NULL, 
		      map.col = "grey", map.outline = "black", 
		      colimg = NULL, colbar = TRUE, colbar.pos = "r", 
		      main = NULL, main.pos = "tr", log = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{
 a satin object with satellite data as returned by \code{read.oceancolor}
}
  \item{image}{ number of image to plot }
  \item{xlim}{ minimum and maximum longitude values for the map }
  \item{ylim}{ minimum and maximum latitude values for the map }
  \item{zlim }{ minimum and maximum parameter values for the map }
  \item{xoffs}{ a value to add/substract from \code{xlim} to help centering the map and the image }
  \item{yoffs}{ a value to add/substract from \code{ylim} to help centering the map and the image }
  \item{map}{ a user defined map of class "sp" }
  \item{map.col}{ color for the map }
  \item{map.outline}{ color for the map outline }
  \item{colimg}{ a list with a vector of color names and a vector of color breaks as returned by \code{genColorPal} }
  \item{colbar}{ logical. If \code{TRUE} a color bar is added to the plot  }
  \item{colbar.pos}{ position of the color bar. Either top "t" or right "r" side }
  \item{main}{ title for the plot, defaults to \code{period} in \code{satin.obj} }
  \item{main.pos}{ position for the title: top right ("tr"), top left ("tl"), bottom right ("br") or bottom left ("bl")  }
  \item{log}{ logical. If \code{TRUE} the common (i.e., base 10) logarithm of the parameter is obtained and mapped. This may be useful for chlorophyll concentration data}
  \item{\dots}{ further arguments to pass to \code{plot} }
}
\details{
  The only mandatory argument for this function to produce a map is an object of class "satin" (\code{satin.obj}), which contains the longitude and latitude vectors and the corresponding parameter array (SST or chlorophyll concentration). All the other arguments are optional and are conceived to customize the map produced.  
}
\value{
 a map of the corresponding parameter is produced
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{ Héctor Villalobos }
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{read.oceancolor}}%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# SST data (Aqua Modis)
data(dbsst)
plotSatin(dbsst)
plotSatin(dbsst, map=dmap, colbar.pos="t")

# Chl-a concentration data (Aqua Modis) in actual units and in logarithmic scale
data(dchla)
plotSatin(dchla, map=dmap, xlim=c(-130, -105), ylim=c(20, 40))
x11()
plotSatin(dchla, map=dmap, xlim=c(-130, -105), ylim=c(20, 40), log = TRUE)  
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
