corr <- function(directory,threshold = 0) {
    files <- constructFileListNoId(directory)

    cors <- integer(0)
    for (file in files) {
        dataTable <- read.csv(file)

        nitrate <-
            (dataTable$nitrate[(!is.na(dataTable$nitrate)) &
                                   (!is.na(dataTable$sulfate))])
        if (length((nitrate)) > threshold) {
            sulfateVector <-
                (dataTable$sulfate[(!is.na(dataTable$nitrate)) &
                                       (!is.na(dataTable$sulfate))])
            cors <- c(cors,cor(nitrate,sulfateVector))
        }
    }
    cors
}


constructFileListNoId <- function(directory) {
    files <- dir(directory)
    fileList <- c()
    for (sensor in files) {
        fileList <- c(fileList,paste(directory,"\\",sensor,sep = ""))
    }
    fileList
}
