genColorPal <-
function(min, max, length, col=NULL)
{
  if ( missing(length) )
    length <- (max - min) * 10 + 1
  if ( missing(col) ) 
    col=c("purple", "blue", "darkblue", "cyan", "green", "darkgreen", "yellow",
          "orange", "red", "darkred")
  fpal <- colorRampPalette(colors = col)
  seqb <- seq(min, max, length.out = length)
  nbcols = length(seqb) - 1
  result <- list(pal = fpal(nbcols), breaks = seqb)
  result
}

