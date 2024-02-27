# Pre-processing of the untargeted metabolomics data from CHRIS

This repository contains all data analysis files for the pre-processing and
normalization of the (HILIC-based) untargeted metabolomics data from CHRIS.

## Contact persons

- Marilyn De Graeve 
- Johannes Rainer

## Previous contributors

- Vinicius Verri Hernandes
- Mar Garcia-Aloy


## Files and structure of the analysis

The MS data is provided as a self-contained SQL database that also contains
sample annotations (batch IDs etc). The data can be loaded as a `MsExperiment`
object through the
[`MsBackendSql`](https://github.com/RforMassSpectrometry/MsBackendSQl) package.

Analysis scripts are supposed to be run on the calculation cluster using the
respective shell script (e.g. `peak_detection.sh` for `peak_detection.Rmd`). The
script should then be executed with `sbatch --mem-per-cpu=24000 -c 10
--partition=batch ./peak_detection.sh`.


### General data overview

- [general_data_overview.Rmd](general_data_overview.Rmd): general overview and
  summary statistics as well as initial quality assessment of the whole data
  set.


### Preprocessing

-- NEEDS TO BE UPDATED AND FIXED --

- [peak_detection.Rmd](peak_detection.Rmd): peak detection and peak
  post-processing of both positive and negative polarity data.
- [peak_detection_qa.Rmd](peak_detection_qa.Rmd): quality assessment and
  summaries for the peak detection step.

TODO:
- [ ] evaluate alignment on QC samples:
  - check EICs before/after: are we able to *alleviate* the retention time
    shifts caused by the LC maintenance in November 2021?

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
