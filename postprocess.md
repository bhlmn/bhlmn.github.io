---
layout: page
title: 'Statistical Post Processing'
---

My dissertation research is almost entirely focused on statistical post processing of numerical weather model (NWP) output. This page provides a literature review of all of the techniques I am aware of to bias correct NWP output as well as calibrate NWP ensembles.

## Bias Correction Methods

* To Read
    + [Glahn 2014 - Determining an Optimal Decay Factor for Bias-Correcting MOS Temperature and Dewpoint Forecasts](http://journals.ametsoc.org/doi/abs/10.1175/WAF-D-13-00123.1)
    + [Vrac & Friederichs 2015 - Multivariate—Intervariable, Spatial, and Temporal—Bias Correction](http://content.ebscohost.com/ContentServer.asp?T=P&P=AN&K=100208424&S=R&D=a9h&EbscoContent=dGJyMNXb4kSeqLE4zOX0OLCmr06ep7JSsai4TLWWxWXS&ContentCustomer=dGJyMOTi54y549%2BB7LHjgO3p8gAA)

### Comparative Studies

## Ensemble Calibration Methods

* To Read
    + [Johnson & Bowler 2009 - On the Reliability and Calibration of Ensemble Forecasts](http://journals.ametsoc.org/doi/full/10.1175/2009MWR2715.1)
    + [Aizenman et al. 2016 - Ensemble Forecasts: Probabilistic Seasonal Forecasts Based on a Model Ensemble](http://www.mdpi.com/2225-1154/4/2/19)

### Bayesian Model Averaging (BMA)

* To Read
    + [Klieber et al 2011 - Locally Calibrated Probabilistic Temperature Forecasting Using Geostatistical Model Averaging and Local Bayesian Model Averaging](http://journals.ametsoc.org/doi/full/10.1175/2010MWR3511.1)
    + [Veenhuis 2014 - A Practical Model Blending Technique Based on Bayesian Model Averaging](https://ams.confex.com/ams/94Annual/webprogram/Paper231690.html)

#### Multivariate quantities with copulas

* To Read
    + [Moller et al 2013 - Multivariate probabilistic forecasting using ensemble Bayesian model averaging and copulas](http://onlinelibrary.wiley.com/doi/10.1002/qj.2009/abstract)

### Nonhomogeneous Gaussian Regression (NGR) a.k.a. Ensemble Model Output Statistics (EMOS) ([Gneiting et al. 2005](http://journals.ametsoc.org/doi/full/10.1175/MWR2904.1))

* 2-m Temperature
    + [Kann et al. (2009)](http://journals.ametsoc.org/doi/abs/10.1175/2009MWR2793.1) [[notes](notes/kannetal2009.pdf)] perform NGR on 2-m temperature forecasts provided by an 18 member, 18-km resolution ensemble over Austria. The ensemble was initialized with ECMWF analyses. They trained NGR using output from a 1-km x 1-km gridded analysis and verified the NGR PDFs with 170 Austrian stations during December 2007 and July 2008. The calibrated ensemble had little bias, reduced RMSE, and better spread and CRPS/CRPSS scores. They use the same technique on the full ECMWF-EPS with good results, but not as good as their limited area model ensemble. They also introduce a time-decaying averaging CRPS method for calculating the NGR coefficients (NGR-TD) and found it improved results over the baseline NGR.

* To Read
    + [Hagedorn et al. 2008 - Probabilistic Forecast Calibration Using ECMWF and GFS Ensemble Reforecasts. Part I: Two-Meter Temperatures](http://journals.ametsoc.org/doi/10.1175/2007MWR2410.1)

### Adaptive Calibration

* To Read
    + [**Pinson 2012 - Adaptive calibration of (u,v)-wind ensemble forecasts**](http://onlinelibrary.wiley.com/doi/10.1002/qj.1873/full)

### Analog Ensembles

* To Read
    + [**Junk et al. 2015 - Analog-Based Ensemble Model Output Statistics**](http://journals.ametsoc.org/doi/full/10.1175/MWR-D-15-0095.1)
    + [Junk et al. 2015 - Predictor-weighting strategies for probabilistic wind power forecasting with an analog ensemble](https://www.researchgate.net/profile/Constantin_Junk/publication/274951815_Predictor-weighting_strategies_for_probabilistic_wind_power_forecasting_with_an_analog_ensemble/links/552cd5710cf29b22c9c47260.pdf)
    + [Monache et al. 2013 - Probabilistic Weather Prediction with an Analog Ensemble](http://journals.ametsoc.org/doi/abs/10.1175/MWR-D-12-00281.1)

### Logistic Regression

* To Read
    + [Hamill et al. 2008 - Probabilistic Forecast Calibration Using ECMWF and GFS Ensemble Reforecasts. Part II: Precipitation](http://journals.ametsoc.org/doi/full/10.1175/2007MWR2411.1)

### Comparative Studies

## To Read

* [**Junk et al. 2014 - Comparison of Postprocessing Methods for the Calibration of 100-m Wind Ensemble Forecasts at Off- and Onshore Sites**](https://www.researchgate.net/profile/Constantin_Junk/publication/261514173_Comparison_of_Postprocessing_Methods_for_the_Calibration_of_100-m_Wind_Ensemble_Forecasts_at_Off-_and_Onshore_Sites/links/0f317534d06a014305000000.pdf)
* [Lee 2012 - Techniques for Down-selecting Numerical Weather Prediction Ensembles](https://etda.libraries.psu.edu/catalog/15236)
* [Guan et al. 2015 - Improvement of Statistical Postprocessing Using GEFS Reforecast Information](http://journals.ametsoc.org/doi/abs/10.1175/WAF-D-14-00126.1)
