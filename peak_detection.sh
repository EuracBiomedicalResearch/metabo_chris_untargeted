#!/bin/bash

PTH=`pwd`
/shared/bioinf/R/bin/R-4.1-BioC3.13 -e 'rmarkdown::render(\"peak_detection.Rmd\")'
