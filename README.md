### Yelp-Predictions

#### Advice to improve your Business

Predicting user preferences, for items such as for commercial products, movies, and businesses, is an important and well-studied problem in recommendation systems. 
In this project, we investigate potential factors that may affect business performance on Yelp.

Yelp Data are very large, we used MongoDB to import data from yelp site. After that, we extract data from MongoDB to R with library rmongo.
You can find here documents and programs:
* [MongoDataExtraction.r](./MongoDataExtraction.r): R file which explain how to import data from Yelp to MondoDB and create a connection with R, using rmongo
* [predicting_rating_of_a_business.r](./predicting_rating_of_a_business.r): R file whith all the chunks
* [Predicting_rating_of_a_business.Rmd](./Predicting_rating_of_a_business.Rmd): R Markdown document for Yelp prediction project report.
* [Predicting_rating_of_a_business.html](./Predicting_rating_of_a_business.html): Compiled html file for Yelp prediction project report.

#### To find predictions online, please click [here](https://rpubs.com/memed/130555)
