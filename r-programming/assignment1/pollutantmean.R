##parses through id files in directory for pollutant specified
##and calculates the mean excluding missing values
pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## directory is where the files are located
    dataVector <- NULL
    for (file in constructFileListNoDirectory(directory,id)) {
        dataTable <- read.csv(paste(directory,"\\",file,sep = ""))


        #pollutant is sulfate or nitrate
        removeNas <- NULL
        if (pollutant == "sulfate") {
            removeNas <-  dataTable$sulfate
        }
        else{
            removeNas <- dataTable$nitrate

        }
        removeNas <- removeNas[!is.na(removeNas)]
        dataVector <- c(dataVector,removeNas)
    }


    mean(dataVector[!is.na(dataVector)])
    ##id is a vector of the sensors to check

}


constructFileListNoDirectory <- function(directory,id) {
    files <- dir(directory)
    fileList <- c()
    for (sensor in id) {
        fileList <- c(fileList,files[sensor])
    }
    fileList
}
