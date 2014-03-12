satinSummary <- function(satin.obj, plot = FALSE){
  Dates <- as.Date(satin.obj$period)
  param <- satin.obj$rs.data
  
  df.out <- data.frame(Dates = Dates)
  df.out$Mean <- apply(param, 3, mean, na.rm = TRUE)
  df.out$Min <- apply(param, 3, min, na.rm = TRUE)
  df.out$Max <- apply(param, 3, max, na.rm = TRUE)
  df.out$Std.dev <- apply(param, 3, sd, na.rm = TRUE)
  
  if ( plot == TRUE ){
    df.plot <- reshapeSatin(satin.obj)[, -c(1:2)]
    names(df.plot) <- Dates
    df.plot <- stack(df.plot)
    names(df.plot) <- c("Param", "Dates")
    boxplot(df.plot$Param ~ df.plot$Dates)
  }
    
  return(df.out)
  
}