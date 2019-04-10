#/user/bin/bash
#Liyanxi

url='www'


if [ $1x == '-h'x ]; then
echo  "[32mUseage for example: [0m"
h=`cat << EOF
Version:1.0.0.1 r\n
    [-tphpe]   will run shell {tail -f php.error_log.log} \r\n
    [-tnginxe]  will run shell {tail -f nginx.error_log.log} \r\n
    [-vphpe]  will run shell {vim php.error_log.log} \r\n
    [-vphpi]   will run shell {vim php.ini} \r\n
    [-cphpi [flag]]  will find the line with flag in php.ini {Example: sh cmd.sh  -cphpi ^error_log } \r\n
EOF
`
echo  $h
fi

# install this progress
if [ $1x == '-i'x ]; then
 echo 'installing...   ' $url
fi

# cat php.ini
if [ $1x == '-cphpi'x ]; then
    php -i|grep .ini|grep Loaded|cut -d '>' -f 2|xargs cat|grep $2
fi

# vim php.ini
if [ $1x == '-vphpi'x ]; then
    vim  `php -i|grep .ini|grep Loaded|cut -d '>' -f 2`
fi

# vim php.error_log.log
if [ $1x == '-vphpe'x ]; then
    vim `php -i|grep .ini|grep Loaded|cut -d '>' -f 2|xargs cat|grep -e ^error_log.*log|cut -d '=' -f 2- `
fi

# tail -f php.error_log.log
if [ $1x == '-tphpe'x ]; then
    tail -f  `php -i|grep .ini|grep Loaded|cut -d '>' -f 2|xargs cat|grep -e ^error_log.*log|cut -d '=' -f 2- `
fi

#
if [ $1x == '-vnginx'x ]; then
    sudo nginx -t|grep success
fi

if [ $1x == '-rnginx'x ]; then
    sudo nginx -s reload
    echo 'finish!'
fi

if [ $1x == '-snginx'x ]; then
    sudo nginx -s stop
fi

if [ $1x == '-tnginx'x ]; then
    sudo nginx -t
fi

#vim `php -i|grep .ini|grep Loaded|cut -d '>' -f 2 `     #vim php.ini
#tail -f  `php -i|grep .ini|grep Loaded|cut -d '>' -f 2|xargs cat|grep -e ^error_log.*log|cut -d '=' -f 2- `         #tail php_error_log