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
        
        df <- data.frame(id = integer(), nobs = integer())
        for(i in id) {
                f <- paste(directory,"/",sprintf("%03d", i),".csv",sep = "")
                t <- read.csv(f)
                cc <- complete.cases(t)
                df <- rbind(df, data.frame(id = i, nobs = sum(cc)))
        }
        df
}