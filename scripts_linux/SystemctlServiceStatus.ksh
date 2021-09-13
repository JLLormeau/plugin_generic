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
${SYSTEM_CTL} ${ARG} ${SERVICE} >/dev/null 2>&1
if [ $? -ne 0 ] ; then
        echo "`date` ${ME}: Commande \"${SUDO} ${SYSTEM_CTL} ${ARG} ${SERVICE}\" en echec"
        exit 1
fi
#
STATUS=`${SUDO} ${SYSTEM_CTL} ${ARG} ${SERVICE} 2>/dev/null | grep "Active:" | awk '{ print $2}'`
if [ X${STATUS} != X"active" ] ; then
        exit 1
fi
#
exit 0 
