Transparent huge pages are enabled, according to /sys/kernel/mm/transparent_hugepage/enabled
2017-10-03 16:04:27 139670368164096 [ERROR] TokuDB: Huge pages are enabled, disable them before continuing

2017-10-03 16:04:27 139670368164096 [ERROR] ************************************************************
2017-10-03 16:04:27 139670368164096 [ERROR]
2017-10-03 16:04:27 139670368164096 [ERROR]                         @@@@@@@@@@@
2017-10-03 16:04:27 139670368164096 [ERROR]                       @@'         '@@
2017-10-03 16:04:27 139670368164096 [ERROR]                      @@    _     _  @@
2017-10-03 16:04:27 139670368164096 [ERROR]                      |    (.)   (.)  |
2017-10-03 16:04:27 139670368164096 [ERROR]                      |             ` |
2017-10-03 16:04:27 139670368164096 [ERROR]                      |        >    ' |
2017-10-03 16:04:27 139670368164096 [ERROR]                      |     .----.    |
2017-10-03 16:04:27 139670368164096 [ERROR]                      ..   |.----.|  ..
2017-10-03 16:04:27 139670368164096 [ERROR]                       ..  '      ' ..
2017-10-03 16:04:27 139670368164096 [ERROR]                         .._______,.
2017-10-03 16:04:27 139670368164096 [ERROR]
2017-10-03 16:04:27 139670368164096 [ERROR] TokuDB will not run with transparent huge pages enabled.
2017-10-03 16:04:27 139670368164096 [ERROR] Please disable them to continue.
2017-10-03 16:04:27 139670368164096 [ERROR] (echo never > /sys/kernel/mm/transparent_hugepage/enabled)
2017-10-03 16:04:27 139670368164096 [ERROR]
2017-10-03 16:04:27 139670368164096 [ERROR] ************************************************************
2017-10-03 16:04:27 139670368164096 [ERROR] Plugin 'TokuDB' init function returned error.
2017-10-03 16:04:27 139670368164096 [ERROR] Plugin 'TokuDB' registration as a STORAGE ENGINE failed.
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: Using mutexes to ref count buffer pool pages
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: The InnoDB memory heap is disabled
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: Compressed tables use zlib 1.2.7
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: Using Linux native AIO
2017-10-03 16:04:27 139670368164096 [Note] InnoDB: Using SSE crc32 instructions




[root@es1 MyDB]# cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]


SQL> SHOW ENGINES;

Engine              Support  Comment                                                                                           Transactions  XA      Savepoints  
------------------  -------  ------------------------------------------------------------------------------------------------  ------------  ------  ------------
MRG_MyISAM          YES      Collection of identical MyISAM tables                                                             NO            NO      NO          
CSV                 YES      CSV storage engine                                                                                NO            NO      NO          
Aria                YES      Crash-safe tables with MyISAM heritage                                                            NO            NO      NO          
MyISAM              DEFAULT  MyISAM storage engine                                                                             NO            NO      NO          
TokuDB              YES      Percona TokuDB Storage Engine with Fractal Tree(tm) Technology                                    YES           YES     YES         
MEMORY              YES      Hash based, stored in memory, useful for temporary tables                                         NO            NO      NO          
InnoDB              YES      Percona-XtraDB, Supports transactions, row-level locking, foreign keys and encryption for tables  YES           YES     YES         
SEQUENCE            YES      Generated tables filled with sequential values                                                    YES           NO      YES         
PERFORMANCE_SCHEMA  YES      Performance Schema  





drwx------. 2 mysql mysql       19 Feb 26  2017 performance_schema
drwx------. 2 mysql mysql        6 Feb 26  2017 test
-rw-rw----. 1 mysql mysql    16384 Oct  3 16:10 tokudb.directory
-rw-rw----. 1 mysql mysql    16384 Oct  3 16:10 tokudb.environment
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_data
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_environment
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_logs
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_recovery
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_temp
-rw-rw----. 1 mysql mysql    16384 Oct  3 16:10 tokudb.rollback






mysql - myisam
-----------------------------------
top - 19:48:10 up  4:52,  3 users,  load average: 0.64, 0.37, 0.24
Tasks: 121 total,   3 running, 118 sleeping,   0 stopped,   0 zombie
%Cpu(s): 30.0 us, 10.2 sy,  0.0 ni, 58.0 id,  0.0 wa,  0.0 hi,  1.7 si,  0.0 st
KiB Mem :  1883672 total,    77540 free,  1174732 used,   631400 buff/cache
KiB Swap:   524284 total,   524280 free,        4 used.   487204 avail Mem

3500-----------------------------------
top - 19:48:46 up  4:52,  3 users,  load average: 0.90, 0.47, 0.28
Tasks: 121 total,   5 running, 116 sleeping,   0 stopped,   0 zombie
%Cpu(s): 14.8 us,  4.7 sy,  0.0 ni, 79.7 id,  0.0 wa,  0.0 hi,  0.8 si,  0.0 st
KiB Mem :  1883672 total,    72356 free,  1174716 used,   636600 buff/cache
KiB Swap:   524284 total,   524280 free,        4 used.   487040 avail Mem

6000-----------------------------------
top - 19:49:41 up  4:53,  3 users,  load average: 1.09, 0.59, 0.33
Tasks: 121 total,   1 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 23.6 us,  7.5 sy,  0.0 ni, 66.8 id,  0.2 wa,  0.0 hi,  1.9 si,  0.0 st
KiB Mem :  1883672 total,    64064 free,  1174792 used,   644816 buff/cache
KiB Swap:   524284 total,   524280 free,        4 used.   486904 avail Mem

 9817 mysql     20   0 1005328 144928  13124 S  23.2  7.7   1:17.67
 
7600-----------------------------------
  top - 19:50:14 up  4:54,  3 users,  load average: 1.46, 0.72, 0.39
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 21.2 us,  6.8 sy,  0.0 ni, 70.2 id,  0.2 wa,  0.0 hi,  1.7 si,  0.0 st
KiB Mem :  1883672 total,    80072 free,  1174892 used,   628708 buff/cache
KiB Swap:   524284 total,   524264 free,       20 used.   486784 avail Mem

  9817 mysql     20   0 1005328 144928  13124 S  20.9  7.7   1:29.63 /usr/sbin/mysqld
  
  

8900-----------------------------------  
  top - 19:50:53 up  4:54,  3 users,  load average: 1.11, 0.73, 0.40
Tasks: 122 total,   1 running, 121 sleeping,   0 stopped,   0 zombie
%Cpu(s): 15.2 us,  4.7 sy,  0.0 ni, 79.4 id,  0.0 wa,  0.0 hi,  0.7 si,  0.0 st
KiB Mem :  1883672 total,    74220 free,  1175336 used,   634116 buff/cache
KiB Swap:   524284 total,   524264 free,       20 used.   486348 avail Mem

 9817 mysql     20   0 1005328 149284  13124 S   0.0  7.9   1:43.88 /usr/sbin/mysqld
 
 
 
         <time:elapsed> 215.377366066  -- insert--
         <time:elapsed> 227.345211029  -- select --
		 
		 
		 
	INNODB #######################################################33	 
		 
1000-----------------------------------  		 
top - 19:55:30 up  4:59,  3 users,  load average: 0.25, 0.35, 0.32
Tasks: 120 total,   3 running, 117 sleeping,   0 stopped,   0 zombie
%Cpu(s): 35.7 us, 14.1 sy,  0.0 ni, 42.6 id,  1.1 wa,  0.0 hi,  6.5 si,  0.0 st
KiB Mem :  1883672 total,    68980 free,  1181840 used,   632852 buff/cache
KiB Swap:   524284 total,   524260 free,       24 used.   479996 avail Mem
 9817 mysql     20   0 1005328 151656  13188 S  34.2  8.1   1:49.95 /usr/sbin/mysqld


2500-----------------------------------   
top - 19:56:13 up  5:00,  3 users,  load average: 0.60, 0.44, 0.36
Tasks: 120 total,   3 running, 117 sleeping,   0 stopped,   0 zombie
%Cpu(s): 11.9 us,  4.3 sy,  0.0 ni, 82.1 id,  0.7 wa,  0.0 hi,  1.0 si,  0.0 st
KiB Mem :  1883672 total,    76004 free,  1182396 used,   625272 buff/cache
KiB Swap:   524284 total,   524244 free,       40 used.   479388 avail Mem	 

 9817 mysql     20   0 1005328 152536  13208 S  21.9  8.1   1:59.30 /usr/sbin/mysqld
 
 
3400-----------------------------------   
 top - 19:56:46 up  5:00,  3 users,  load average: 0.85, 0.52, 0.39
Tasks: 121 total,   3 running, 118 sleeping,   0 stopped,   0 zombie
%Cpu(s): 18.1 us,  5.6 sy,  0.0 ni, 74.0 id,  0.7 wa,  0.0 hi,  1.7 si,  0.0 st
KiB Mem :  1883672 total,    71524 free,  1183364 used,   628784 buff/cache
KiB Swap:   524284 total,   524244 free,       40 used.   478368 avail Mem

 9817 mysql     20   0 1005328 153300  13208 S  19.3  8.1   2:09.08 /usr/sbin/mysqld
 
 
 5400----------------------------------- 
top - 19:57:22 up  5:01,  3 users,  load average: 1.02, 0.59, 0.41
Tasks: 121 total,   3 running, 118 sleeping,   0 stopped,   0 zombie
%Cpu(s): 20.5 us,  7.2 sy,  0.0 ni, 70.1 id,  0.7 wa,  0.0 hi,  1.6 si,  0.0 st
KiB Mem :  1883672 total,    68256 free,  1183756 used,   631660 buff/cache
KiB Swap:   524284 total,   524244 free,       40 used.   477916 avail Mem
 9817 mysql     20   0 1005328 153828  13208 S   9.3  8.2   2:16.55 /usr/sbin/mysqld
 
 
 6700----------------------------------- 
 top - 19:58:01 up  5:01,  3 users,  load average: 0.97, 0.63, 0.43
Tasks: 121 total,   4 running, 117 sleeping,   0 stopped,   0 zombie
%Cpu(s): 18.8 us,  6.0 sy,  0.0 ni, 73.3 id,  0.7 wa,  0.0 hi,  1.2 si,  0.0 st
KiB Mem :  1883672 total,    76452 free,  1185484 used,   621736 buff/cache
KiB Swap:   524284 total,   523864 free,      420 used.   476672 avail Mem

 7400----------------------------------- 
top - 19:58:13 up  5:02,  3 users,  load average: 1.04, 0.66, 0.44
Tasks: 121 total,   1 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 30.9 us,  9.2 sy,  0.0 ni, 56.4 id,  1.2 wa,  0.0 hi,  2.3 si,  0.0 st
KiB Mem :  1883672 total,    75740 free,  1185272 used,   622660 buff/cache
KiB Swap:   524284 total,   523864 free,      420 used.   476900 avail Mem
 
 9817 mysql     20   0 1005328 154848  13208 S  28.5  8.2   2:30.03 /usr/sbin/mysqld
 
 
  8900----------------------------------- 
 top - 19:58:47 up  5:02,  3 users,  load average: 0.87, 0.66, 0.45
Tasks: 121 total,   4 running, 117 sleeping,   0 stopped,   0 zombie
%Cpu(s): 12.0 us,  4.4 sy,  0.0 ni, 82.1 id,  0.7 wa,  0.0 hi,  0.9 si,  0.0 st
KiB Mem :  1883672 total,    71860 free,  1185752 used,   626060 buff/cache
KiB Swap:   524284 total,   523864 free,      420 used.   476380 avail Mem



top - 19:59:14 up  5:03,  3 users,  load average: 1.02, 0.71, 0.47
Tasks: 121 total,   2 running, 119 sleeping,   0 stopped,   0 zombie
%Cpu(s): 54.6 us,  4.5 sy,  0.0 ni, 39.0 id,  0.5 wa,  0.0 hi,  1.4 si,  0.0 st
KiB Mem :  1883672 total,    64608 free,  1191072 used,   627992 buff/cache
KiB Swap:   524284 total,   523864 free,      420 used.   471024 avail Mem

 
 
 top - 19:59:23 up  5:03,  3 users,  load average: 1.02, 0.72, 0.48
Tasks: 121 total,   1 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 54.0 us,  0.7 sy,  0.0 ni, 45.1 id,  0.0 wa,  0.0 hi,  0.2 si,  0.0 st
KiB Mem :  1883672 total,    74828 free,  1194552 used,   614292 buff/cache
KiB Swap:   524284 total,   523416 free,      868 used.   468116 avail Mem

 9817 mysql     20   0 1005328 160040  13212 S   0.0  8.5   2:45.76 /usr/sbin/mysqld
 
        <time:elapsed> 231.406382084  -- insert_data -- insert_innodb 
        <time:elapsed> 240.920440912  -- select_data -- insert_innodb
        <time:elapsed> 242.684635878  -- select_count -- insert_innodb
		
		
		
	TOKUDB #################################
		
	 1000----------------------------------- 	
		
top - 20:00:44 up  5:04,  3 users,  load average: 0.52, 0.61, 0.46
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 31.8 us, 14.5 sy,  0.0 ni, 46.1 id,  0.9 wa,  0.0 hi,  6.7 si,  0.0 st
KiB Mem :  1883672 total,    73016 free,  1192348 used,   618308 buff/cache
KiB Swap:   524284 total,   523416 free,      868 used.   470288 avail Mem
 9817 mysql     20   0 1005328 162172  13256 S  44.5  8.6   2:55.71 /usr/sbin/mysqld
 
   1400----------------------------------- 
 
 top - 20:01:05 up  5:04,  3 users,  load average: 0.66, 0.64, 0.48
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 23.3 us,  6.1 sy,  0.0 ni, 68.2 id,  0.9 wa,  0.0 hi,  1.6 si,  0.0 st
KiB Mem :  1883672 total,    66280 free,  1193348 used,   624044 buff/cache
KiB Swap:   524284 total,   523416 free,      868 used.   469196 avail Mem


 
   2800----------------------------------- 
top - 20:01:31 up  5:05,  3 users,  load average: 0.64, 0.64, 0.48
Tasks: 121 total,   4 running, 117 sleeping,   0 stopped,   0 zombie
%Cpu(s): 32.6 us,  8.4 sy,  0.0 ni, 56.2 id,  0.9 wa,  0.0 hi,  1.9 si,  0.0 st
KiB Mem :  1883672 total,    74680 free,  1193204 used,   615788 buff/cache
KiB Swap:   524284 total,   523024 free,     1260 used.   469932 avail Mem


top - 20:01:49 up  5:05,  3 users,  load average: 0.78, 0.67, 0.50
Tasks: 121 total,   3 running, 118 sleeping,   0 stopped,   0 zombie
%Cpu(s): 30.3 us,  8.2 sy,  0.0 ni, 58.6 id,  1.0 wa,  0.0 hi,  1.9 si,  0.0 st
KiB Mem :  1883672 total,    66768 free,  1196688 used,   620216 buff/cache
KiB Swap:   524284 total,   523024 free,     1260 used.   466356 avail Mem



  6000----------------------------------- 
top - 20:02:40 up  5:06,  3 users,  load average: 0.79, 0.69, 0.51
Tasks: 123 total,   3 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 27.1 us,  6.8 sy,  0.0 ni, 64.0 id,  0.8 wa,  0.0 hi,  1.3 si,  0.0 st
KiB Mem :  1883672 total,    66320 free,  1199340 used,   618012 buff/cache
KiB Swap:   524284 total,   522692 free,     1592 used.   464148 avail Mem




  6900-----------------------------------
top - 20:03:01 up  5:06,  3 users,  load average: 0.92, 0.73, 0.53
Tasks: 122 total,   1 running, 121 sleeping,   0 stopped,   0 zombie
%Cpu(s): 28.6 us,  8.3 sy,  0.0 ni, 60.6 id,  1.0 wa,  0.0 hi,  1.5 si,  0.0 st
KiB Mem :  1883672 total,    74840 free,  1200252 used,   608580 buff/cache
KiB Swap:   524284 total,   522360 free,     1924 used.   463696 avail Mem



  7500-----------------------------------
top - 20:03:22 up  5:07,  3 users,  load average: 0.93, 0.75, 0.54
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 18.6 us,  5.2 sy,  0.0 ni, 74.0 id,  0.9 wa,  0.0 hi,  1.4 si,  0.0 st
KiB Mem :  1883672 total,    70140 free,  1200080 used,   613452 buff/cache



  7500-----------------------------------86
KiB Swap:top - 20:03:41 up  5:07,  3 users,  load average: 1.03, 0.78, 0.55
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 37.2 us,  9.4 sy,  0.0 ni, 50.2 id,  1.0 wa,  0.0 hi,  2.1 si,  0.0 st
KiB Mem :  1883672 total,    76080 free,  1204608 used,   602984 buff/cache
KiB Swap:   524284 total,   522008 free,     2276 used.   459712 avail Mem   524284 total,   522360 free,     1924 used.   463680 avail Mem


  7500-----------------------------------95
top - 20:03:59 up  5:07,  3 users,  load average: 1.17, 0.82, 0.57
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 32.2 us,  8.7 sy,  0.0 ni, 55.3 id,  1.0 wa,  0.0 hi,  2.8 si,  0.0 st
KiB Mem :  1883672 total,    73360 free,  1202848 used,   607464 buff/cache
KiB Swap:   524284 total,   522008 free,     2276 used.   461376 avail Mem



top - 20:04:20 up  5:08,  3 users,  load average: 
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 50.2 us,  1.3 sy,  0.0 ni, 48.3 id,  0.0 wa,  0.0 hi,  0.2 si,  0.0 st
KiB Mem :  1883672 total,    76924 free,  1208656 used,   598092 buff/cache
KiB Swap:   524284 total,   521656 free,     2628 used.   456020 avail Mem


top - 20:04:26 up  5:08,  3 users,  load average: 1.40, 0.91, 0.61
Tasks: 122 total,   2 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s): 49.4 us,  1.0 sy,  0.0 ni, 49.4 id,  0.0 wa,  0.0 hi,  0.2 si,  0.0 st
KiB Mem :  1883672 total,    77428 free,  1208340 used,   597904 buff/cache
KiB Swap:   524284 total,   521656 free,     2628 used.   456404 avail Mem

        <time:elapsed> 221.41050005  -- insert_data -- insert_tokudb
        <time:elapsed> 231.928579092  -- select_data -- insert_tokudb
        <time:elapsed> 232.828705072  -- select_count -- insert_tokudb




-rw-rw----. 1 mysql mysql 50M Oct  3 19:59 ibdata1
-rw-rw----. 1 mysql mysql 16M Oct  3 19:59 ib_logfile0
-rw-rw----. 1 mysql mysql 16M Oct  3 16:04 ib_logfile1
-rw-rw----. 1 mysql mysql 16M Oct  3 16:04 ib_logfile2
		
-rw-rw----. 1 mysql mysql  32K Oct  3 20:04 tokudb.rollback
-rw-rw----. 1 mysql mysql  64K Oct  3 20:04 _toku_test_insert_tokudb_status_12_1_1d.tokudb
-rw-rw----. 1 mysql mysql 1.0M Oct  3 20:04 _toku_test_insert_tokudb_main_12_2_1d.tokudb
-rw-------. 1 mysql mysql  35M Oct  3 20:05 log000000000004.tokulog29		
		
		
		
		-rw-rw----. 1 mysql mysql   65 Oct  3 16:58 db.opt
-rw-rw----. 1 mysql mysql 1.1K Oct  3 17:08 insert_innodb.frm
-rw-rw----. 1 mysql mysql  12M Oct  3 19:59 insert_innodb.ibd
-rw-rw----. 1 mysql mysql 1.1K Oct  3 19:47 insert_myisam.frm
-rw-rw----. 1 mysql mysql 2.6M Oct  3 19:51 insert_myisam.MYD
-rw-rw----. 1 mysql mysql 1.6M Oct  3 19:51 insert_myisam.MYI
-rw-rw----. 1 mysql mysql 1.1K Oct  3 17:08 insert_tokudb.frm




SELECT COUNT(*) FROM insert_innodb;    0.077  0.079
SELECT COUNT(*) FROM insert_tokudb;    0.084
SELECT COUNT(*) FROM insert_myisam;    0.004


110000 row(s) affected
UPDATE insert_innodb SET regdate = NOW();  1.323 sec   1.372
UPDATE insert_tokudb SET regdate = NOW();  4.752 sec   5.374
UPDATE insert_myisam SET regdate = NOW();  1.250 sec   1.339 sec

-rw-rw----. 1 mysql mysql   65 Oct  3 16:58 db.opt
-rw-rw----. 1 mysql mysql 1.1K Oct  3 17:08 insert_innodb.frm
-rw-rw----. 1 mysql mysql  12M Oct  3 20:13 insert_innodb.ibd
-rw-rw----. 1 mysql mysql 1.1K Oct  3 19:47 insert_myisam.frm
-rw-rw----. 1 mysql mysql 2.6M Oct  3 20:13 insert_myisam.MYD
-rw-rw----. 1 mysql mysql 1.6M Oct  3 20:13 insert_myisam.MYI
-rw-rw----. 1 mysql mysql 1.1K Oct  3 17:08 insert_tokudb.frm


-rw-rw----. 1 mysql mysql    32768 Oct  3 17:09 tokudb.directory
-rw-rw----. 1 mysql mysql    16384 Oct  3 16:10 tokudb.environment
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_data
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_environment
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_logs
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_recovery
-rw-------. 1 mysql mysql        0 Oct  3 16:10 __tokudb_lock_dont_delete_me_temp
-rw-rw----. 1 mysql mysql    32768 Oct  3 20:13 tokudb.rollback
drwx------. 2 mysql mysql     4096 Oct  3 19:47 toku_test
-rw-rw----. 1 mysql mysql  2097152 Oct  3 20:13 _toku_test_insert_tokudb_main_12_2_1d.tokudb
-rw-rw----. 1 mysql mysql    65536 Oct  3 20:04 _toku_test_insert_tokudb_status_12_1_1d.tokudb
-rw-rw----. 1 mysql mysql 2.0M Oct  3 20:13 _toku_test_insert_tokudb_main_12_2_1d.tokudb
-rw-rw----. 1 mysql mysql  64K Oct  3 20:04 _toku_test_insert_tokudb_status_12_1_1d.tokudb
-rw-------. 1 mysql mysql  51M Oct  3 20:15 log000000000004.tokulog29


<time:elapsed> 9.26335120201  -- select_data -- insert_myisam
<time:elapsed> 10.3304481506  -- select_count -- insert_myisam

<time:elapsed> 10.8779759407  -- select_data -- insert_tokudb
<time:elapsed> 12.0644578934  -- select_count -- insert_tokudb


<time:elapsed> 9.55533695221  -- select_data -- insert_innodb
<time:elapsed> 10.5069580078  -- select_count -- insert_innodb