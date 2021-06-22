wd=$(pwd)
bash map_test.sh
bash input4mips-workflow.sh $wd/input4mips/workflow
bash individual_tests.sh
