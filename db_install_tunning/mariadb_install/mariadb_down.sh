

fname=$(basename $0 .sh)
echo $fname
DOWN_LST=`cat $fname.lst`

for url_name in $DOWN_LST
do

     file_name=rpms/$(basename $url_name)  
     if [ ! -f $file_name ]
     then
         echo ">>  wget -O $file_name $url_name "
         wget -O $file_name $url_name 
     else
         echo " >> $file_name exists ~~!!"
     fi


done
