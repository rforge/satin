\name{xtrSatin}
\alias{xtrSatin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Extract data values from satellite image(s)
}
\description{
  Extract data values for selected pixels from an image created with \code{plotSatin}.
}
\usage{
xtrSatin(satin.obj, points = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{satin.obj}{a satin object as returned by \code{\link{read.oceancolor}}
}
  \item{points}{ a data frame with point longitude and latitude coordinates to extract data values. }
}
\details{
If provided, \code{points} must have two columns with x and y coordinates. When not specified, \code{points} can be  selected by clicking on the image. 
}
\value{
A data frame with at least 6 columns. The first two (``x'' and ``y'') represents the \code{points} argument, either specified or selected by clicking on the image. Columns 4 and 5 (``longitude'' and ``latitude'') are the coordinates of  pixels closer to \code{points}, while column 3 (``d'') represents the distance between them. The remaining column(s) are the parameter values for every image in the \code{satin.obj}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
 Héctor Villalobos
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# load data, define coordinates and extract values
data(dbsst)
plotSatin(dbsst)
coord <- data.frame(x=seq(-130, -114, 2), y=seq(20, 36, 2))
values <- xtrSatin(dbsst, points = coord)
values

# if no points are given the user can select them by clicking on the image
\dontrun{

plotSatin(dbsst)
values2 <- xtrSatin(dbsst) # *** click on the image ***
values2
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
