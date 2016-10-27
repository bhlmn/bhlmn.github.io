---
layout: page
title: 'Statistical Post Processing'
---

My dissertation research is almost entirely focused on statistical post processing of numerical weather model (NWP) output. This page provides a literature review of all of the techniques I am aware of to bias correct NWP output as well as calibrate NWP ensembles.

## Bias Correction Methods

* To Read
    + [Glahn 2014 - Determining an Optimal Decay Factor for Bias-Correcting MOS Temperature and Dewpoint Forecasts](http://journals.ametsoc.org/doi/abs/10.1175/WAF-D-13-00123.1)

### Comparative Studies

## Ensemble Calibration Methods

* To Read
    + [Johnson & Bowler 2009 - On the Reliability and Calibration of Ensemble Forecasts](http://journals.ametsoc.org/doi/full/10.1175/2009MWR2715.1)
    + [Monache et al. 2013 - Probabilistic Weather Prediction with an Analog Ensemble](http://journals.ametsoc.org/doi/abs/10.1175/MWR-D-12-00281.1)
    + [Aizenman et al. 2016 - Ensemble Forecasts: Probabilistic Seasonal Forecasts Based on a Model Ensemble](http://www.mdpi.com/2225-1154/4/2/19)

### Bayesian Model Averaging (BMA)

* To Read
    + [Veenhuis 2014 - A Practical Model Blending Technique Based on Bayesian Model Averaging](https://ams.confex.com/ams/94Annual/webprogram/Paper231690.html)

### Nonhomogeneous Gaussian Regression (NGR) a.k.a. Ensemble Model Output Statistics (EMOS) ([Gneiting et al. 2005](http://journals.ametsoc.org/doi/full/10.1175/MWR2904.1))

* 2-m Temperature
    + [Kann et al. (2009)](http://journals.ametsoc.org/doi/abs/10.1175/2009MWR2793.1) [[notes](notes/kannetal2009.pdf)] perform NGR on 2-m temperature forecasts provided by an 18 member, 18-km resolution ensemble over Austria. The ensemble was initialized with ECMWF analyses. They trained NGR using output from a 1-km x 1-km gridded analysis and verified the NGR PDFs with 170 Austrian stations during December 2007 and July 2008. The calibrated ensemble had little bias, reduced RMSE, and better spread and CRPS/CRPSS scores. They use the same technique on the full ECMWF-EPS with good results, but not as good as their limited area model ensemble. They also introduce a time-decaying averaging CRPS method for calculating the NGR coefficients (NGR-TD) and found it improved results over the baseline NGR.

* To Read
    + [Hagedorn et al. 2008 - Probabilistic Forecast Calibration Using ECMWF and GFS Ensemble Reforecasts. Part I: Two-Meter Temperatures](http://journals.ametsoc.org/doi/10.1175/2007MWR2410.1)

### Logistic Regression

* To Read
    + [Hamill et al. 2008 - Probabilistic Forecast Calibration Using ECMWF and GFS Ensemble Reforecasts. Part II: Precipitation](http://journals.ametsoc.org/doi/full/10.1175/2007MWR2411.1)

### Comparative Studies

## To Read

* [Lee 2012 - Techniques for Down-selecting Numerical Weather Prediction Ensembles](https://etda.libraries.psu.edu/catalog/15236)
* [Guan et al. 2015 - Improvement of Statistical Postprocessing Using GEFS Reforecast Information](http://journals.ametsoc.org/doi/abs/10.1175/WAF-D-14-00126.1)
