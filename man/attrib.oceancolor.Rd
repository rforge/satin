\name{attrib.oceancolor}
\alias{attrib.oceancolor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Read attributes from an HDF file
}
\description{
 This function reads all the attributes or metadata from an HDF5 file
}
\usage{
attrib.oceancolor(file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{name of an HDF file}
}
\details{
  This function relies on the \pkg{h5r} package, therefore only HDF5 files can be read. It has been tested on  files with data from Aqua Modis and SeaWiFS sensors, downloaded from the oceancolor web page (\url{http://oceancolor.gsfc.nasa.gov/cgi/l3}). These are available as HDF4 files, but they were converted to HDF5 with \emph{h4h5tools} (\url{http://www.hdfgroup.org/h4toh5})
}
\value{
A named list with the attributes of the HDF file
}
\references{
OceanColor Web (2013-10-30). Ocean Level-3 SMI Data Products document \url{http://oceancolor.gsfc.nasa.gov/DOCS/Ocean_Level-3_SMI_Products.pdf}. OceanColor Documents. Retrieved on 2013-10-30.
}
\author{ Héctor Villalobos }

\seealso{
 \code{\link{getH5Attribute}}, \code{\link{listH5Attributes}}
}
\examples{
\dontrun{

attrib.oceancolor("A20131052013112.L3m_8D_NSST_4.h5")
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd1 }% __ONLY ONE__ keyword per line
