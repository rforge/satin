\name{fileTypeBathy}
\alias{fileTypeBathy}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download integrated land topography and ocean bathymetry data.
}
\description{
To download integrated land topography and ocean bathymetry data from ETOPO1 in several file formats Global Relief Model.
}
\usage{
fileTypeBathy(lons, lats, resolution = 1, filetype)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lons}{
the minimum and maximum desired longitude values, in the range -180W to 180E, or 0 to 360E, regardless of the range of the original data. For example, c(-118, -105.5) is the same that c(242, 254.5).
}
  \item{lats}{
the minimum and maximum desired latitude values, in the range -90S to 90N. Values are in decimal degrees north. For example, c(22.2, 32.5).
}
  \item{resolution}{
a number indicating the spatial resolution of your data in decimal degrees. If filetype is a .png file, this is ignored.
}
  \item{filetype}{
the type of data file that you want to download. For example, you can use one of the following: ".asc", "ESRI.asc", "GoogleEarth", ".grd", ".hdf", ".mat", ".nc", ".ncHeader", "small.png", "medium.png", "large.png", "transparent.png", ".tif", ".xyz"
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
Amante, C. and B. W. Eakins, ETOPO1 1 Arc-Minute Global Relief Model: Procedures, Data Sources and Analysis. NOAA Technical Memorandum NESDIS NGDC-24, 19 pp, March 2009.

\url{http://www.ngdc.noaa.gov/mgg/global/global.html}
}
\author{
Raul O Martinez-Rincon and Héctor Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## Get a ".xyz" of integrated land topography and ocean bathymetry 
## with a spatial resolution of 0.1 degrees of the northwest of Mexico.

## Settings
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
resolution <- 0.1
filetype <- ".xyz"

fileTypeBathy(lons, lats, resolution, filetype)
## The downloaded file ("tmp_254.5E32.5N.xyz") contains 3 columns: 
## longitude (in 0 - 360E format), latitude, and the altimetry

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
