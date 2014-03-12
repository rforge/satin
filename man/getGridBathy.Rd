\name{getGridBathy}
\alias{getGridBathy}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Download integrated land topography and ocean bathymetry data
}
\description{
To download integrated land topography and ocean bathymetry data from ETOPO1 Global Relief Model.
}
\usage{
getGridBathy(lons, lats, resolution = 1, keep.nc = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lons}{
a vector with western- and eastern-most longitudes, in the range -180W to 180E, or 0 to 360E. Values are in decimal degrees. For example, c(-118, -105.5) or c(242, 254.5)
}
  \item{lats}{
a vector with southern- and northern-most  latitudes. Values are in decimal degrees. For example, c(22.2, 32.5)
}
  \item{resolution}{
a number indicating the spatial resolution of your data. Values are in decimal degrees.
}
  \item{keep.nc}{
logical indicating if .nc files are stored in your current working directory
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\code{\link{getGridBathy}} returns an object of  \code{\link{class}} ``satin'' (a list) with components:
\item{longitude }{a vector of longitudes values of selected area. Values are in the format -180W to 180E}
\item{latitude }{a vector of latitudes values of selected area}
\item{tb.data }{an array with downloaded data (i.e. topography and bathymetry)}
\item{itype }{a character indicating where data were obtained from. For example, "ETOPO1" indicating data were obtained from ETOPO1 Global Relief Model.}

}
\references{
Amante, C. and B. W. Eakins, ETOPO1 1 Arc-Minute Global Relief Model: Procedures, Data Sources and Analysis. NOAA Technical Memorandum NESDIS NGDC-24, 19 pp, March 2009.

\url{http://www.ngdc.noaa.gov/mgg/global/global.html}
}
\author{
Raul O Martinez-Rincon and Hector Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{fileTypeBathy}}
}
\examples{
## Get land topography and ocean bathymetry of the northwest of Mexico 
## with a spatial resolution of 0.05 degrees.

## Settings
lons <- c(-118, -105.5)
lats <- c(22.2, 32.5)
resolution <- 0.05

my.data <- getGridBathy(lons, lats, resolution, keep.nc = FALSE)
names(my.data)
range(my.data$tb.data)

## Create color palettes for bathymetry and topography data.
bathy.pal <- colorRampPalette(c("navyblue", "blue3", "blue", "cyan"))
topo.pal <- colorRampPalette(c("#2F6503", "#D3D19E", "#D3A744", "#988618",
                               "#4C3516"))

## Create a map with bathymetry and topography data.
filled.contour(x = my.data$longitude, y = my.data$latitude, 
               t(my.data$tb.data[, , 1]), zlim = c(-5000, 4000), nlevels = 30, 
               col = c(bathy.pal(10), topo.pal(20)))

## Only bathymetry
filled.contour(x = my.data$longitude, y = my.data$latitude, 
               t(my.data$tb.data[, , 1]), zlim = c(-5000, 0), nlevels = 30, 
               color.palette = bathy.pal)

## Only topography
filled.contour(x = my.data$longitude, y = my.data$latitude, 
               t(my.data$tb.data[,,1]), zlim = c(0, 4000), nlevels = 30, 
               color.palette = topo.pal)
               
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
