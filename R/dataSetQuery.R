dataSetQuery <-
function(parameter = NULL, resolution = NULL, others = NULL, 
                         dataset = NULL){
  vars <- unique(dataSetList$Param.name)
    Q1 <- dataSetList  
  if ( !missing(parameter) )
    Q1 <- Q1[agrep(parameter, Q1[, 'Param.name'], ignore.case = TRUE), ]
  if ( !missing(resolution) )
    Q1 <- Q1[agrep(resolution, Q1[, 'Spa.res'], ignore.case = TRUE), ]  
  if ( !missing(others) )
    Q1 <- Q1[agrep(others, Q1[, 'Full.descr'], ignore.case = TRUE), ]
  if ( missing(parameter) & missing(resolution) & missing(others) )
    Q1 <- vars
  if ( !missing(dataset) )
    Q1 <- dataSetList[dataset, 1]
  Q1
}
