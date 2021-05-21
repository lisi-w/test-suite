#!/bin/bash

bash ~/esgf/conda.sh ; . ~/.bashrc
conda activate pub

# directory test, can list multiple directories, but must be same project
esgpublish --ini /export/witham3/.esg/test.ini  --map /export/witham3/test-suite/CMIP6/*.map
# regular mapfile test
esgpublish --ini ~/.esg/test.ini --map ~/test-suite/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map
# list of mapfiles test
esgpublish --ini ~/.esg/test.ini --map ~/test-suite/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map ~/test-suite/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.psl.gn.v20210114.map
# file containing list of mapfiles (must be absolute paths)
esgpublish --ini /export/witham3/.esg/test.ini --map ~/test-suite/CMIP6/maps.txt
# list of files containing list of mapfiles
esgpublish --ini /export/witham3/.esg/test.ini --map ~/test-suite/CMIP6/maps.txt ~/test-suite/CMIP6/maps.txt
