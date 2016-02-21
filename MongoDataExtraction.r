#We load the the data into MongoDB...
#Invoke the following commands to import the json data...

## mongoimport --db yelp --collection businesses ./yelp_academic_dataset_business.json 
## mongoimport --db yelp --collection users ./yelp_academic_dataset_user.json
## mongoimport --db yelp --collection reviews ./yelp_academic_dataset_review.json
## mongoimport --db yelp --collection checkins ./yelp_academic_dataset_checkin.json
## mongoimport --db yelp --collection tip ./yelp_academic_dataset_tip.json


#Now open a terminal window as administrator... 

# And Open a second terminal window, then change the master where mongo.exe is located, with:
# Chdir c:\mongodb\bin
# Connect to yelp databse...

# Load the rmongodb library

setwd("C:/mongodb/bin")
library(rmongodb)
library(plyr) ## rbind.fill Combine data.frames by row, filling in missing columns. 

# Create a mongodb connection
con2 <- mongo.create(host = "localhost", db = "yelp")

# Query all the business
allBusiness = data.frame(stringAsFactors = FALSE)
cursor = mongo.find(con2, "yelp.business")
i = 1
while(mongo.cursor.next(cursor))
{
  print(i)
  tmp = mongo.bson.to.list(mongo.cursor.value(cursor))
  #print(tmp)
  tmp.df = as.data.frame(t(unlist(tmp)), stringAsFactors = FALSE)
  allBusiness = rbind.fill(allBusiness, tmp.df)
  i = i + 1
}

save(allBusiness,file="allBusiness.RData")

# Query all the reviews
allReview = data.frame(stringAsFactors = FALSE)
cursor = mongo.find(con2, "yelp.review")
i = 1
while(mongo.cursor.next(cursor))
{
  print(i)
  tmp = mongo.bson.to.list(mongo.cursor.value(cursor))
  #print(tmp)
  tmp.df = as.data.frame(t(unlist(tmp)), stringAsFactors = FALSE)
  allReview = rbind.fill(allReview, tmp.df)
  i = i + 1
}

save(allReview,file="allReview.RData")
# Extracting attributes2 and stars out of data frame, ignoring first 
# row because it was having value <NA>
varnames<-colnames(allReview)
reviewIndex<-grep("text",varnames)
reviewStars<-grep("stars",varnames)
subData2<-allReview[2:nrow(allReview),c(reviewIndex,reviewStars)]
subData2$stars<-as.numeric(subData2$stars)
subData2$stars<-as.numeric(subData2$stars)

# Query all the users votes
allUser = data.frame(stringAsFactors = FALSE)
cursor = mongo.find(con2, "yelp.user")
i = 1
while(mongo.cursor.next(cursor))
{
  print(i)
  tmp = mongo.bson.to.list(mongo.cursor.value(cursor))
  #print(tmp)
  tmp.df = as.data.frame(t(unlist(tmp)), stringAsFactors = FALSE)
  allUser = rbind.fill(allUser, tmp.df)
  i = i + 1
}

save(allUser,file="allUser.RData")

# Extracting user_id and votes out of data frame, ignoring first 
# row because it was having value <NA>
varnames<-colnames(allUser)
userIndex<-grep("user_id",varnames)
userVotes<-grep("votes",varnames)
userReviewCount<-grep("review_count", varnames)
subData3<-allUser[2:nrow(allUser),c(userIndex,userVotes,userReviewCount)]

# Query all the tips
allTips = data.frame(stringAsFactors = FALSE)
cursor = mongo.find(con2, "yelp.tip")
i = 1
while(mongo.cursor.next(cursor))
{
  print(i)
  tmp = mongo.bson.to.list(mongo.cursor.value(cursor))
  #print(tmp)
  tmp.df = as.data.frame(t(unlist(tmp)), stringAsFactors = FALSE)
  allTips = rbind.fill(allTips, tmp.df)
  i = i + 1
}

save(allTips,file="allTips.RData")

# Extracting all features of data frame, ignoring first 
# row because it was having value <NA>

subData4<-allTips[2:nrow(allTips),]