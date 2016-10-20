---
layout:  page
title: "k-NN Confidence Intervals"
comments:  true
published:  true
author: "Bryan Holman"
date: 2016-10-20 13:39:00
categories: [R, 'k-NN', 'Machine Learning']
output:
  html_document:
    mathjax:  default
    fig_caption:  true
---



I started working through the book [Machine Learning with R](https://www.amazon.com/Machine-Learning-Second-Brett-Lantz/dp/1784393908/ref=pd_sbs_14_img_0?_encoding=UTF8&psc=1&refRID=2SQBZ86HTA2WZKSTP4NW) and I am already loving it. In chapter 3, Mr. Lantz introduces the k-nearest neighbors (k-NN) classification algorithm and gives an example of how to use it to detect breast cancer. The data he uses come from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/). 

Mr. Lantz implements k-NN on two transformations of the data, one that has been normalized and one that has undergone z-score standardization. He implemented the algorithm on each dataset once, and found that the normalized dataset had a higher prediction accuracy (98%) than the z-score standardized dataset (95%). However, on the final page of the chapter he notes that running the k-NN algorithm with a different set of training/test data will produce different results.

With that in mind, I wanted to first replicate the analysis he does as well as perform the k-NN algorithm many times to answer three questions:

* Does the normalized dataset really yield higher quality predictions?
* What is the expected value of the prediction accuracy for the k-NN algorithm on this dataset?
* What is the 95% confidence interval for prediction accuracy?

Let's try to answer these. First we have to get and organize the data.

### Get the data

The url for the data is [http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data](http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data), but it doesn't have the column names. From [here](http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.names) we learn the feature names (there are 10 features) and that each features has a column for it's mean, standard error, and worst (or largest) statistic. So we can create vectors for the features and statistics, then paste them together to get the column names.


{% highlight r %}
wdbc.filename <- paste('http://archive.ics.uci.edu/ml/machine-learning-',
                       'databases/breast-cancer-wisconsin/wdbc.data', sep = '')
wdbc.data <- read.csv(url(wdbc.filename), header = FALSE, stringsAsFactors = FALSE)
wdbc.features <- c('radius', 'texture', 'perimeter', 'area', 'smoothness', 
                   'compactness', 'concavity', 'concave_points', 'symmetry', 
                   'fractal_dimension')
wdbc.stats <- c('mean', 'se', 'worst')
wdbc.names <- c('ID', 'diagnosis', 
                paste(wdbc.features, rep(wdbc.stats, each = 10), sep = '_'))
colnames(wdbc.data) <- wdbc.names
str(wdbc.data, list.len = 5)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	569 obs. of  32 variables:
##  $ ID                     : int  842302 842517 84300903 84348301 84358402 843786 844359 84458202 844981 84501001 ...
##  $ diagnosis              : chr  "M" "M" "M" "M" ...
##  $ radius_mean            : num  18 20.6 19.7 11.4 20.3 ...
##  $ texture_mean           : num  10.4 17.8 21.2 20.4 14.3 ...
##  $ perimeter_mean         : num  122.8 132.9 130 77.6 135.1 ...
##   [list output truncated]
{% endhighlight %}

### Preparing the data

Following what Mr. Lantz does in the chapter, we will drop the `ID` column and turn the `diagnosis` column into a factor:


{% highlight r %}
wdbc.data <- wdbc.data[-1]
wdbc.data$diagnosis <- factor(wdbc.data$diagnosis, levels = c('B', 'M'),
                              labels = c('Benign', 'Malignant'))
str(wdbc.data, list.len = 5)
{% endhighlight %}



{% highlight text %}
## 'data.frame':	569 obs. of  31 variables:
##  $ diagnosis              : Factor w/ 2 levels "Benign","Malignant": 2 2 2 2 2 2 2 2 2 2 ...
##  $ radius_mean            : num  18 20.6 19.7 11.4 20.3 ...
##  $ texture_mean           : num  10.4 17.8 21.2 20.4 14.3 ...
##  $ perimeter_mean         : num  122.8 132.9 130 77.6 135.1 ...
##  $ area_mean              : num  1001 1326 1203 386 1297 ...
##   [list output truncated]
{% endhighlight %}

Now we need to transform the data so that it is normalized. We will copy the function `normalize()` that he makes in the text and apply it, as well as apply z-score standardization using the `scale()` function.


{% highlight r %}
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

wdbc.norm <- as.data.frame(lapply(wdbc.data[2:31], normalize))
wdbc.zscore <- as.data.frame(scale(wdbc.data[-1]))
{% endhighlight %}

### Running the k-NN algorithm

Running the algorithm is pretty easy. In order to do so, we need the `class` library. Install it if you don't have it already using `install.packages('class')`. Before we run the algorithm, we need to separate our data into training data, to tune the classification model, and test data, to test our model. I'll randomly sample the data using the `sample()` function. To copy what Mr. Lantz does, I'll have a sample size of 100, giving me a training set of 469 observations.


{% highlight r %}
library(class)
sample.size <- 100
training.size <- length(wdbc.norm$radius_mean) - sample.size
data.length <- length(wdbc.norm$radius_mean)
samples.test <- sample(1:data.length, size = sample.size, replace = FALSE)

wdbc.norm.train <- wdbc.norm[-samples.test, ]
wdbc.norm.test <- wdbc.norm[samples.test, ]
wdbc.zscore.train <- wdbc.zscore[-samples.test, ]
wdbc.zscore.test <- wdbc.zscore[samples.test, ]
{% endhighlight %}

Now I need to get the diagnoses for the training and test datasets so that the k-NN algorithm can tune a model with the training dataset and then apply it to the test dataset.


{% highlight r %}
wdbc.train.labels <- wdbc.data$diagnosis[-samples.test]
wdbc.test.labels <- wdbc.data$diagnosis[samples.test]
{% endhighlight %}

All that remains is to run the k-NN algorithm and compare the results between the normalized and z-score standardized datasets. In the book Mr. Lantz recommends starting with a *k* value of about the square root of the observations in the training dataset. With 469 observations, we start with a *k* of 21.


{% highlight r %}
wdbc.norm.pred <- knn(train = wdbc.norm.train, test = wdbc.norm.test, 
                      cl = wdbc.train.labels, k = 21)
wdbc.zscore.pred <- knn(train = wdbc.zscore.train, test = wdbc.zscore.test, 
                        cl = wdbc.train.labels, k = 21)
{% endhighlight %}

To view the results I will use the `xtabs()` function from the `stats` package. I'll simply display the accuracy of each model.


{% highlight r %}
xtbl.norm <- xtabs(~wdbc.test.labels + wdbc.norm.pred)
xtbl.zsore <- xtabs(~wdbc.test.labels + wdbc.zscore.pred)
correct.norm <- (xtbl.norm[1,1] + xtbl.norm[2,2]) / sample.size * 100
correct.zscore <- (xtbl.zsore[1,1] + xtbl.zsore[2,2]) / sample.size * 100
paste('Normalized accuracy (%):', correct.norm, ', Z-score accuracy (%):', correct.zscore)
{% endhighlight %}



{% highlight text %}
## [1] "Normalized accuracy (%): 95 , Z-score accuracy (%): 95"
{% endhighlight %}

Alright, so we have replicated the analysis in the chapter. I'm not sure which data transformation yielded better results here, since each time I compile the code it starts the analysis with a random set of training/test data. But most of the time I found the normalized transformation did give slightly better results. Let's extend the analysis.

### Running the algorithm many times

Basically all I need to do here is stick running the algorithm in a for loop to run it many times. Let's do it a thousand times. I'll need some lists to store the results of each implementation of the k-NN algorithm to analyze after the for loop is done.


{% highlight r %}
tests <- 1000
results.norm <- NULL
results.zscore <- NULL
{% endhighlight %}

The code inside the for loop is identical for the single run we just completed, except we append the results to the vectors `results.norm` and `results.zscore` at the end of each loop.


{% highlight r %}
for (x in 1:tests) {
  samples.test <- sample(1:data.length, size = sample.size, replace = FALSE)
  wdbc.norm.train <- wdbc.norm[-samples.test, ]
  wdbc.norm.test <- wdbc.norm[samples.test, ]
  wdbc.zscore.train <- wdbc.zscore[-samples.test, ]
  wdbc.zscore.test <- wdbc.zscore[samples.test, ]
  
  wdbc.train.labels <- wdbc.data$diagnosis[-samples.test]
  wdbc.test.labels <- wdbc.data$diagnosis[samples.test]
  
  wdbc.norm.pred <- knn(train = wdbc.norm.train, test = wdbc.norm.test, 
                        cl = wdbc.train.labels, k = 21)
  wdbc.zscore.pred <- knn(train = wdbc.zscore.train, test = wdbc.zscore.test, 
                          cl = wdbc.train.labels, k = 21)
  
  xtbl.norm <- xtabs(~wdbc.test.labels + wdbc.norm.pred)
  xtbl.zsore <- xtabs(~wdbc.test.labels + wdbc.zscore.pred)
  correct.norm <- (xtbl.norm[1,1] + xtbl.norm[2,2]) / sample.size * 100
  correct.zscore <- (xtbl.zsore[1,1] + xtbl.zsore[2,2]) / sample.size * 100
  results.norm <- c(results.norm, correct.norm)
  results.zscore <- c(results.zscore, correct.zscore)
}
{% endhighlight %}

Now let's look at the results. The first question was whether or not the normalized data transformation results in a better classification model than the z-score transformation. We can compare the summaries for `results.norm` and `results.zscore` to shed some light here.


{% highlight r %}
summary(results.norm)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   90.00   95.00   96.00   96.14   98.00  100.00
{% endhighlight %}



{% highlight r %}
summary(results.zscore)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   89.00   94.00   96.00   95.49   97.00  100.00
{% endhighlight %}

It looks like after 1,000 trials, the most common result is a 96% prediction accuracy for each type of transformation. However, the average prediction accuracy for the z-score transformation is slightly lower than the normalized transformation. That analysis gave us answers to the first two questions.

Now to the next question. We know that running this analysis will probably give us 96% accuracy, but what range of values can we expect? A common way to answer this is to give a 95% confidence interval, meaning we can be 95% confident the model will have a prediction accuracy between two values. To give the values for each transformation type, we can use the `quantile()` function.


{% highlight r %}
quantile(results.norm, c(0.025, 0.975))
{% endhighlight %}



{% highlight text %}
##  2.5% 97.5% 
##    92    99
{% endhighlight %}



{% highlight r %}
quantile(results.zscore, c(0.025, 0.975))
{% endhighlight %}



{% highlight text %}
##  2.5% 97.5% 
##    91    99
{% endhighlight %}

This tells us that we are pretty confident that if given a dataset like the one we have here, we can predicty whether a tumor is malignant or benign between 92% and 99% accuracy. Interestingly enough, the confidence interval for the z-score transformed data is slightly larger, indicating that that model has more uncertainty, but barely.

### Context

Now let's take a step back to gain some context here. Understanding the confidence intervals and the uncertainty in any model is vital. If we had only run the k-NN algorithm once and happend upon a 100% prediction accuracy (which did happen at least once during our 1,000 loop test, see `summary(results.norm)` above), it would falsely give the impression that our model was perfect.

Establishing confidence intervals provides more useful information for the users of a model. In the context here, of detecting breast cancer, knowing that we are 92% to 99% confidence in the model is so important. If someone I knew were getting tested, and a test with this accuracy came back benign, I would no doubt be thrilled with the result with such a high level of confidence in the model. However, I would still probably suggest getting a second opinion, because a 1/12 chance of being wrong (8%) isn't worth the risk when it comes to cancer.
