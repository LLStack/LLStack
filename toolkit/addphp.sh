#!/usr/bin/env bash

echow(){
    FLAG=${1}
    shift
    echo -e "\033[1m${EPACE}${FLAG}\033[0m${@}"
}

help_message(){
    echo -e "\033[1mOPTIONS\033[0m"
    echow '-p, --php, --lsphp [PHP_Verion]'
    echo "${EPACE}${EPACE}Will install the new lsphp version in LLStack, eg: -p 74"
    echow '-D, --default'
    echo "${EPACE}${EPACE}will set the newly installed PHP as the default version in LLStack" 
    echow '-H, --help'
    echo "${EPACE}${EPACE}Display help and exit."       
    exit 0
}

check_input(){
    if [ -z "${1}" ]; then
        help_message 2
    fi
}

install_lsphp(){
    case ${LSPHP} in
      56)
      yum install -y php56-php-litespeed php56-php-cli php56-php-bcmath php56-php-gd php56-php-mbstring php56-php-mcrypt php56-php-mysqlnd php56-php-opcache php56-php-pdo php56-php-pecl-crypto php56-php-pecl-geoip php56-php-pecl-zip php56-php-recode php56-php-snmp php56-php-soap php56-php-xml
      if [ ! -f "/usr/local/lsws/lsphp56/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp56/bin/
        ln -s /opt/remi/php56/root/usr/bin/lsphp /usr/local/lsws/lsphp56/bin/lsphp
      fi
      ;;
      70)
      yum install -y php70-php-litespeed php70-php-cli php70-php-bcmath php70-php-gd php70-php-json php70-php-mbstring php70-php-mcrypt php70-php-mysqlnd php70-php-opcache php70-php-pdo php70-php-pecl-crypto php70-php-pecl-geoip php70-php-pecl-zip php70-php-recode php70-php-snmp php70-php-soap php70-php-xml
      if [ ! -f "/usr/local/lsws/lsphp70/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp70/bin/
        ln -s /opt/remi/php70/root/usr/bin/lsphp /usr/local/lsws/lsphp70/bin/lsphp
      fi
      ;;
      71)
      yum install -y php71-php-litespeed php71-php-cli php71-php-bcmath php71-php-gd php71-php-json php71-php-mbstring php71-php-mcrypt php71-php-mysqlnd php71-php-opcache php71-php-pdo php71-php-pecl-crypto php71-php-pecl-geoip php71-php-pecl-zip php71-php-recode php71-php-snmp php71-php-soap php71-php-xml
      if [ ! -f "/usr/local/lsws/lsphp71/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp71/bin/
        ln -s /opt/remi/php71/root/usr/bin/lsphp /usr/local/lsws/lsphp71/bin/lsphp
      fi
      ;;
      72)
      yum install -y php72-php-litespeed php72-php-cli php72-php-bcmath php72-php-gd php72-php-json php72-php-mbstring php72-php-mcrypt php72-php-mysqlnd php72-php-opcache php72-php-pdo php72-php-pecl-crypto php72-php-pecl-mcrypt php72-php-pecl-geoip php72-php-pecl-zip php72-php-recode php72-php-snmp php72-php-soap php72-php-xml
      if [ ! -f "/usr/local/lsws/lsphp72/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp72/bin/
        ln -s /opt/remi/php72/root/usr/bin/lsphp /usr/local/lsws/lsphp72/bin/lsphp
      fi
      ;;
      73)
      yum install -y php73-php-litespeed php73-php-cli php73-php-bcmath php73-php-gd php73-php-json php73-php-mbstring php73-php-mcrypt php73-php-mysqlnd php73-php-opcache php73-php-pdo php73-php-pecl-crypto php73-php-pecl-mcrypt php73-php-pecl-geoip php73-php-pecl-zip php73-php-recode php73-php-snmp php73-php-soap php73-php-xml
      if [ ! -f "/usr/local/lsws/lsphp73/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp73/bin/
        ln -s /opt/remi/php73/root/usr/bin/lsphp /usr/local/lsws/lsphp73/bin/lsphp
      fi
      ;;
      74)
      yum install -y php74-php-litespeed php74-php-cli php74-php-bcmath php74-php-gd php74-php-json php74-php-mbstring php74-php-mcrypt php74-php-mysqlnd php74-php-opcache php74-php-pdo php74-php-pecl-crypto php74-php-pecl-mcrypt php74-php-pecl-geoip php74-php-pecl-zip php74-php-recode php74-php-snmp php74-php-soap php74-php-xml
      if [ ! -f "/usr/local/lsws/lsphp74/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp74/bin/
        ln -s /opt/remi/php74/root/usr/bin/lsphp /usr/local/lsws/lsphp74/bin/lsphp
      fi
      ;;
      80)
      yum install -y php80-php-litespeed php80-php-cli php80-php-bcmath php80-php-gd php80-php-json php80-php-mbstring php80-php-mcrypt php80-php-mysqlnd php80-php-opcache php80-php-pdo php80-php-pecl-crypto php80-php-pecl-mcrypt php80-php-pecl-geoip php80-php-pecl-zip php80-php-snmp php80-php-soap php80-php-xml
      if [ ! -f "/usr/local/lsws/lsphp80/bin/lsphp" ]; then
        mkdir -p /usr/local/lsws/lsphp80/bin/
        ln -s /opt/remi/php80/root/usr/bin/lsphp /usr/local/lsws/lsphp80/bin/lsphp
      fi
      ;;
    esac
}

