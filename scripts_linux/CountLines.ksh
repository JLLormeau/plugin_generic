
ME=`basename $0`

if [ $# -ne 1 ] ; then
        echo "`date` ${ME} - Usage : ${ME} file_path"
        exit 1
fi

sudo -n cat $1 | wc -l
