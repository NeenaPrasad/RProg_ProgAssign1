library(stringr)

source("complete.R")

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        dframe <- complete(directory)
        
        
        id <- dframe[dframe$nobs >= threshold,]$id
        
        
        output <- numeric()
        
        for (i in id){
                fl_name <- paste(directory, "/",str_pad(i,3,pad="0"),".csv", sep="")
                df <- read.csv(fl_name)
                output <- c(output,cor(df$sulfate, df$nitrate,use = "pairwise.complete.obs"))
        }
        
        
        
        output
}