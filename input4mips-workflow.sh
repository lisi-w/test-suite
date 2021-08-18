bash ~/esgf/conda.sh 
. ~/.bashrc

wd=$(pwd)
cmdname=$0
echo $cmdname

#cmddir=`pwd`
cmddir=`dirname $cmdname`


INDIR=$1
mapenv=esgprep
pubenv=pub

upone=`dirname $INDIR`
DESTDIR="$upone/input4MIPs-list-done"
mkdir $DESTDIR

#inidir=$HOME/config/publisher-configs/ini
inidir=/p/user_pub/publish-queue/tmp
tmpdir=$wd/input4mips/tmpfiles
mkdir -p $tmpdir

archdir=$wd/input4mips/pub-workflows-archive
pushd $tmpdir
mkdir $archdir

pycmd=$wd/get_dir_lst.py
success=0

for fn in `ls $INDIR` ; do

    fullpath=$INDIR/$fn    
    [ 0 -eq `echo $fullpath | grep -c json` ] ; res=$?

    if [ $res -eq 0 ] ; then
	
        echo "skipping $fullpath"
	mv $fullpath $DESTDIR
        continue
    fi
    
    echo "-- $fullpath"
    for jsonfn in `cat $fullpath` 
        do
        conda activate
        python $pycmd $jsonfn > tmplst
        conda activate $mapenv
        for dirn in `cat tmplst` 
            do
            esgmapfile --project input4mips -i $inidir $dirn
            done
        conda activate $pubenv
#  Uncomment if custom autocurator is being used
#	export LD_LIBRARY_PATH=$CONDA_PREFIX/lib
        for mapfn in `ls mapfiles` ; do
          ls -l mapfiles/$mapfn
          esgpublish --no-auth --json $jsonfn --config $wd/test.yaml --verbose --project input4mips --map mapfiles/$mapfn
          if [ ! $? -eq 0 ] ; then
	      echo [FAIL] $mapfn
              success=1
          fi
         done
        jsonbase=`basename $jsonfn`
        
        tar -cf $archdir/$jsonbase.tar mapfiles
        rm -rf mapfiles
    done
    

    echo Exiting with $success
    exit $success
    
    
    if [ $success -eq 0 ] 
    then
	echo [DONE] $fullpath
        mv $fullpath $DESTDIR
                
    else
        echo [FAIL] $fullpath
    fi

done

popd
