###############################################################################
# Setup
###############################################################################

# Client: 
# Author(s): 
# Date created: yyyy mm dd

###############################################################################
# Set the working directory and default paths
###############################################################################

# Get username

username <- sub("/home/GREATESTGOOD/([a-z]_[a-z]*).*", "\\1", getwd())

# Set working directory

setwd(paste("/home/GREATESTGOOD/", username, sep=""))


# Set default paths ()

clientName <- ''
projectName <- ''
serverPath <- '~/Shared/00 Clients - Current/'

rawDatasets <- paste(serverPath, '/', clientName, '/', projectName,
                     '/Structured Data/01 Raw Datasets/', sep="")
workingDatasets <- paste(serverPath, '/', clientName, '/', projectName,
                         '/Structured Data/02 Working Datasets/', sep="")
finalDatasets <- paste(serverPath, '/', clientName, '/', projectName,
                       '/Structured Data/03 Final Datasets/', sep="")
graphics <- paste(serverPath, '/', clientName, '/', projectName,
                  '/Structured Data/04 Graphics and Output Data/', sep="")

code <- '~/Home/Git/'
# Note: put source files in this directory (loaded below) 

###############################################################################
# Load in libraries and source files
###############################################################################

librariesToLoad <- c("plyr", "dplyr", "ggplot2", "lubridate", "reshape2", 
                     "magrittr", "sandwich", "lmtest", "RColorBrewer", 
                     "rmarkdown", "knitr")

#Specify packages here

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

# Load source files 

sourceFiles <- c()

#Specify files with constructor functions here

if(length(sourceFiles > 0))
  sapply(sourceFiles, FUN = function(x) source(paste(code, x, ".R", sep = "")))


###############################################################################
# I: 


# Step 1: 

# Validation:


###############################################################################
# II: 


# Step 1: 

# Validation:
