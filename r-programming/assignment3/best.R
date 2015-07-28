best <- function(state, outcome){
    ## Read outcome data
    csvData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Input validation
    if(length(csvData$State[csvData$State == state]) == 0)
    {
        stop("invalid state")
    }
    statusToCheckFor <- NULL
    if(outcome != "heart attack"){
        statusToCheckFor <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        if(outcome != "heart failure"){
            statusToCheckFor <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
            if(outcome != "pneumonia"){
                statusToCheckFor <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
                stop("invalid outcome")
            }
        }
    }
    
    ## Return hospital name with lowest 30 day death
    outcome$Hospital.Name[outcome$statusToCheckFor == min(outcome$statusToCheckFor)]
}