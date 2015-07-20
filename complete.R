library(stringr)


complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        output <- data.frame(id = numeric(),nobs=numeric())
        for (i in id){
                fl_name <- paste(directory, "/",str_pad(i,3,pad="0"),".csv", sep="")
                df <- read.csv(fl_name)
                output <- rbind(output, data.frame(id=i,nobs = sum(complete.cases(df))))        
        }
        
        output
        
        
}

