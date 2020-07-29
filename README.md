# Pre-processing of the untargeted metabolomics data from CHRIS

This repository contains all data analysis files for the pre-processing and
normalization of the (HILIC-based) untargeted metabolomics data from CHRIS.

## Contact persons

- Mar Garcia-Aloy
- Johannes Rainer

## Requirements

A recent version of R is required (>= 4.0) and the following R packages:

```r
install.packages("BiocManager")
## For the peak_detection.Rmd
BiocManager::install(c("BiocStyle",
                       "readxl",
                       "RColorBrewer",
                       "xcms"))
```

## Files and structure of the analysis

The listing of all mzML files for CHRIS samples is provided in the
*data/chris-files-annotated.xlsx* which is not included in this repository (it
is available through the Eurac Research IfB-internal *massspec* repository; ask
Johannes Rainer for access).

### Preprocessing

- [peak_detection.Rmd](peak_detection.Rmd): peak detection and peak
  post-processing of both positive and negative polarity data.

Previous files:
- [XCMS_processing.Rmd](XCMS_processing.Rmd): alignment (retention
  time correction) and correspondence (grouping of peaks across samples)
  of the data for 1 specific polarity.
- [XCMS_peak_filling.Rmd](XCMS_peak_filling.Rmd): peak filling of data for 1 specific polarity.

### Normalization

- [normalization.Rmd](normalization.Rmd): implementation of various data
normalisation approaches (between-sample, within-batch and between-batch) for 1 specific polarity.

## Required packages and setup

The analysis requires a recent version of R (version >= 3.6.0) and a set of R
packages that can be installed with the code below.

```r
install.packages("BiocManager")
library(BiocManager)
BiocManager::install(c("BiocStyle",
                       "xcms",
                       "RColorBrewer",
                       "pander",
                       "UpSetR",
                       "pheatmap",
                       "SummarizedExperiment",
                       "writexl"))

```

## Raw mzML data

mzML files for this data set are accessible from the calculation clusters at the
base path */data/massspec/mzML/*.

MS data was recorded in profile mode. Sciex *wiff* files were converted to mzML
file format using `proteowizard`. The profile mode mzML files were centroided in
`R` to generate the centroided mzML files. The scripts to perform the
wiff-to-mzML conversion and centroiding can be found
[here](https://github.com/EuracBiomedicalResearch/batch_centroid).
