# Pre-processing of the untargeted metabolomics data from CHRIS

This repository contains all data analysis files for the pre-processing and
normalization of the (HILIC-based) untargeted metabolomics data from CHRIS.

## Contact persons

- Mar Garcia-Aloy
- Johannes Rainer

## Files and structure of the analysis

### Preprocessing

### Normalization

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
