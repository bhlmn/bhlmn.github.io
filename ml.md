---
layout: page
title: 'Machine Learning'
---

Since I want to go into data science, I am *extremely* interested in Machine Learning. And with my background in meteorology, I am particularly interested in how machine learning methods have been applied in the meteorological field.

This page categorizes the machine learning methods I have studied, thanks to the books [Machine Learning with R](https://www.amazon.com/Machine-Learning-Second-Brett-Lantz/dp/1784393908/ref=pd_sbs_14_t_0?_encoding=UTF8&psc=1&refRID=8MQDWKS4ZKTNVKX2HNAH) and [Python Machine Learning](https://www.amazon.com/Python-Machine-Learning-Sebastian-Raschka/dp/1783555130/ref=sr_1_1?s=books&ie=UTF8&qid=1477502703&sr=1-1&keywords=python+machine+learning), as well as several pages on [GitHub](https://github.com/) and [Stack Overflow](http://stackoverflow.com/). Lastly, I've found lots of value in Siraj Raval's Youtube channel, [Sirajology](https://www.youtube.com/channel/UCWN3xxRkmTPmbKwht9FuE5A).

Within each branch of machine learning method I include papers I've checked out that apply said method.

## Classification methods

### [k-Nearest Neighbors (k-NN)](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm)

* Variants
  + 1-NN
  + [Weighted k-NN](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm#The_weighted_nearest_neighbour_classifier)
  + [Extended k-NN (ENN)](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm#Extension_of_k-NN_.28ENN.29_for_classification)
  + Fuzzy k-NN

* Uses
  + Weather prediction by identifying past analogues using Fuzzy k-NN ([Riordan & Hansen 2002](http://collaboration.cmc.ec.gc.ca/science/rpn/publications/pdf/EIS_Riordan_Hansen_xx_xx_02_official.pdf))
  + Analog forecasting of ceiling and visibility using fuzzy k-NN ([Hansen 2000](http://www.leg.ufpr.br/~eder/Artigos/Wather/Hansen_2000b.pdf))

* Ideas
  + Use fuzzy k-NN to forecast winter precipitation for Willamette Valley using past winters.

### Naive Bayes

### Decision Trees

### Random Forests

### Rule Learners

## Prediction methods

### Regression Models

### Regression Trees

### Model Trees

### Neural Networks

* Uses
  + Short-term wind speed prediction ([Salcedo-Sanz et al. 2009](http://www.sciencedirect.com/science/article/pii/S096014810800390X))

### Support Vector Machines

## Unsupervised methods

### Association Rules

### [k-means Clustering](https://en.wikipedia.org/wiki/K-means_clustering)

* Variants
  + [Fuzzy c-means](https://en.wikipedia.org/wiki/Fuzzy_clustering#Fuzzy_C-means_Clustering) (probabilistic)
  + [k-medioids](https://en.wikipedia.org/wiki/K-medoids) & [k-PAM](https://en.wikipedia.org/wiki/K-medoids#Algorithms) (cluster centers must be data points)

* Uses
  + Climate classification ([Zscheischler et al. 2012](http://www.sciencedirect.com/science/article/pii/S1877050912002177]))

* Ideas
  + Use k-mean and fuzzy c-means with the CFSR dataset for climate classification over the CONUS.
