#!/bin/sh

##=======================================================================================
##
##     ----------------------------------
##      SPACE Script for Linux   V2.1
##     ----------------------------------
#
## Copy-Right
## ---------------
#  Copyright couplwith@yahoo.co.kr  Dr.choi in Seoul Korea.
#  since 2000 hanil life insurance - simmani - enkai - haansoft
#
## Update Note
## ---------------
#   add subdir summery
#            in 2002. 1.  1   : <couplewith@yahoo.co.kr>
#   add sort by summery of size of subdirectory
#            in 2003. 1.  1   : <couplewith@yahoo.co.kr>
#   add installer script v1.0
#            in 2004. 11. 12  : <couplewith@yahoo.co.kr>
#
##=======================================================================================


clear;
echo "";
echo "";
echo "";
df -k ;
APW=`pwd`

#for Sun Server
#du -ok . 2>/dev/null | nawk -F/ -v pas= '
#for Linux Server
#du -Sk . 2>/dev/null | gawk -F/ -v pas= '

du -Sk . 2>/dev/null | gawk -F/ -v pas=$APW '
    BEGIN {
                    print  "\t\t---------------------------";
                    print  "\t\t DIsk Usae of current Dir";
                    print  "\t\t--------------------------";
                    printf "\t\t [%s] \n\n", pas;

                    printf"\t-------------------------------------------------------------\n"
                    printf"\t%-30s : %10s   : %10s \n","DIRNAME", "SIZE (MB)","Subdir cnt";
                    printf"\t-------------------------------------------------------------\n"
               tots=0;
               tcnt=0;
               i=0;
           }
           {
                pos=index($1, ".");
                size=substr($1,1, pos-1);

                tcnt++;
                tots+=size;

                if ( NR ==1 )
                {
                    dirs=$2;
                    dsize=0;
                    dcnt=0;
                }

                if ( dirs == $2 )
                {
                    dsize+=size;
                    dcnt++;
                }
                else
                {
                  # printf"\t%-30s : %10.2fMB : %10d \n",dirs, dsize/1024, dcnt;
                    DIR[i]= dirs;
                    Dsize[i]=dsize/1024;
                    Dcnt[i]=dcnt;

                    dirs=$2;
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
                        printf"\t%-30s : %10.2fMB : %10d \n",DIR[j], Dsize[j], Dcnt[j];
                    }
                    printf"\t-------------------------------------------------------------\n"
                    printf"\t%-30s : %10.2fMB : %10d \n","TOTALSIZE", tots/1024, tcnt;
                    printf"\t-------------------------------------------------------------\n"
                    printf"\t      --  Copy Right @ Choi Doo Rip  1999  --  \n"

            }'
