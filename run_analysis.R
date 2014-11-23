combine <- function(){
  
  ## Written by Sanjay Patel
  ## Part of course assignment
  ## Combines the training and test data sets
    
  ## Combine the X attribute data
  dat <- read.table("./test/X_test.txt", stringsAsFactors=FALSE)
  dat2 <- read.table("./train/X_train.txt", stringsAsFactors=FALSE)
  x_dat <- rbind(dat, dat2)
  
  ## Combine the Y attribute data
  dat <- read.table("./test/y_test.txt", stringsAsFactors=FALSE)
  dat2 <- read.table("./train/y_train.txt", stringsAsFactors=FALSE)
  y_dat <- rbind(dat, dat2)
  
  ## Combine the subject attribute data
  dat <- read.table("./test/subject_test.txt", stringsAsFactors=FALSE)
  dat2 <- read.table("./train/subject_train.txt", stringsAsFactors=FALSE)
  subject_dat <- rbind(dat, dat2)
  
  ## Read in teh features and activities tables
  act_lab <- read.table("./activity_labels.txt", stringsAsFactors=FALSE)
  feat_lab <- read.table("./features.txt", stringsAsFactors=FALSE)
  feat_lab.T <- t(feat_lab[,2:ncol(feat_lab)])
  colnames(x_dat) <- feat_lab.T[1,]
  
  ## Limit columns to std and mean
  meanList <- grep("mean", feat_lab[,2])
  stdList <- grep("std", feat_lab[,2])
  fullList <- append(meanList, stdList, length(meanList))
  
  subsetData <- x_dat[, fullList]
  
  ## Add Subject data to the raw data and then add the activity labels
  subsetData <- cbind(subject_dat, subsetData)
  subsetData <- cbind(y_dat, subsetData)
  
  ## Replace the activity code with a text label 
  for(i in 1:nrow(subsetData)){
    subsetData[i,1]<-act_lab[subsetData[i,1],2]
  }
  
  ## Add names to the column labels for the Activity and Subject columns
  colnames(subsetData)[1] <- "Activity"
  colnames(subsetData)[2] <- "Subject"
  
  ## Melt the data into a tidy dataset and calculate the means
  subsetData <- melt(subsetData, id.vars=c("Activity", "Subject"))
  subsetData <- ddply(subsetData, c("Subject", "Activity", "variable"), summarise,
                      mean = mean(value))
  
  ## write the output to a file
  write.table(subsetData, file = "Run Analysis.txt", sep = "\t", row.name=FALSE)  
}