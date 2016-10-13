---
layout: page
title: WxChallenge
---

This page provides some tools I use to help me in the [WxChallenge](http://www.wxchallenge.com/). The current city is Harrisburg, PA (KMDT).

* [NWS Forecast](http://forecast.weather.gov/MapClick.php?lat=40.1934&lon=-76.7633#.V_-4vpMrJE4)
* [3-Day Obs](http://w1.weather.gov/data/obhistory/KMDT.html)
* [SREF Plume Viewer](http://www.spc.noaa.gov/exper/sref/srefplumes/)

### Bayesian Model Averaging

Bayesian Model Averaging (BMA) is an ensemble calibration and bias correction technique. For more info, check out [Raftery et al. (2005)](http://journals.ametsoc.org/doi/full/10.1175/MWR2906.1) and [Sloughter et al. (2010)](http://www.tandfonline.com/doi/abs/10.1198/jasa.2009.ap08615). In a nutshell, current ensembles such as the [Global Ensemble Forecast System (GEFS)](https://www.ncdc.noaa.gov/data-access/model-data/model-datasets/global-ensemble-forecast-system-gefs) are biased and uncalibrated. Error in forecasts can be separated into two parts: systematic (predictable and removable) and random. In addition, ensembles are typically under-dispersive, meaning that observations frequently (sometimes more often than not) fall outside the range of ensemble solutions.

BMA is a technique that removes biases in ensemble members and also calibrates ensembles to provide a calibrated [probability density function (PDF)](https://en.wikipedia.org/wiki/Probability_density_function) for a given forecast variable. Below is a calibrated PDF for maximum and minimum temperature and maximum wind speed for Harrisburg, PA. Calibrated precipitation is still in production. Ensemble information comes from the 06Z run of the 0.5 degree GEFS.

For each of the plots below, the bell-shaped curve is the PDF. The vertical blue line represents the most likely value for the forecasted variable of interest. The vertical black lines represent lower (10%) and upper (90%) forecast limits. Thus, if BMA is working properly, given the current ensemble output the verifying observation will fall in between the black lines 80% of the time.

The dots at the top of each plot represent the raw ensemble output. The black dot is the GEFS control forecast, and the grey dots represent the 20 perturbation members. If the dots are close together (sharp), this implies a higher certainty in the forecast. In contrast, if they are far apart, this implies greater uncertainty in the forecast. But beware! Ensembles are typically under-dispersive, so don't mistake a sharp forecast as a confident one!

If the dots are close to the blue line, this means that there isn't much bias in the ensemble output. If the dots are far away, this means there is a lot of bias in the ensemble members, and the BMA procedure identified and removed a significant amount of systematic error.

> Updated 2016-10-13 17:27 GMT

### BMA PDFs for KMDT for Friday, October 14

Click on each image to enlarge it.

<p align="center"><strong>Maximum Temperature</strong></p>
[<img src="tmax.png" width="700"/>](tmax.png)

<p align="center"><strong>Minimum Temperature</strong></p>
[<img src="tmin.png" width="700"/>](tmin.png)

<p align="center"><strong>Maximum Wind Speed</strong></p>
[<img src="wspd.png" width="700"/>](wspd.png)

If you have questions about these products please [contact me](https://bhlmn.github.io/about.html#contact)!
