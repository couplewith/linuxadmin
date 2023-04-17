#!/bin/sh

dos2unix $0

CopyRights="
##=======================================================================================
##
##     ----------------------------------
##      SPACE Script for Linux   V2.2
##     ----------------------------------
#
## Copy-Right
## ---------------
#  Copyright couplwith@yahoo.co.kr  Dr.choi in Seoul Korea.
#  since 2000 hanil life insurance - simmani - enkai - haansoft
#
## Update Note
## ---------------
#  1999.  9.   1 : init                                v0.1  by <couplewith@yahoo.co.kr>
#  2002.  1.   1 : add subdir summery                  v0.9  by <couplewith@yahoo.co.kr>
#  2003.  1.   1 : add sort by summery of size of subdirectory v1.0  by <couplewith@yahoo.co.kr> 
#  2004. 11. 12 : add installer script                 v1.1  by <couplewith@yahoo.co.kr> 
#  2016.  5. 28 : modify linewidth changed and comment v2.1  by <couplewith@yahoo.co.kr> 
#  2017. 10. 01 : add dirpattern script                v2.2  by <couplewith@yahoo.co.kr> 
#
# # Install guiude 
#  --------------------
#   This is Shell script with awk (gawk, nawk) and du commands.
#   Using 'space' is easy find where are usage large files or space in your data storage.
#   This Script show that shell script is a good program for your system management.
#   Imagine for easy and convinence ...
#   Thank you.
#
#   For using 'space' command by followed some steps:
#   1. Requirement : linux : gawk du (cygwin) / unix nawk, gawk, du
#   2. Download and Save as  install-space.sh
#      and run install-space.sh for installation.
#        it will create : /usr/local/bin/space  and 
#             chmod 755 /usr/local/bin/space
#   3. command and execute : space 
#   * other wise you can copy the space file to ~/bin/space and chmod 755 ~/bin/space
#
##=======================================================================================
"

echo "$CopyRights";


##+++++++++++++++++++++++++++++++++++++++++++
## CHK Enviroment Section
##+++++++++++++++++++++++++++++++++++++++++++
SupportOS="SunOS Linux";


TargetOS=`uname -a | cut -d" " -f1`

case  "$TargetOS" in
      SunOS )
               Chk=true;
               DuOption="-ok";
               WhichAwk="nawk";
               ;;
     Linux )
               Chk=true;
               DuOption="-Sk";
               WhichAwk="gawk";
               ;;
     AIX )
               Chk=true;
               DuOption="-k";
               WhichAwk="awk";
               ;;
      * )
               Chk=false;
               DuOption="bad";
               echo " space dose not Support your Sytem !! [ support : $SupportOS ]";
               exit;

esac

echo " Start  ++ Pre Install  Section ++";

##+++++++++++++++++++++++++++++++++++++++++++
## Pre Install  Section
##+++++++++++++++++++++++++++++++++++++++++++


echo -n " INSALL sapce to /usr/bin/space  Yes/No : ";

read Inkey
echo  "  Input : $Inkey  ";
if [[  "Y" == "$Inkey" || "y" ==  "$Inkey" || "yes" ==  "$Inkey" || "Yes" == "$Inkey" ]]
then
    echo " Start  install ";
else
    echo " Stop  and exit";
    exit;
fi



##+++++++++++++++++++++++++++++++++++++++++++
## Pre Install  Section
##+++++++++++++++++++++++++++++++++++++++++++



cat > /usr/bin/space <<!
#!/bin/sh


${CopyRights}

clear;
echo "";
echo "";
echo "";
df -k ;
APW=\`pwd\`
APW=\${1:-\`pwd\`}

#for Sun Server
#du -ok . 2>/dev/null | nawk -F/ -v pas=$APW '
#for Linux Server
#du -Sk $APW 2>/dev/null | gawk -F/ -v pas=$APW '
#du ${DuOption} \$APW 2>/dev/null | sed -e "s/\$dpattern/./"
#   dpattern : \/usr\/local\/src

dpattern=\$( echo "\$APW" | sed -e 's/\//\\\\\//g' )

du ${DuOption} \$APW 2>/dev/null | sed -e "s/\$dpattern/./" | ${WhichAwk} -F/ -v pas=\$APW '
    BEGIN {
                    print  "\t\t------------------------------";
                    print  "\t\t DIsk Usae of current Dir V2.2";
                    print  "\t\t------------------------------";
                    printf "\t\t [%s] \n\n", pas;

                    printf"\t-------------------------------------------------------------------------------\n"
                    printf"\t%-50s : %12s   : %10s \n","DIRNAME", "SIZE (MB)","Subdir cnt";
                    printf"\t-------------------------------------------------------------------------------\n"
               tots=0;
               tcnt=0;
               i=0;
           }
           {
                pos=index(\$1, ".");
                if(pos > 0 ){
                    size=substr(\$1,1, pos-1);
                }else{
                    size=\$1;
                }
                gsub(" ","" , \$2);

                tcnt++;
                tots+=size;

                if ( NR ==1 )
                {
                    dirs=\$2;
                    dsize=0;
                    dcnt=0;
                }

                if ( dirs == \$2 )
                {
                    dsize+=size;
                    dcnt++;
                }
                else
                {
                  # printf"\t%-45s : %10.2fMB : %10d \n",dirs, dsize/1024, dcnt;
                    DIR[i]= dirs;
                    Dsize[i]=dsize/1024;
                    Dcnt[i]=dcnt;

                    dirs=\$2;
                    dsize=size;
                    dcnt=1;
                    i = i + 1;
                }

            }
        END {
                    DIR[i]  = "./";
                    Dsize[i]=dsize/1024;
                    Dcnt[i]=dcnt;

                    # SORT SECTION
                    for ( j=0; j<i ; j++ )
                    {
                        for ( k=j+1; k<=i ; k++ )
                        {
                           if ( Dsize[j] > Dsize [k]){
                               tmp1=DIR[j];
                               tmp2=Dsize[j];
                               tmp3=Dcnt[j];

                               DIR[j]=DIR[k];
                               Dsize[j]=Dsize[k];
                               Dcnt[j]=Dcnt[k];

                               DIR[k]=tmp1;
                               Dsize[k]=tmp2;
                               Dcnt[k]=tmp3;
                           }
                        }
                    }

                    # PRINT SECTION
                    for ( j=0; j<=i ; j++ )
                    {
                        printf"\t%-50s : %10.2fMB : %10d \n",DIR[j], Dsize[j], Dcnt[j];
                    }
                    printf"\t-------------------------------------------------------------------------------\n"
                    printf"\t%-50s : %10.2fMB : %10d \n","TOTALSIZE", tots/1024, tcnt;
                    printf"\t-------------------------------------------------------------------------------\n"
                    printf"\t      --  Copy Right @ Choi Doo Rip  1999 09 01  --  \n"

            }'
!


chmod 755 /usr/bin/space

exit 0
