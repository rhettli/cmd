#/user/bin/bash
#Liyanxi

url='www'


if [ $1x == '-h'x ]; then
echo  "[32mUseage for example: [0m"
h=`cat "
Version:1.0.0.1 
    [-tphpe]   will run shell {tail -f php.error_log.log} 
    [-tnginxe]  will run shell {tail -f nginx.error_log.log} 
    [-vphpe]  will run shell {vim php.error_log.log} 
    [-vphpi]   will run shell {vim php.ini} 
    [-cphpi [flag]]  will find the line with flag in php.ini {Example: sh cmd.sh  -cphpi ^error_log } 
" |grep -v cat:|grep -v 'File name too long'`

echo  $h
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

function install(){  
    echo 'installing... wait second...'
    cd ~/
    sudo git clone --depth 1 https://github.com/rhettli/cmd.git
    sudo rm -rf /usr/bin/cmd
    sudo ln -s ~/cmd/cmd.sh /usr/bin/cmd
    echo 'job done'
    echo 'use:[cmd -h] to get help.'
}

# install this progress
if [ $1x == '-i'x ]; then
    if [ -f ~/cmd/cmd.sh ]; then
        cd ~/cmd
        git pull
        echo '[~/cmd] folder already exists,if you want reinstall use:[sudo rm -rf ~/cmd&&cd ~/&&git clone https://github.com/rhettli/cmd.git]'
        echo 'OR : [cmd -ri] when cmd can use normally'
    else
        echo 'installing...   ' $url
        install
    fi
fi
#重新安装，慎重
if [ $1x == '-ri'x ]; then
    sudo rm -rf ~/cmd
    install
fi

if [ ! -f ~/cmd/cmd.sh ]; then
    install
fi



# mysqldump --single-transaction --column-statistics=0  -h120.132.11.45 -ufhsdkfjsdklf -p123  oilcn > db_name.sql


