#!/bin/bash

DIR=$(pwd)
ENV=pub
bash ~/esgf/conda.sh ; . ~/.bashrc
conda activate $ENV

echo testing CMIP6 with individual modules
echo esgmapconv test
esgmapconv --ini $DIR/test.ini --out-file $DIR/map-data-test.json --project CMIP6 --map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map
echo autocurator test
bash $DIR/autocurator.sh autocurator $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map $DIR/scan-test.json
echo esgmkpubrec test
esgmkpubrec --ini $DIR/test.ini --out-file $DIR/data-rec-test.json --project CMIP6 --map-data $DIR/map-data-test.json --scan-file $DIR/scan-test.json
echo esgpidcitepub test
esgpidcitepub --ini $DIR/test.ini --out-file $DIR/pid-rec-test.json --pub-rec $DIR/data-rec-test.json --test
echo esgupdate test 
esgupdate --no-auth --ini $DIR/test.ini --pub-rec $DIR/pid-rec-test.json 
echo esgindexpub test
esgindexpub --no-auth --ini $DIR/test.ini --pub-rec $DIR/pid-rec-test.json
echo esgmigrate test
esgmigrate --old-config ./ --destination ./new-esg.ini --verbose 
cat ./new-esg.ini
