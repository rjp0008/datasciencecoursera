##parses through id files in directory for pollutant specified
##and calculates the mean excluding missing values
pollutantmean <- function(directory, pollutant, id = 1:322){
  ## directory is where the files are located
  dataVector <- NULL
  for(file in constructFileListNoDirectory(directory,id)){
    
    dataTable <- read.csv(paste(directory,"\\",file,sep = ""))
    

    #pollutant is sulfate or nitrate
    if(pollutant == "sulfate"){
      dataVector <- c(dataVector, dataTable$sulfate)
    }
    else{
      dataVector <- c(dataVector, dataTable$nitrate)
    }
  }
  
  mean(dataVector[!is.na(dataVector)])
  ##id is a vector of the sensors to check
  
}

constructFileListNoDirectory <- function(directory,id){
  count <- 0
  fileList <- c()
  for(file in dir(directory)){
    count <- count+1
    if (length(id[id==count])>0)
    {
      fileList<- c(fileList,file)
    }
  }
  fileList
}