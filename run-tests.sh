wd=$(pwd)
mkdir $wd/tmp
LOGDIR=$wd/tmp
check_exit () {
  LOG=$1
  ERRS=$(cat $LOG | grep ERROR | wc -l)
  if [ $ERRS -gt 0 ]
  then
    echo "ERROR encountered. See $LOG for details. Exiting."
    exit $2
  else
    echo "SUCCESS"
  fi
}
echo "Reseting index"
bash reset_index.sh > $LOGDIR/reset-index.log 2>&1
check_exit $LOGDIR/reset-index.log 1
echo "Testing separate mapfile integrations and most projects"
bash map_test.sh > $LOGDIR/map-test.log 2>&1
check_exit $LOGDIR/map-test.log 2
echo "Testing input4MIPs mapfiles"
bash input4mips-workflow.sh $wd/input4mips/workflow > $LOGDIR/input4mips.log 2>&1
check_exit $LOGDIR/input4mips.log 3
echo "Testing individual modules"
bash individual_tests.sh > $LOGDIR/modules.log 2>&1
check_exit $LOGDIR/modules.log 4
rm -rf $wd/tmp 
