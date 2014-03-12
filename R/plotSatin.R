plotSatin <-
function(satin.obj, image=1, xlim = NULL, ylim = NULL, zlim = NULL, 
   xoffs = 0, yoffs = 0, map = NULL, map.col = "grey", map.outline = "black",  
   colimg = NULL, colbar = TRUE, colbar.pos = "r", main = NULL, main.pos = "tr",
   log = FALSE, ...)
{
  so <- satin.obj
  if ( class(so) != "satin" )
    stop ( "need object of class 'satin'" )
  itype <- so$itype
  if ( itype == "quikscat" ) 
    stop ( "itype must be 'oceancolor or avhrr'" )
  
  fmain.pos <- function(pu, main.pos)
  {
    d <- abs(abs(pu[4]) - abs(pu[3])) * 0.05
    if (main.pos == "tr") {
      cx <- pu[2]
      cy <- pu[4] - d
      pos <- 2
    }
    if (main.pos == "br") {
      cx <- pu[2]
      cy <- pu[3] + d
      pos <- 2
    }
    if (main.pos == "tl") {
      cx <- pu[1]
      cy <- pu[4] - d
      pos <- 4
    }
    if (main.pos == "bl") {
      cx <- pu[1]
      cy <- pu[3] + d
      pos <- 4
    }
    res <- list(cx = cx, cy = cy, pos = pos)
    res
  }
  
  x <- so$longitude
  y <- so$latitude
  z <- so$rs.data[ , , image]
  if ( log == TRUE )
    z <- log10(z)
  if ( missing(main) )
    main <- so$period[image]  
  if ( missing(xlim) ) 
    xlim <- c(floor(min(x)), ceiling(max(x)))
  if ( missing(ylim) ) 
    ylim <- c(floor(min(y)), ceiling(max(y)))
  if ( missing(zlim) ) 
    zlim <- c( min(z, na.rm = TRUE), max(z, na.rm = TRUE) )
  leg <- pretty( zlim[1]:zlim[2] )
  leg.lab <- leg
  if ( log == TRUE ) 
    leg.lab <- 10^leg
	z[z < zlim[1]] <- zlim[1]
  z[z > zlim[2]] <- zlim[2]
  if ( missing(colimg) ) {
    cb <- genColorPal(min = leg[1], max = leg[length(leg)])
    coli <- cb$pal
    spci <- cb$breaks
  } else {
    coli <- colimg$pal
    spci <- colimg$breaks
  }
  lolim <- c(xlim[1] + xoffs, xlim[2] - xoffs)
  lalim <- c(ylim[1] + yoffs, ylim[2] - yoffs)
  cbrw <- (lolim[2] - lolim[1]) * 0.1
  cbtw <- (lalim[2] - lalim[1]) * 0.1
  if ( missing(map) ) {
    map("world", xlim = lolim, ylim = lalim)
    pu <- par("usr")
    image(x, y, t(z), xlim = c(pu[1], pu[2]), ylim = c(pu[3], pu[4]), zlim, 
          col = coli, breaks = spci, xaxt = "n", yaxt = "n", add = TRUE)
    map("world", xlim = lolim, ylim = lalim, col = map.col, fill = TRUE, 
        add = TRUE, ...)
    xyp <- fmain.pos(pu, main.pos)
    text(xyp$cx, xyp$cy, label = main, pos = xyp$pos)
    box(); axis(1); axis(2)
    if (colbar == TRUE) {
      if (colbar.pos == "r") {
        color.legend(xl = pu[2] + cbrw * 0.1, yb = pu[3], xr = pu[2] + 
                     cbrw, yt = pu[4], rect.col = coli, legend = leg.lab, 
                    gradient = "y", cex = 0.8, align = "rb")
      } else {
        color.legend(xl = pu[1], yb = pu[4] + cbrw * 0.1, xr = pu[2], 
                     yt = pu[4] + cbrw, rect.col = coli, legend = leg.lab, 
                    gradient = "x", cex = 0.8, align = "lt")
      }
    }
  } else {
    rimar <- 2.1
    if (colbar == TRUE & colbar.pos == "r")
      rimar <- 6.3
    par(mar = c(5.1, 4.1, 4.1, rimar))
    plot(map, xlim = lolim, ylim = lalim, xaxs = "i", yaxs = "i", axes = FALSE, 
         lty = 0)
    pu <- par("usr")
    image(x, y, t(z), xlim = c(pu[1], pu[2]), ylim = c(pu[3], pu[4]), zlim, 
          col = coli, breaks = spci, xaxt = "n", yaxt = "n", add = TRUE)
    par(new = TRUE)
    plot(map, xlim = lolim, ylim = lalim, xaxs = "i", yaxs = "i", 
         axes = TRUE, lty = 1, col = map.col, border = map.outline, ...)
    xyp <- fmain.pos(pu, main.pos)
    text(xyp$cx, xyp$cy, label = main, pos = xyp$pos)
    box()
    if (colbar == TRUE) {
      if (colbar.pos == "r") {
        color.legend(xl = pu[2] + cbrw * 0.1, yb = pu[3], xr = pu[2] + cbrw, 
                     yt = pu[4], rect.col = coli, legend = leg.lab, gradient = "y", 
                     cex = 0.8, align = "rb")
      } else {
        color.legend(xl = pu[1], yb = pu[4] + cbrw * 0.1, xr = pu[2], 
                     yt = pu[4] + cbtw, rect.col = coli, legend = leg.lab, 
                     gradient = "x", cex = 0.8, align = "lt")
      }
    }
  }
}

