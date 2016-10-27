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
    + R: `knn()` in package [`FNN`](https://cran.r-project.org/web/packages/FNN/FNN.pdf)
  + [Weighted k-NN](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm#The_weighted_nearest_neighbour_classifier)
    + R: `ownn()` in package [`FNN`](https://cran.r-project.org/web/packages/FNN/FNN.pdf)
  + [Extended k-NN (ENN)](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm#Extension_of_k-NN_.28ENN.29_for_classification)
  + Fuzzy k-NN
    + R:

* Uses
  + Observation based probabilistic clear-sky forecasting with k-NN ([Hall et al. 2011](http://journals.ametsoc.org/doi/full/10.1175/2010JAMC2529.1))
  + Ensemble-based snowfall accumulation prediction using k-NN ([McCandless 2010](https://etda.libraries.psu.edu/catalog/10678))
  + Probabilistic, analog sky conditions forecasting ([Hall et al. 2010](http://journals.ametsoc.org/doi/abs/10.1175/2010WAF2222372.1))
  + Seasonal/climate prediction using k-NN ([Jan et al. 2008](http://link.springer.com/chapter/10.1007%2F978-3-540-89853-5_7))
  + Analog forecasting of ceiling and visibility using fuzzy k-NN ([Hansen 2007](http://journals.ametsoc.org/doi/abs/10.1175/2007WAF2006017.1))
  + Simulating climate change scenarios using k-NN ([Sharif & Burn 2006](http://www.eng.uwo.ca/research/iclr/fids/publications/cfcas-climate/papers/weather-gen.pdf))
  + Weather prediction by identifying past analogues using Fuzzy k-NN ([Riordan & Hansen 2002](http://collaboration.cmc.ec.gc.ca/science/rpn/publications/pdf/EIS_Riordan_Hansen_xx_xx_02_official.pdf))

* Ideas
  + Use fuzzy k-NN to forecast winter precipitation for Willamette Valley using past winters.
  + Use k-NN/fk-NN with reanalysis datasets to improve upon Model Output Statistics.
  + Seasonal prediction using k-NN.

### Naive Bayes

* Uses
  + Observation based probabilistic clear-sky forecasting with Naive Bayes ([Hall et al. 2011](http://journals.ametsoc.org/doi/full/10.1175/2010JAMC2529.1))

### Decision Trees

### Random Forests

* Uses
  + Observation based probabilistic clear-sky forecasting with Random Forests ([Hall et al. 2011](http://journals.ametsoc.org/doi/full/10.1175/2010JAMC2529.1))

### Rule Learners

## Prediction methods

### Regression Models

### Regression Trees

* Uses
  + Observation based probabilistic clear-sky forecasting with Regression trees ([Hall et al. 2011](http://journals.ametsoc.org/doi/full/10.1175/2010JAMC2529.1))

### Model Trees

### Artificial Neural Networks (ANN)

* Uses
  + Observation based probabilistic clear-sky forecasting with ANNs ([Hall et al. 2011](http://journals.ametsoc.org/doi/full/10.1175/2010JAMC2529.1))
  + Short-term wind speed prediction ([Salcedo-Sanz et al. 2009](http://www.sciencedirect.com/science/article/pii/S096014810800390X))
  + ANN Ensemble for precipitation prediction ([Wu 2009](http://ieeexplore.ieee.org/document/5193894/?arnumber=5193894&tag=1))

### [Support Vector Machines](https://en.wikipedia.org/wiki/Support_vector_machine)

* Variants
  + [Support Vector Regression](https://en.wikipedia.org/wiki/Support_vector_machine#Regression) (prediction)
  + Least squares support vector machine (LS-SVM)

* Uses
  + Temperature prediction ([Radhika & Shashi 2009](http://search.proquest.com/openview/f5122306fd2aa122fe3271f12684f9f9/1?pq-origsite=gscholar))

### [Gene Expression Programming](https://en.wikipedia.org/wiki/Gene_expression_programming) (GEP)

* Uses
  + Using GEP to generate large ensembles ([Roebber 2015a](http://journals.ametsoc.org/doi/abs/10.1175/MWR-D-14-00058.1))
  + Using GEP to forecast minimum temperature ([Roebber 2015b](http://journals.ametsoc.org/doi/abs/10.1175/MWR-D-14-00096.1))
  + GEP for extreme value probabilistic precipitation forecasts([Roebber 2013](http://journals.ametsoc.org/doi/abs/10.1175/MWR-D-12-00285.1))
  + Improving WRF-ARW wind speed prediction with GEP ([Martinez-Arellano et al. 2012](http://link.springer.com/chapter/10.1007/978-1-4471-4739-8_27#page-1))
  + Deterministic ensemble forecasts using GEP ([Bakhshaii & Stull 2009](https://open.library.ubc.ca/cIRcle/collections/facultyresearchandpublications/52383/items/1.0041835))

## Unsupervised methods

### [Association Rule Learning](https://en.wikipedia.org/wiki/Association_rule_learning)

* Uses
  + Using association rules to predict severe weather events ([Zhang et al. 2004](http://ieeexplore.ieee.org/document/1342698/?arnumber=1342698&tag=1))

### [k-means Clustering](https://en.wikipedia.org/wiki/K-means_clustering)

* Variants
  + [Fuzzy c-means](https://en.wikipedia.org/wiki/Fuzzy_clustering#Fuzzy_C-means_Clustering) (probabilistic)
    + R: `fanny()` in package [`cluster`](https://cran.r-project.org/web/packages/cluster/cluster.pdf)
  + [k-medioids](https://en.wikipedia.org/wiki/K-medoids) & [k-PAM](https://en.wikipedia.org/wiki/K-medoids#Algorithms) (cluster centers must be data points)
    + R: `pam()` in package [`cluster`](https://cran.r-project.org/web/packages/cluster/cluster.pdf)

* Uses
  + Climate classification ([Zscheischler et al. 2012](http://www.sciencedirect.com/science/article/pii/S1877050912002177]))

* Ideas
  + Use k-means and fuzzy c-means with the CFSR dataset for climate classification over the CONUS.
