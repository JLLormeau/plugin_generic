#
# SystemctlServiceStatus.ksh
#
# DEOS 10/2018
#
ME=`basename $0`
SYSTEM_CTL=/bin/systemctl
#
if [ $# -ne 1 ] ; then
        echo "`date` ${ME} - Usage : ${ME} nom_du_service"
        exit 1
fi
#
SERVICE=$1
ARG=status
#
${SYSTEM_CTL} ${ARG} ${SERVICE}
exit 0
