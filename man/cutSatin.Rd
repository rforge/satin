\name{cutSatin}
\alias{cutSatin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Cut an area of interest from satellite images
}
\description{
 Select and cut a polygon shaped area of interest (aoi) from satellite images
}
\usage{
cutSatin(satin.obj, polygon = NULL, return.poly = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{
  a satin object as returned by \code{read.oceancolor}
}
  \item{polygon}{
  a polygon defining the aoi to be cut
}
\item{return.poly}{
  if TRUE \code{\link{cutSatin}} returns a list with two elements: an object class satin and an object class data.frame (polygon), otherwise an object class satin only
}
}
\details{
 If provided, the polygon defining the aoi must have two columns with x and y  coordinates. The function assures that the last point is exactly the same as the first one. When not specified, the user can define the polygon by a series of clicks on the previously displayed image. The result is a list containing the polygon and a ``satin'' object with  the same dimensions as the original, but where the pixels outside the aoi are set to NA.
}
\value{
An object of class ``satin''  as returned by \code{\link{read.oceancolor}}.

When \code{return.poly = TRUE}, a list with two components:
 \item{aoi}{``satin'' object}
 \item{polygon}{polygon coordinates defining the aoi}

}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
 Héctor Villalobos
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{read.oceancolor}}, \code{\link{getpoly}} 
}
\examples{
# load and display sample data
data(dbsst)
plotSatin(dbsst)
  
# define polygon, cut the image and display the aoi
polyg <- data.frame(x = c(-125, -126, -120, -119, -125), y = c(35, 30, 28, 34, 35))
dbsst.cut <- cutSatin(dbsst, polygon = polyg)
plotSatin(dbsst.cut)

\dontrun{ 

# the same, but polygon is defined by clicking on the image
plotSatin(dbsst)
dbsst.cut <- cutSatin(dbsst, return.poly = TRUE) # *** draw the aoi polygon ***
dbsst.cut$polygon # show polygon coordinates
plotSatin(dbsst.cut$aoi) # plot the selected aoi
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
