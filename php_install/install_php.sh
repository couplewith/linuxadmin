
mkdir php_src
cd php_src

. /etc/rc.d/init.d/functions
# ***************************************
  echo " >> GET PHP-SRC "
# ***************************************

VER="5.4.0"
VER="5.3.13"
VER="5.4.14" # 201305
VER="5.5.2"  # 201309
VER="5.5.14" # 201407
VER="5.5.15" # 201408

rm -rf php-$VER

if [ !  -f php-$VER.tar.bz2 ]
then
    echo " >> PHP Download !! "
  #  wget http://kr.php.net/get/php-$VER.tar.bz2/from/this/mirror  -O php-$VER.tar.bz2
    wget http://kr1.php.net/get/php-$VER.tar.bz2/from/this/mirror -O php-$VER.tar.bz2
    tar xvjf php-$VER.tar.bz2
else
    ls -al  php-$VER.tar.bz2
    tar xvjf php-$VER.tar.bz2
fi

## --------------------------------------------------
yum -y install re2c libmcrypt libmcrypt-devel;
yum -y install  net-snmp  net-snmp-devel
yum -y install  gd gd-devel libpng openjpeg openjpeg-devel libpng-devel libxml2  libxml2-devel


# ***************************************
  echo " >> Configure PHP "
# ***************************************
USE_APACHE=YES;
USE_FPM=YES;
USE_ORACLE=YES;
USE_PGSQL=YES;
USE_MYSQL=YES;
USE_IMAGE=YES;
USE_RRD=YES;

cd php-${VER}
make clean

PLATFORM=`uname -i`
lib_src="/usr/lib"

  
  if [ $PLATFORM = "x86_64" ]
  then
      echo "-- x86_64 ----------------------------------- \n\n"
      lib_64=" --with-libdir=lib64 "
      lib_src="/usr/lib64"
      export LDFLAGS="-L/usr/lib64 -L/usr/lib"
  fi

  
  if [ $USE_APACHE == "YES" ]
  then
      echo "++++++++++++ APACHE +++++++++++++++++++++ "
      echo "---------------------------------------- \n\n"

      if [ -d "/usr/local/apache2" ]
      then
          config_apache=" --with-apxs2=/usr/local/apache2/bin/apxs ";
      fi
      echo " > USE_APACHE : $USE_APACHE "; echo_passed;
  fi

  if [ $USE_ORACLE == "YES" ]
  then

      echo "++++++++++++ ORACLE +++++++++++++++++++++ "
      echo "---------------------------------------- \n\n"

      if [ -f ~oracle/.bash_profile ]
      then
         if [ $ORACLE_HOME ]
         then
         config_oracle=" --with-oci8=instantclient,/usr/lib/oracle/11.2/client64/lib  --enable-sigchild --enable-inline-optimization "
         config_oracle_pdo=" --with-pdo-oci=instantclient,/usr,11.2 "
         fi
      else 
         echo " > USE_ORACLE.pdo : $USE_ORACLE "; echo_failure;
      fi
    
      oracle_client_chk=`find /usr/include -name "oci.h" 2>/dev/null | wc -l`
      if [ $oracle_client_chk -eq 1 ]
      then
         config_oracle=" --with-oci8=instantclient,/usr/lib/oracle/11.2/client64/lib  --enable-sigchild --enable-inline-optimization "
         config_oracle_pdo=" --with-pdo-oci=instantclient,/usr,11.2 "
         echo " > USE_ORACLE : $USE_ORACLE "; echo_passed;
      else
         echo " > USE_ORACLE.clnt : $USE_ORACLE "; echo_failure;
      fi
  fi


  if [ $USE_MYSQL == "YES" ]
  then

      echo "++++++++++++ MYSQL +++++++++++++++++++++ "
      echo "---------------------------------------- \n\n"

      MYSQL_CONFIG="/usr/bin/mysql_config"
      if [  -f "$MYSQL_CONFIG" ]
      then
            # MYSQL_LIB_DIR=`/usr/bin/mysql_config --variable=pkglibdir`; 
            MYSQL_LIB_DIR=`$MYSQL_CONFIG --plugindir | xargs dirname `
      else
            if [ $PLATFORM = "x86_64" ]
            then
                MYSQL_LIB_DIR="/usr/lib64"
            else
                MYSQL_LIB_DIR="/usr/lib"
            fi
      fi
    
      if [ ! -L $MYSQL_LIB_DIR/libmysqlclient.so ]
      then
            MYSQL_LD_CLNT_SO=`find $MYSQL_LIB_DIR -name "libmysqlclient.so.*"  |sort|tail -1 `
            MYSQL_LD_CLNT_R=`find $MYSQL_LIB_DIR -name "libmysqlclient_r.so.*" |sort|tail -1 `
            if [ -f "$MYSQL_LD_CLNT_SO" ]
            then
                  ln -s $MYSQL_LD_CLNT_SO  ${MYSQL_LIB_DIR}/libmysqlclient.so
                  ln -s $MYSQL_LD_CLNT_R  ${MYSQL_LIB_DIR}/libmysqlclient_r.so
            fi
            echo " >> mysql : SHARED Obj MAKE LINK : ln -s $MYSQL_LD_CLNT_SO  ${MYSQL_LIB_DIR}/libmysqlclient.so ";
            echo " >> mysql : SHARED Obj MAKE LINK : ln -s $MYSQL_LD_CLNT_R  ${MYSQL_LIB_DIR}/libmysqlclient_r.so ";
      fi

      config_mysql="--with-mysql=mysqlnd --with-mysqli=mysqlnd ";
      config_mysql_pdo=" --with-pdo-mysql=mysqlnd ";

      echo " >> mysql : mysql     : $config_mysql "
      echo " >> mysql : mysql_pdo : $config_mysql_pdo "
      echo " > USE_MYSQL : $USE_MYSQL "; echo_passed;
    
  fi

  if [ $USE_PGSQL == "YES" ]
  then
      echo "++++++++++++ PGSQL +++++++++++++++++++++ "
      echo "---------------------------------------- \n\n"
    
      PGSQL=`which psql`
      if [ -f "$PGSQL" ]
      then
          PGSQL_PATH=`echo "$PGSQL" | xargs dirname|xargs dirname`
          config_pgsql="  --with-pgsql=$PGSQL_PATH  ";
          #config_pdo_pgsql="  --with-pdo-pgsql=/usr ";
      
          echo " > USE_PGSQL : $USE_PGSQL "; echo_success;
      else
          echo " > USE_PGSQL : $USE_PGSQL "; echo_passed;
      fi
  fi

  echo "++++++++++++ CONFIGURE +++++++++++++++++++++ "
  echo "---------------------------------------- \n\n"

