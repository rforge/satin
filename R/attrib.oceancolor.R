attrib.oceancolor <- function(file)
{
	h5 <- H5File(fileName = file)
	attr.n <- listH5Attributes(h5)
  attr.val <- list()
	for ( k in 1:length(attr.n) )
		attr.val[k] <- getH5Attribute(h5, attrName = attr.n[k])[1]
  nch <- nchar(attr.n)
  if ( substr(attr.n[1], nch[1]-6, nch[1]) == "_GLOSDS" )
    attr.n <- substr(attr.n, 1, nch-7)
  names(attr.val) <- attr.n
  attr.val
}