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


#echo testing custom project NARR_Hydrology
#esgpublish --ini $DIR/custom.ini --map $DIR/NARR_Hydrology/NARR_Hydrology.SCU.vicoutput-pconst.narr_LOCA_wrf.mon.tas.v1.map
#esgpublish --ini $DIR/custom2.ini --map $DIR/NARR_Hydrology/NARR_Hydrology.SCU.elev.v1.map


echo testing CREATE-IP
esgpublish --ini $DIR/test.ini --no-auth --project CREATE-IP --map $DIR/CREATE-IP/*.map


echo testing CMIP5
esgpublish --ini $DIR/test.ini --no-auth --project cmip5 --map $DIR/CMIP5/*.map


echo testing cordex
esgpublish --ini $DIR/test.ini --no-auth --project cordex --map $DIR/cordex/*.map


echo testing input4MIPs
esgpublish --ini $DIR/test.ini --no-auth --project input4MIPs --map $DIR/input4mips/*.map
