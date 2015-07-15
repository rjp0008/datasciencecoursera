##parses through id files in directory for pollutant specified
##and calculates the mean excluding missing values
pollutantmean <- function(directory, pollutant, id = 1:322){
  ## directory is where the files are located
  count <- 0
  for(file in constructFileList){
    
    dataTable <- read.csv(paste(directory,"\\",file,sep = ""))
    
    dataVector <- NULL
    #pollutant is sulfate or nitrate
    if(pollutant == "sulfate"){
      dataVector <- dataTable$sulfate
    }
    else{
      dataVector <-dataTable$nitrate
    }
  }
  
  dataVector
  ##id is a vector of the sensors to check
  
}

constructFileList <- function(directory,id){
  count <- 0
  fileList <- c()
  for(file in dir(directory)){
    count <- count+1
    if (!is.na(id[id==count]))
    {
      print(count)
      fileList<- c(fileList,file)
    }
  }
  fileList
}