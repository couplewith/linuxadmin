


VER="1.12.2"

source="nginx-$VER.tar.gz"

if [ -f "src/$source" ]
then
    echo " Exists : $source "
else
    mkdir src
    wget http://nginx.org/download/$source -O  src/$source
    ls -al src/$source
fi

###############################################

cd src
tar xvzf $source

cd nginx-$VER
ls -al 

################################################
yum install gcc -y
yum install pcre pcre-devel -y
yum install zlib zlib-devel openssl openssl-devel -y
################################################
temp_dir_proxy=/usr/local/nginx/temp_proxy
temp_dir_fastcgi=/usr/local/nginx/temp_fastcgi
temp_dir_cgi=/usr/local/nginx/temp_cgi

mkdir -p $temp_dir_proxy
mkdir -p $temp_dir_fastcgi
mkdir -p $temp_dir_cgi
################################################

./configure --prefix=/usr/local/nginx
            --with-openssl   \
            --with-zlib      \
            --with-pcre     \
            --with-stream     \
            --with-http_ssl_module \
            --with-file-aio        \
            --http-client-body-temp-path    \
            --http-proxy-temp-path=$temp_dir_proxy      \
            --http-fastcgi-temp-path=$temp_dir_fastcgi  \
            --http-uwsgi-temp-path=$temp_dir_cgi        \
            --http-scgi-temp-path=$temp_dir_cgi         


make && make install


