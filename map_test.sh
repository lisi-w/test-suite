#!/bin/bash

DIR=$(pwd)
ENV=pub
bash ~/esgf/conda.sh ; . ~/.bashrc
conda activate $ENV

echo testing CMIP6 and different map input
echo directory test, can list multiple directories, but must be same project
esgpublish --ini $DIR/test.ini --no-auth --map $DIR/CMIP6/*.map
echo regular mapfile test
esgpublish --ini $DIR/test.ini --no-auth --map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map
echo list of mapfiles test
esgpublish --ini $DIR/test.ini --no-auth --map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.psl.gn.v20210114.map
echo testing file containing list of mapfiles, must be absolute paths
esgpublish --ini $DIR/test.ini --no-auth --map $DIR/CMIP6/maps.txt
echo testing list of files containing list of mapfiles
esgpublish --ini $DIR/test.ini --no-auth --map $DIR/CMIP6/maps.txt $DIR/CMIP6/maps.txt


echo testing custom project NARR_Hydrology
esgpublish --ini $DIR/custom.ini --no-auth --map $DIR/NARR_Hydrology/NARR_Hydrology.SCU.vicoutput-pconst.narr_LOCA_wrf.mon.tas.v1.map
esgpublish --ini $DIR/custom2.ini --no-auth --map $DIR/NARR_Hydrology/NARR_Hydrology.SCU.elev.v1.map


echo testing CREATE-IP
esgpublish --ini $DIR/test.ini --no-auth --project CREATE-IP --map $DIR/CREATE-IP/*.map


echo testing CMIP5
esgpublish --ini $DIR/test.ini --no-auth --project cmip5 --map $DIR/CMIP5/*.map


echo testing cordex
esgpublish --ini $DIR/test.ini --no-auth --project cordex --map $DIR/cordex/*.map


echo testing e3sm
esgpublish --ini $DIR/test.ini --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/model-output/*.map
esgpublish --ini $DIR/test.ini --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/time-series/*.map
esgpublish --ini $DIR/test.ini --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/climo/*.map
esgpublish --ini $DIR/e3sm-mapping.ini --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/mapping/*.map

echo testing input4MIPs
