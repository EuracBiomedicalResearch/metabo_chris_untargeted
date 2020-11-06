#!/bin/bash

PTH=`pwd`
/shared/bioinf/R/bin/R-4.0-BioC3.12 -e 'rmarkdown::render(\"peak_detection.Rmd\")'
