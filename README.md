# ESGF Testing Suite for the esgcet Package

This repository contains a collection of scripts which test various projects with the new and improved data publisher for ESGF.
Please note that all data pointed to by these mapfiles is housed on LLNL servers. If you do not have access to LLNL servers, feel free to modify the scripts or the contents of the test directories as needed.

To run all tests:
 - modify all the ini files by filling in missing variables as needed.
 - modify the ENV argument at the top of the map_test.sh script and the pubenv argument at the top of the input4mips-workflow.sh script to the conda environment in which you have installed esgcet.
 - modify the mapenv argument at the top of the input4mips-workflow.sh script to the conda environment in which you have installed esgprep, which contains the command to create mapfiles.
 - then, run `bash run-tests.sh`.

To run individual tests:
 - modify all the ini files by filling in missing variables as needed.
 - modify each script as needed to the correct variables (see above).
 - run the chosen script using bash.

You can also see example output of errors it is possible to encounter from typos/duplicate entries or other syntax issues from your ini file.
These test scripts can also be useful to see example commands and ini files if you are just starting out with the new publisher.
If you'd like to see additional projects tested or have an unexpected error, feel free to open an issue.