lsws_restart(){
    /usr/local/lsws/bin/lswsctrl restart >/dev/null
}
fst_match_line(){
    FIRST_LINE_NUM=$(grep -n -m 1 ${1} ${2} | awk -F ':' '{print $1}')
}
add_lscfg(){
    fst_match_line '</extProcessor>' /usr/local/lsws/conf/templates/llstack.xml
    NEWNUM=$((FIRST_LINE_NUM+1))
    #VH_NAME_lsphpXX='$VH_NAME_lsphp'
    sed -i "${NEWNUM}i \ \ \ \ \  <extProcessor>\n \ \ \ \ \ \  <type>lsapi</type>\n \ \ \ \ \ \  <name>\$VH_NAME_lsphp${LSPHP}</name>\n \ \ \ \ \ \  <address>uds://tmp/lshttpd/\$VH_NAME_lsphp${LSPHP}.sock</address>\n \ \ \ \ \ \  <maxConns>35</maxConns>\n \ \ \ \ \ \  <env>PHP_LSAPI_CHILDREN=35</env>\n \ \ \ \ \ \  <initTimeout>60</initTimeout>\n \ \ \ \ \ \  <retryTimeout>0</retryTimeout>\n \ \ \ \ \ \  <respBuffer>0</respBuffer>\n \ \ \ \ \ \  <autoStart>1</autoStart>\n \ \ \ \ \ \  <path>/usr/local/lsws/lsphp${LSPHP}/bin/lsphp</path>\n \ \ \ \ \ \  <backlog>100</backlog>\n \ \ \ \ \ \  <instances>1</instances>\n \ \ \ \ \ \  <extMaxIdleTime>-1</extMaxIdleTime>\n \ \ \ \ \ \  <priority>0</priority>\n \ \ \ \ \ \  <memSoftLimit>2047M</memSoftLimit>\n \ \ \ \ \ \  <memHardLimit>2047M</memHardLimit>\n \ \ \ \ \ \  <procSoftLimit>3000</procSoftLimit>\n \ \ \ \ \ \  <procHardLimit>4000</procHardLimit>\n \ \ \ \ \  </extProcessor>" /usr/local/lsws/conf/templates/llstack.xml
}

make_default(){
    fst_match_line '<handler>$VH_NAME_lsphp' /usr/local/lsws/conf/templates/llstack.xml
    sed -i "${FIRST_LINE_NUM}d" /usr/local/lsws/conf/templates/llstack.xml
    sed -i "${FIRST_LINE_NUM}i\\ \ \ \ \ \ \ \ \<handler\>\$VH_NAME_lsphp${LSPHP}\<\/handler\>"  /usr/local/lsws/conf/templates/llstack.xml
    if [ -f "/usr/bin/php" ]; then
      rm -f /usr/bin/php.old
      mv /usr/bin/php /usr/bin/php.old
    fi
      ln -s /opt/remi/php${LSPHP}/root/usr/bin/php /usr/bin/php
}

main_addphp(){
    install_lsphp ${LSPHP}
    add_lscfg
    lsws_restart
}

check_input ${1}
while [ ! -z "${1}" ]; do
    case ${1} in
        -[hH] | -help | --help)
            help_message
            ;;
        -[pP] | -php | --lsphp) shift
            check_input "${1}"
            LSPHP="${1}"
            main_addphp
            ;;
        -[dD] | -default | --default)
            make_default
            lsws_restart
            ;;
        *) 
            help_message
            ;;              
    esac
    shift
done