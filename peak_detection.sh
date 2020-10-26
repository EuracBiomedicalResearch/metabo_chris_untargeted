#!/bin/bash

PTH=`pwd`
/shared/bioinf/R/bin/R-4.0.0-BioC3.11 -e 'rmarkdown::render(\"peak_detection.Rmd\")'
