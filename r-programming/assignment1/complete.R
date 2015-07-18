complete <- function(directory,id = 1:332) {
    files <- constructFileList(directory,id)

    counts <- c()
    for (file in files) {
        dataTable <- read.csv(file)

        counts <-
            c(counts,length(dataTable$ID[(!is.na(dataTable$nitrate)) &
                                             (!is.na(dataTable$sulfate))]))
    }
    data.frame(id = id,nobs = counts)
}


constructFileList <- function(directory,id) {
    files <- dir(directory)
    fileList <- c()
    for (sensor in id) {
        fileList <- c(fileList,paste(directory,"\\",files[sensor],sep = ""))
    }
    fileList
}
