#!/bin/bash

DIR=$(pwd)
ENV=pub
bash ~/esgf/conda.sh ; . ~/.bashrc
conda activate $ENV

echo testing CMIP6 and different map input
echo directory test, can list multiple directories, but must be same project
esgpublish --config $DIR/test.yaml --project CMIP6 --no-auth --map $DIR/CMIP6/*.map
echo regular mapfile test
esgpublish --config $DIR/test.yaml --project CMIP6 --no-auth --map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map
echo list of mapfiles test
esgpublish --config $DIR/test.yaml --project CMIP6 --no-auth --map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.prw.gn.v20210114.map $DIR/CMIP6/CMIP6.DCPP.MRI.MRI-ESM2-0.dcppA-hindcast.s2017-r1i1p1f1.Amon.psl.gn.v20210114.map
echo testing file containing list of mapfiles, must be absolute paths
esgpublish --config $DIR/test.yaml --project CMIP6 --no-auth --map $DIR/CMIP6/maps.txt
echo testing list of files containing list of mapfiles
esgpublish --config $DIR/test.yaml --project CMIP6 --no-auth --map $DIR/CMIP6/maps.txt $DIR/CMIP6/maps.txt


echo testing custom project NARR_Hydrology
esgpublish --config $DIR/custom.yaml --no-auth --map $DIR/NARR_Hydrology/NARR_Hydrology.SCU.vicoutput-pconst.narr_LOCA_wrf.mon.tas.v1.map
esgpublish --config $DIR/custom2.yaml --no-auth --map $DIR/NARR_Hydrology/NARR_Hydrology.SCU.elev.v1.map


echo testing CREATE-IP
esgpublish --config $DIR/test.yaml --no-auth --project CREATE-IP --map $DIR/CREATE-IP/*.map


echo testing CMIP5
esgpublish --config $DIR/test.yaml --no-auth --project cmip5 --map $DIR/CMIP5/*.map


echo testing cordex
esgpublish --config $DIR/test.yaml --no-auth --project cordex --map $DIR/cordex/*.map


echo testing e3sm
esgpublish --config $DIR/test.yaml --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/model-output/*.map
esgpublish --config $DIR/test.yaml --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/time-series/*.map
esgpublish --config $DIR/test.yaml --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/climo/*.map
esgpublish --config $DIR/e3sm-mapping.yaml --json e3sm_xattr.json --no-auth --project E3SM --map $DIR/E3SM/mapping/*.map

echo testing input4MIPs
