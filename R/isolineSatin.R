isolineSatin <-
function(satin.obj, levels, image=1, plot=TRUE)
{
  so <- satin.obj
  if ( class(so) != "satin" )
    stop ( "need object of class 'satin'" )
  mz <- so$rs.data[ , , image]
  
#  if ( so$itype == "oceancolor" ) {
    GRID <- list(x = so$longitude, y = so$latitude, z = t(mz))
    CL <- contourLines(GRID, levels = levels)
    isoLine <- convCP(CL)
    attr(isoLine$PolySet, "projection") <- "LL"
  if (plot == TRUE)
    plotMap(isoLine$PolySet)
  isoLine
#    } else { 
#     stop ( "need 'OceanColor' data")
#    }
}

