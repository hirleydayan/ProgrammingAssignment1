corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## library(data.table)
        v <- numeric()
        files <- list.files(directory, all.files = FALSE, full.names = TRUE, no.. = TRUE)
        for(f in files) {
                t <- read.csv(f)
                t_cc <- t[complete.cases(t),]
                if (nrow(t_cc) > threshold){
                        v <- c(v,round(cor(t_cc$sulfate,t_cc$nitrate),5))
                } else {
                        v <- c(v,NA)
                }
        }
        v[!is.na(v)]
}