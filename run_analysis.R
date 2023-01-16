library("tidyr")
library("dplyr")


# load variable labels
var_labels <- read.table("data/features.txt", header = FALSE, col.names = c("index", "var_label") )

# load training data and merge columns 
train_subject <- read.table("data/train/subject_train.txt", header = FALSE, col.names = c("subject"))
train_var <- read.table("data/train/X_train.txt", header = FALSE)
colnames(train_var) <- var_labels$var_label
train_label <- read.table("data/train/y_train.txt", header = FALSE, col.names = c("activity"))
train <- cbind(train_subject, train_var, train_label)

# load test data and merge columns
test_subject <- read.table("data/test/subject_test.txt", header = FALSE, col.names = c("subject"))
test_var <- read.table("data/test/X_test.txt", header = FALSE)
colnames(test_var) <- var_labels$var_label
test_label <- read.table("data/test/y_test.txt", header = FALSE, col.names = c("activity"))
test <- cbind(test_subject, test_var, test_label)

# bind training and test data 
data <- rbind(train, test)

# select only measurements on mean and std
data <- data[, grep(pattern="subject|*mean()*|*std()*|activity", colnames(data))]

# join data and activity_labels and alter result to only show real labels in activity column
activity_labels <- read.table("data/activity_labels.txt", header = FALSE, col.names = c("key", "activity_label"))
data <- merge(x=data,y=activity_labels, by.x="activity",by.y = "key")
data <- subset(data, select = -c(activity))
names(data)[names(data) == 'activity_label'] <- 'activity'

# group data by subject and activity and calculate mean for every measurement
result <- data
result <- result %>% 
  group_by(activity, subject) %>%
  summarise_all("mean")

# export data
write.table(result, file="result.txt" , row.name=FALSE)