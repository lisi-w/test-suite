ENV=pub
bash ~/esgf/conda.sh ; . ~/.bashrc ; conda activate $ENV
for file in ./CMIP5/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

for file in ./cordex/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

for file in ./input4mips/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

for file in ./CMIP6/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

for file in ./E3SM/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

for file in ./CREATE-IP/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

for file in ./NARR_Hydrology/*.map
do
  DSET_ID="${file%.*}|greyworm1-rh7.llnl.gov"
  esgunpublish --no-auth --dset-id $DSET_ID --index-node nimbus3.llnl.gov
done

