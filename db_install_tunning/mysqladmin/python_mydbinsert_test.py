# -*- coding: utf8 -*-

import pymysql
import time

##############################################
def print_time(start, message):
     end = time.time()
     elapsed = end - start
     print "    <time:elapsed>", elapsed, message

def insert_data(conn, v_table, v_data):
    try:
        with conn.cursor() as cursor:
            sql = "insert into %s ( name ) values( %%s )" % ( v_table )
            print "<sql:insert>:", sql
            for data in v_data:
                print "<exec>:", sql, ( data["name"] + str(data["id"]) )
                cursor.execute(  sql, ( data["name"] + str(data["id"]) ) )
    finally:
        conn.commit()


def select_data(conn, v_table, v_data):
    try:
        with conn.cursor() as cursor:
            sql = "SELECT seq, name, regdate FROM  %s WHERE name = %%s ORDER BY seq DESC" % (v_table)
            print "<sql:select>:", sql
            for data in v_data:
                print "<exec>:", sql, ( data["name"] + str(data["id"]) )
                cursor.execute(  sql, ( data["name"] + str(data["id"]) ) )
                result = cursor.fetchone()
                print(result)
    finally:
        conn.commit()

def select_count(conn, v_table, v_data):
    try:
        with conn.cursor() as cursor:
            sql = "SELECT seq, name, count(*) FROM  %s WHERE name = %%s GROUP BY name " % (v_table)
            print "<sql:select>:", sql
            for data in v_data:
                print "<exec>:", sql, ( data["name"] + str(data["id"]) )
                cursor.execute(  sql, ( data["name"] + str(data["id"]) ) )
                result = cursor.fetchone()
                print(result)
    finally:
        conn.commit()

def  loop_func(toFunc, cnt=1, params=["","",""]):
    print "<exec:loopFunc>",cnt
    for i in range(cnt):
        toVar = toFunc(params[0], params[1], params[2])
        print "\t<loop:toFunc>", i, toVar, params

##############################################

if __name__ == "__main__":
    ## main  ---------------------
    user_data = [
        { "id": 0, "name": "Hero" },
        { "id": 1, "name": "Dunn" },
        { "id": 2, "name": "Sue" },
        { "id": 3, "name": "Chi" },
        { "id": 4, "name": "Thor" },
        { "id": 5, "name": "Clive" },
        { "id": 6, "name": "Hicks" },
        { "id": 7, "name": "Devin" },
        { "id": 8, "name": "Kate" },
        { "id": 9, "name": "Klein" },
        { "id": 10, "name": "Jen" }
    ]
    # -----------------------------------
    #
    start = time.time()
    conn = pymysql.connect(host='localhost', user='esdev', password='esdev',
                           db='toku_test', charset='utf8')
    #
    tab_name="insert_myisam"
    # tab_name="insert_innodb"
    # tab_name="insert_tokudb"

    #insert_data(conn, tab_name, user_data)
    loop_func(insert_data, 10000, [conn, tab_name, user_data] )
    print_time(start, " -- insert_data -- %s" % (tab_name) )
    #
    select_data(conn, tab_name , user_data)
    print_time(start, " -- select_data -- %s" % (tab_name) )
    select_count(conn, tab_name, user_data)
    print_time(start, " -- select_count -- %s" % (tab_name) )
    #
    conn.commit()
    conn.close()