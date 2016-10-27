---
layout: page
title: 'Statistical post processing'
---

My dissertation research is almost entirely focused on statistical post processing of numerical weather model (NWP) output. This page provides a literature review of all of the techniques I am aware of to bias correct NWP output as well as calibrate NWP ensembles.

## Bias Correction Methods

### Comparative Studies

## Ensemble Calibration Methods

### Nonhomogeneous Gaussian Regression (NGR) a.k.a. Ensemble Model Output Statistics (EMOS) ([Gneiting et al. 2005](http://journals.ametsoc.org/doi/full/10.1175/MWR2904.1))

* 2-m Temperature
  + [Kann et al. (2009)](http://journals.ametsoc.org/doi/abs/10.1175/2009MWR2793.1) [[notes](notes/kannetal2009.pdf)] perform NGR on 2-m temperature forecasts provided by an 18 member, 18-km resolution ensemble over Austria. The ensemble was initialized with ECMWF analyses. They trained NGR using output from a 1-km x 1-km gridded analysis and verified the NGR PDFs with 170 Austrian stations during December 2007 and July 2008. The calibrated ensemble had little bias, reduced RMSE, and better spread and CRPS/CRPSS scores. They use the same technique on the full ECMWF-EPS with good results, but not as good as their limited area model ensemble. They also introduce a time-decaying averaging CRPS method for calculating the NGR coefficients (NGR-TD) and found it improved results over the baseline NGR.

### Comparative Studies
