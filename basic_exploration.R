###############################################################################
# Setup
###############################################################################

# Author(s): 
# Date created: yyyy mm dd

###############################################################################
# Set the working directory and default paths
###############################################################################

# Set working directory

setwd("C:/Users/t_blaser/Desktop/Working/GitHub/wnv")


###############################################################################
# Load in libraries and source files
###############################################################################

librariesToLoad <- c("plyr", "dplyr", "ggplot2", "lubridate", "reshape2", 
                     "magrittr", "sandwich", "lmtest", "RColorBrewer", 
                     "rmarkdown", "knitr", "GISTools", "Rcpp",
                     "readr", "ggmap")

sapply(librariesToLoad, function(package) {
  if(require(package, character.only=TRUE)){     
    print(paste(package, "loaded correctly", sep=" "))
  } else {
    print(paste("Installing", package, sep=" "))
    install.packages(package)
    if(require(package, character.only=TRUE)){
      print(paste(package, "loaded correctly", sep=" "))
    } else {
      stop(paste("Could not install", package, sep=" "))
    }
  }
})

###############################################################################
# I: Bring in data

# Step 1: 

weather <- read_csv('input/weather.csv')
spray <- read_csv('input/spray.csv')
test <- read_csv('')

datasets <- list('test', 'train', 'spray', 'weather', 'sampleSubmission')

lapply(datasets, function(x) {
  assign(x,
         value = read_csv(paste0('input/', x, '.csv')),
         envir = .GlobalEnv)
  })

camel_to_underscore <- function(x) {
    sub('^(\\w?)', '\\L\\1', x, perl = T) %>%
    gsub('([[:upper:]])', '_\\1', .) %>%
    tolower()
}

# can't lapply this...

names(weather) <- sapply(names(weather), camel_to_underscore)
names(train) <- sapply(names(train), camel_to_underscore)
names(test) <- sapply(names(test), camel_to_underscore)
names(spray) <- sapply(names(spray), camel_to_underscore)



###############################################################################
# II: 


# Step 1: 

# Validation:
 