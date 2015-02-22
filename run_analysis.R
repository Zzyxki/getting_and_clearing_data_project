# section 1 read data
train<-read.table("train/X_train.txt")
test<-read.table("test/X_test.txt")
y_train<-read.table("train/y_train.txt")
y_test<-read.table("test/y_test.txt")
feature<-read.table("features.txt")
# section 2 apply names to y_
y_train[y_train=="1"]<-"walking"
y_train[y_train=="2"]<-"walking_upstairs"
y_train[y_train=="3"]<-"walking_downstairs"
y_train[y_train=="4"]<-"sitting"
y_train[y_train=="5"]<-"standing"
y_train[y_train=="6"]<-"laying"
y_test[y_test=="1"]<-"walking"
y_test[y_test=="2"]<-"walking_upstairs"
y_test[y_test=="3"]<-"walking_downstairs"
y_test[y_test=="4"]<-"sitting"
y_test[y_test=="5"]<-"standing"
y_test[y_test=="6"]<-"laying"
# section 3 applying y_ and re-naming
train["Activity"]<-y_train
test["Activity"]<-y_test
feature<-c(as.character(feature$V2),"Activity")
names(train)<-feature
names(test)<-feature
# section 4 selecting and merging
feature_select<-c(1:6,41:16,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,294:296,345:347,373:375,424:426,452:454,503,504,513,516,517,526,529,530,539,542,543,552,562)
train<-train[feature_select]
test<-test[feature_select]
tidy<-merge(train,test,all=TRUE)
write.table(tidy,file="Assignment_4_tidy_data.txt")