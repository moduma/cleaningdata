  library(dplyr);
    
    #Read files
    Y_train <- read.table("./wdir/projData/UCI HAR Dataset/train/Y_train.txt",header=FALSE);
    X_train <- read.table("./wdir/projData/UCI HAR Dataset/train/X_train.txt",header=FALSE);
    subject_train <- read.table("./wdir/projData/UCI HAR Dataset/train/subject_train.txt",header=FALSE);
    Y_test <- read.table("./wdir/projData/UCI HAR Dataset/test/Y_test.txt",header=FALSE);
    X_test <- read.table("./wdir/projData/UCI HAR Dataset/test/X_test.txt",header=FALSE);
    subject_test <- read.table("./wdir/projData/UCI HAR Dataset/test/subject_test.txt",header=FALSE);
    features <- read.table("./wdir/projData/UCI HAR Dataset/features.txt",header=FALSE);
    activity_label <- read.table("./wdir/projData/UCI HAR Dataset/activity_labels.txt",header=FALSE);
    
    #Merge files here
    X_all <- (rbind(X_train,X_test));
    Y_all <- (rbind(Y_train,Y_test));
    subject_all <- (rbind(subject_train,subject_test));
    
    #Assign names to the features table
    revfeatures<-setNames(features,c("id","varname"));
    
    
    #Get columns with mean and standard deviation
    reqFeatures <- revfeatures[grepl("^.+(std|mean)",revfeatures$varname),];
    X_new <- X_all[reqFeatures$id];
    
    X_newwithnames <- setNames(X_new,reqFeatures$varname);
    
    #merge with subject and labels (Y values)
    subject <- setNames(subject_all,"sub");
    label <- setNames(Y_all,"label");
    
    activity_label<-setNames(activity_label,c("id","label"));
    actLabel<- data.frame(label=label,act=activity_label[label$label,]);
    labelName <- actLabel$act.label;
    allData <- cbind(label,labelName,subject,X_newwithnames);
    
    summaryData <- allData %>% group_by(sub,labelName) %>% summarise_each(funs(mean));
    
    #drop the label column
    summaryData <- summaryData[,!names(summaryData) %in% c("label")];
    
    write.table(summaryData,"./wdir/projData/projectSummary.txt",row.name=FALSE);
