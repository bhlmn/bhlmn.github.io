---
layout:  page
title: "R Cheat Sheet"
comments:  false
published:  true
author: "Bryan Holman"
date: 2016-08-22 11:18:00
categories: [R]
output:
  html_document:
    mathjax:  default
    fig_caption:  true
    toc: true
    toc_depth: 3
---



# Introduction

I began using R in 2014. An off and on user, I typically used [google](https://www.google.com/) and [stackoverflow](http://stackoverflow.com/questions/tagged/r) for syntax related questions and help using specific functions and packages. In 2016 I decided to take my R skills to the next level, bought a couple of books, and decided to summarize what I learned on this site.

The books I have found most useful are:

* [R In Action (RIA)](https://www.amazon.com/Action-Data-Analysis-Graphics/dp/1617291382/ref=dp_ob_title_bk) by Dr. Rob Kabacoff.

# Data Sctructures

## Matrices

See RIA 23

*mymatrix = matrix(vector_of_values, nrow=number_of_rows, ncol=number_of_columns, byrow=TRUE/FALSE)*

{% highlight r %}
mymatrix = matrix(1:25, nrow=5, ncol=5, byrow = TRUE)
mymatrix
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    2    3    4    5
## [2,]    6    7    8    9   10
## [3,]   11   12   13   14   15
## [4,]   16   17   18   19   20
## [5,]   21   22   23   24   25
{% endhighlight %}
**Note**: The input vector `1:25` was fill for each row first. To do so with columns:

{% highlight r %}
mymatrix = matrix(1:25, nrow=5, ncol=5, byrow = FALSE)
mymatrix
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    6   11   16   21
## [2,]    2    7   12   17   22
## [3,]    3    8   13   18   23
## [4,]    4    9   14   19   24
## [5,]    5   10   15   20   25
{% endhighlight %}

## Factors

See RIA 28

For *nominal* and *ordinal* variables, it is useful to store these variables as factors. Why?

* Storing variables as factors will aid in the analysis process, as the correct number of degrees of freedom will be assigned ([source](http://www.ats.ucla.edu/stat/r/modules/factor_variables.htm)).
* Storing string variables as factors is more efficient memory-wise ([source](http://www.ats.ucla.edu/stat/r/modules/factor_variables.htm)).

Nominal variables are categorical but have no order to them, such as:


{% highlight r %}
car_makes = c('Subaru', 'Honda', 'Toyota', 'Ford', 'Chevy')
car_makes = factor(car_makes)
str(car_makes)
{% endhighlight %}



{% highlight text %}
##  Factor w/ 5 levels "Chevy","Ford",..: 4 3 5 2 1
{% endhighlight %}

You might have your personal preference to which car manufacturer is better than the other, but it isn't *implied*.

For ordinal variables, on the other hand, order is implied. For example:


{% highlight r %}
wait_time = c('Very Poor', 'Poor', 'Fair', 'Good', 'Very Good')
wait_time = factor(wait_time, order=TRUE)
str(wait_time)
{% endhighlight %}



{% highlight text %}
##  Ord.factor w/ 5 levels "Fair"<"Good"<..: 5 3 1 2 4
{% endhighlight %}

Notice how R recognizes that this variable is ordered. However, the order it assigns by default is alphabetically. Thus, the implied order is *Fair*, *Good*, *Poor*, *Very Good*, *Very Poor*. To set the order that is intuitive to us:


{% highlight r %}
wait_time = c('Very Poor', 'Poor', 'Fair', 'Good', 'Very Good')
wait_time = factor(wait_time, order=TRUE, levels = c('Very Poor', 'Poor', 'Fair', 'Good', 'Very Good'))
str(wait_time)
{% endhighlight %}



{% highlight text %}
##  Ord.factor w/ 5 levels "Very Poor"<"Poor"<..: 1 2 3 4 5
{% endhighlight %}

Now R recognizes the proper order of this ordinal variable, with *Very Poor* being the worst and *Very Good* being the best.

## Lists and Dictionaries

See RIA 30

Lists are handy in that you can throw anything in them. Be it a matrix, string, data frame, whatever. If it is an R object, it can go in a list. I like to use these akin to python dictionaries. Here is how we would set a dictionary-like list up:


{% highlight r %}
subaru.costs = list(Forester = 25450, Impreza = 33900, Legacy = 23000)
subaru.costs$Forester
{% endhighlight %}



{% highlight text %}
## [1] 25450
{% endhighlight %}



{% highlight r %}
subaru.costs[['Impreza']]
{% endhighlight %}



{% highlight text %}
## [1] 33900
{% endhighlight %}

Note how you can reference items in a list in different ways. You can also compose lists of lists, which is really helpful in large R scripts and in loops through different keys.

## Reading Data Into R

See RIA 34

I typically use the *read.csv()* function to get data into R so I can start analyzing it. Here are some useful options to use with the *read.csv()* function:

Option | Description
------------------ | -------------------------------------------------------------------
*sep* | The delimeter that separates data values. Default is *sep=','*, but it can be changed to fit needs.
*na.strings* | Specify the missing values in the data file, ex. *na.strings=c(-99999)*.
*colClasses* | Explicitly state the class of each column (numeric, character, factor, integer).
*skip* | Number of lines at the top of the file to skip, useful for skipping comments in the file.
*stringsAsFactors* | Indiciates whether to convert string variables to factors. The default is **TRUE**, so make sure to set to **FALSE** if you do not want a column of strings converted to factors. Setting to **FALSE** can really speed up processing time for large files.

## Grabbing data from the web

See RIA 38

Lot's of APIs exist to interact with specific web interfaces, such as:

* [twitteR](https://cran.r-project.org/web/packages/twitteR/twitteR.pdf)
    + [Setting up account](http://bigcomputing.blogspot.com/2016/02/the-twitter-r-package-by-jeff-gentry-is.html)
    + [YouTube example](https://www.youtube.com/watch?v=8mSmK3Pid7w)
    + [Web example 1](http://davetang.org/muse/2013/04/06/using-the-r_twitter-package/)
    + [Web example 2](http://www.r-datacollection.com/blog/TwitteR2Mongo/)
* [RFacebook](https://cran.r-project.org/web/packages/Rfacebook/Rfacebook.pdf)
    + [Web example](http://thinktostart.com/analyzing-facebook-with-r/)
    
There are a lot more packages that work with specific web APIs. A full list can be found [here](https://cran.r-project.org/web/views/WebTechnologies.html).

# Working with Data Frames

## Aggregate

The *aggregate()* function allows you to collapse a data frame by certain variables and apply a certain function. The general usage is:

*aggregate(var1 ~ var2 + var3, data=mydata, FUN=function_to_apply)*

For instance, let's say we have some data about car prices. As you can see below, there are multiple entries for some makes of cars:

{% highlight r %}
car.makes = c('Subaru', 'Subaru', 'Ford', 'Toyota', 'Ford', 'Subaru')
car.models = c('Forester', 'Impreza', 'Focus', 'Camry', 'F150', 'Forester')
car.prices = c(24500, 34900, 18000, 21750, 27300, 23000)
df = data.frame(Make = car.makes, Model = car.models, Price = car.prices)
df
{% endhighlight %}



{% highlight text %}
##     Make    Model Price
## 1 Subaru Forester 24500
## 2 Subaru  Impreza 34900
## 3   Ford    Focus 18000
## 4 Toyota    Camry 21750
## 5   Ford     F150 27300
## 6 Subaru Forester 23000
{% endhighlight %}

If we wanted to have a dataframe that average the price for each make, we can use the aggregate function to do this:


{% highlight r %}
df.agg = aggregate(Price ~ Make, data = df, FUN = mean)
df.agg
{% endhighlight %}



{% highlight text %}
##     Make    Price
## 1   Ford 22650.00
## 2 Subaru 27466.67
## 3 Toyota 21750.00
{% endhighlight %}
Now we can see the average price for each make of car. You'll notice that *Model* no longer exists in the dataframe. We asked R to average the price for each make of car. If we want R to average the price for each make *and* model, we can do this:

{% highlight r %}
df.agg = aggregate(Price ~ Make + Model, data = df, FUN = mean)
df.agg
{% endhighlight %}



{% highlight text %}
##     Make    Model Price
## 1 Toyota    Camry 21750
## 2   Ford     F150 27300
## 3   Ford    Focus 18000
## 4 Subaru Forester 23750
## 5 Subaru  Impreza 34900
{% endhighlight %}
The only model in *df* that had two entries was the Subaru Forester, so that is the only one that did any averaging.

**Note**: the paramater *FUN* is extremely powerful! Not only can you specify *mean* or *sum*, but you can write you own user-specific function to be applied! See [here](https://www.r-bloggers.com/aggregate-a-powerful-tool-for-data-frame-in-r/) for some pretty advanced examples.

## cbind, rbind, and merge

*cbind()* and *rbind()* are functions that add more columns (variables) and rows (observations) to a dataframe. Going back to the car example, say that you have another variable with miles per gallong (mpg). It can be combined with the previous dataframe with *cbind()*:


{% highlight r %}
car.makes = c('Subaru', 'Subaru', 'Ford', 'Toyota', 'Ford', 'Subaru')
car.models = c('Forester', 'Impreza', 'Focus', 'Camry', 'F150', 'Forester')
car.mpg = c(26, 22, 31, 35, 16, 25)
df.2 = data.frame(Make = car.makes, Model = car.models, MPG = car.mpg)
df.3 = cbind(df, df.2)
df.3
{% endhighlight %}



{% highlight text %}
##     Make    Model Price   Make    Model MPG
## 1 Subaru Forester 24500 Subaru Forester  26
## 2 Subaru  Impreza 34900 Subaru  Impreza  22
## 3   Ford    Focus 18000   Ford    Focus  31
## 4 Toyota    Camry 21750 Toyota    Camry  35
## 5   Ford     F150 27300   Ford     F150  16
## 6 Subaru Forester 23000 Subaru Forester  25
{% endhighlight %}
Notice how the variable *MPG* has been added, but now *Make* and *Model* are in the dataframe *df.3* twice. This could be fixed by:

{% highlight r %}
df.3 = merge(df, df.2, by=c('Make', 'Model'))
df.3
{% endhighlight %}



{% highlight text %}
##     Make    Model Price MPG
## 1   Ford     F150 27300  16
## 2   Ford    Focus 18000  31
## 3 Subaru Forester 24500  26
## 4 Subaru Forester 24500  25
## 5 Subaru Forester 23000  26
## 6 Subaru Forester 23000  25
## 7 Subaru  Impreza 34900  22
## 8 Toyota    Camry 21750  35
{% endhighlight %}
Now notice how we have duplicate entries for Subaru Forester. That is because both dataframes have two entries, so each Subaru Forester entry for *MPG* in the *df.2* gets applied to *df*. One way to get around this is to make sure the two dataframes you are merging have observations in the **exact** same order, and apply a simpler form of *cbind()*:

{% highlight r %}
car.mpg = c(26, 22, 31, 35, 16, 25)
df.2 = data.frame(MPG = car.mpg)
df.3 = cbind(df, df.2)
df.3
{% endhighlight %}



{% highlight text %}
##     Make    Model Price MPG
## 1 Subaru Forester 24500  26
## 2 Subaru  Impreza 34900  22
## 3   Ford    Focus 18000  31
## 4 Toyota    Camry 21750  35
## 5   Ford     F150 27300  16
## 6 Subaru Forester 23000  25
{% endhighlight %}

## Subsetting/Selecting observations and rows

## Removing dataframes

The *rm()* function removes an object from the working environment, freeing up memory. Below, if I uncommented *df.2* we would get an error because R would not be able to find *df.2* to print it.

{% highlight r %}
rm(df.2)
# df.2 
{% endhighlight %}

# Graphing

## Save a plot to disk

The following saves the file [*price_vs_mpg.png*](price_vs_mpg.png) to the current working directory. In place of *png()*, the functions *pdf()*, *jpeg()*, *tiff()*, etc. can be used.

{% highlight r %}
png('price_vs_mpg.png')
plot(df.3$Price, df.3$MPG)
dev.off()
{% endhighlight %}



{% highlight text %}
## quartz_off_screen 
##                 2
{% endhighlight %}

# RMarkdown

RStudio has produced an excellent [cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf) which I reference often. No need to duplicate the awesome work they already did.