make clean
./configure --prefix=/usr/local/fpm-php --exec-prefix=/usr/local/fpm-php \
	   --with-config-file-scan-dir=/usr/local/lib/php/modules \
             $config_apache $lib_64  --enable-fpm \
            --enable-sockets --enable-zip --enable-shared --enable-static \
            --enable-mbstring --enable-mbregex --enable-bcmath --enable-ftp --disable-debug \
            --with-config-file-path=/usr/local/lib --with-curl=/usr \
            --with-openssl --with-iconv \
            --with-gd --with-jpeg-dir=/usr --with-png-dir=/usr --with-zlib-dir=/usr --with-freetype-dir=/usr --enable-gd-native-ttf \
            $config_oracle $config_oracle_pdo \
            $config_mysql $config_mysql_pdo \
            $config_pgsql $config_pgsqll_pdo \
            --with-snmp=/usr --with-openssl-dir=/usr \
	    --with-mcrypt \
            --enable-roxen-zts  
#            --with-pdo-oci=instantclient,/usr/lib/oracle/11.2/client64/lib,11.2 \


tail -50 config.log

  echo "++++++++++++ Compilng !!! ++++++++++++++++++ "
  echo "---------------------------------------- \n\n"


pwd 
make && echo_success &&  make install && echo_success &> install_fpm-php.log

#cp ./php.ini-production /usr/local/lib/php.ini

#############################################

if [ -f /usr/local/src/websrc/php_cfg/php-fpm ]
then
   cp -p /usr/local/src/websrc/php_cfg/php-fpm /etc/rc.d/init.d/
fi
chkconfig --add php-fpm
chkconfig --level 345  nginx on

