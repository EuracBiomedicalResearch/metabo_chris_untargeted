#!/bin/bash

## To run that script through the queueing system use e.g.
##
## sbatch --mem-per-cpu=64000 -p slow -c 10 ./CHRIS_preprocessing_pos.sh
##
## adapting the parameters -c (number of CPUs), --mem-per-cpu=64000, memory
## for each CPU (need to maybe use lower numbers). Paramter -p can be used
## to select the "partition" (queue). -p slow will put the job in a higher
## priority queue, is then however also limited by time.
##
## More info on the queueing system: https://wiki.gm.eurac.edu/index.php?title=Queuing_system

PTH=`pwd`
/shared/bioinf/R/bin/R-4.4-BioC3.19 -e 'rmarkdown::render(\"CHRIS_preprocessing_pos.Rmd\")'
