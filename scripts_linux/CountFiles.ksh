
ME=`basename $0`

if [ $# -ne 1 ] ; then
        echo "`date` ${ME} - Usage : ${ME} diretory_path"
        exit 1
fi

sudo -n ls $1 | wc -l
