# coding=utf-8
import json
import re
import pandas
import configparser
import decimal
import copy
import binascii
import opg
import cx_Oracle
import pyproj
import type_op
import ergodic
import numpy
import datetime
from datetime import datetime,timezone,timedelta,date,time
from dateutil.tz import tzoffset
from shapely import wkb
from shapely.wkt import dumps
import struct
import subprocess
import multiprocessing
from threading import Thread
config = configparser.RawConfigParser()
config2 = configparser.RawConfigParser()
config.read(r'resource/compare.ini', encoding='utf-8')
config2.read(r'resource/config.ini', encoding='utf-8')
compare_file=r'resource/mapping.xlsx'
#pandas.set_option('display.encoding', 'gbk')
class ergodic_database():
    def __init__(self):
        self.src_db=''
        self.tgt_db=''
        self.conf_src=''
        self.conf_tgt=''
        self.src_tab_list = []
        self.tgt_tab_list = []
        self.src = {'tab_num': 0,'tab_name': []}
        self.tgt = {'tab_num': 0,'tab_name': []}
        self.src_col = {'tab_num': 0,'tab_name': '','tab_col':[]}
        self.tgt_col = {'tab_num': 0,'tab_name': '','tab_col':[]}
        self.bfe=[]
        #列属性
        self.col_tup=('col_num','col_name','type','len','num_pre','num_scale','time_sh','null','tab_name')
        self.src_col_list=[]
        self.tgt_col_list =[]
        self.src_final=[]
        self.tgt_final=[]
        self.col_result=[]
        #表内容行
        self.srctable_list=[]
        self.tgttable_list = []
        self.column=[]
        self.templine=''
        self.templist=[]
        self.tempdict={}
        self.cons_err=[]
        self.type_cache={}
        #mapping
        self.mysql=('mysql','tdsql')#mysql源
        self.pg=('postgre','lightdb','dws','tdsql_pg','opengauss','opengauss_gbk')
        self.oracle=('oracle')
        self.sqlserver=('sqlserver')
        self.db2=('db2')
        self.clickhouse=('clickhouse')
        #self.gauss=None
        self.data=None
        self.conn_src=None
        self.conn_tgt=None
        self.conn_tgt_cur=None
        self.conn_src_cur=None
        self.bfe_last=[]
        self.report_addr=r'resource/test_report/report.xlsx'
        #multi
        #self.pool=multiprocessing.Pool()
    def src_tab(self):#mssql
        i=j=k=0
        mss1 = opg.MysqlConn('mssql')
        mss_conn = mss1.open_mssql()  # open_mssql()传回mssql conn，赋给mssql变量
        mss=mss_conn.cursor()        #另取游标方便conn.commit与conn.cursor.execute游标操作分离
        if self.src_db in self.sqlserver:
            self.conn_src = mss_conn
        else:self.conn_tgt = mss_conn
        #self.conn_src=mss_conn
        mss.execute(config.get('sqlserver','table_name'))
        for self.templine in mss.fetchall():
            if self.templine[0].startswith('i2_logkeeper') or self.templine[0].startswith('systransch'):
                continue
            else:
                self.src['tab_name'].append(self.templine[0])
        self.src['tab_num']=self.src['tab_name'].__len__()
        for self.templine in self.src['tab_name']:
            mss.execute(r"%s'%s'"%(config.get('sqlserver','col'),self.templine))
            for item in mss.fetchall():
                self.src_col_list.append({self.col_tup[x]:item[x] for x in range(len(item))})
            i+=1
            self.src_col['tab_num']=i
            self.src_col['tab_name']=self.templine
            self.src_col['tab_col']=self.src_col_list
            self.src_col_list=[]
            self.src_final.append(self.src_col)
            self.src_col = {'tab_num': 0, 'tab_name': '', 'tab_col': []}

        #print(self.src_final)
        self.src['tab_num']=self.src['tab_name'].__len__()
        return  self.src['tab_num'],self.src_final
    def ora_tab(self):
        i=j=k=0
        ora1=opg.MysqlConn('oracle')
        ora_conn=ora1.open_oracle()
        ora=ora_conn.cursor()
        if self.src_db in self.oracle:
            self.conn_src = ora_conn
        else:self.conn_tgt = ora_conn
        #self.conn_tgt=ora_conn
        ora.execute(config.get('oracle','table_name'))
        for self.templine in ora.fetchall():
            if self.templine[0].startswith('i2_logkeeper'):
                continue
            else:
                self.tgt['tab_name'].append(self.templine[0])
        self.tgt['tab_num']=self.tgt['tab_name'].__len__()
        for self.templine in self.tgt['tab_name']:
            ora.execute(r"%s'%s' order by COLUMN_ID"%(config.get('oracle','col'),self.templine))
            p=ora.fetchall()
            for item in p:
                self.tgt_col_list.append({self.col_tup[x]:item[x] for x in range(len(item))})
            i+=1
            self.tgt_col['tab_num']=i
            self.tgt_col['tab_name']=self.templine
            self.tgt_col['tab_col']=self.tgt_col_list
            self.tgt_col_list=[]
            self.tgt_final.append(self.tgt_col)
            self.tgt_col = {'tab_num': 0, 'tab_name': '', 'tab_col': []}
        #print(self.tgt_final)
        self.tgt['tab_num']=self.tgt['tab_name'].__len__()
        return  self.tgt['tab_num'],self.tgt_final
    def mysql_tab(self):
        i=j=k=0
        if self.tgt_db=='mysql':
            ora1 = opg.MysqlConn('mysql')
        elif self.tgt_db=='tdsql':
            ora1=opg.MysqlConn('tdsql')
        elif self.tgt_db=='clickhouse':
            ora1 = opg.MysqlConn('clickhouse')
        else:
            ora1 = opg.MysqlConn('mysql')
        ora_conn=ora1.open()
        ora=ora_conn.cursor()
        if self.src_db in self.mysql:
            self.conn_src = ora_conn
        else:self.conn_tgt = ora_conn
        #self.conn_tgt = ora_conn
        ora.execute(config.get('mysql','table_name'))
        for self.templine in ora.fetchall():
            if self.templine[0].startswith('i2_logkeeper'):
                continue
            else:
                self.tgt['tab_name'].append(self.templine[0])
        self.tgt['tab_num']=self.tgt['tab_name'].__len__()
        final = self.tgt_final
        for self.templine in self.tgt['tab_name']:
            ora.execute(r"%s'%s' order by ORDINAL_POSITION"%(config.get('mysql','col'),self.templine))
            p=ora.fetchall()
            for item in p:
                self.tgt_col_list.append({self.col_tup[x]:item[x] for x in range(len(item))})
            i+=1
            self.tgt_col['tab_num']=i
            self.tgt_col['tab_name']=self.templine
            self.tgt_col['tab_col']=self.tgt_col_list
            self.tgt_col_list=[]
            final.append(self.tgt_col)
            self.tgt_col = {'tab_num': 0, 'tab_name': '', 'tab_col': []}
        #print(self.tgt_final)
        self.tgt['tab_num']=self.tgt['tab_name'].__len__()
        return  self.tgt['tab_num'], final
    def ck_tab(self):#clickhouse 表引擎
        i = j = k = 0
        #tgt = {'tab_num': 0,'tab_name': []}
        if self.tgt_db == 'clickhouse':
            ora1 = opg.MysqlConn('clickhouse')
        ora_conn = ora1.open_clickhouse()
        ora = ora_conn.cursor()
        ck_db=config2.get('clickhouse','databasename')
        if self.src_db in self.mysql:
            self.conn_src = ora_conn
        else:
            self.conn_tgt = ora_conn
            # self.conn_tgt = ora_conn
        ora.execute(config.get('clickhouse', 'table_name'))##
        tgt = copy.deepcopy(self.tgt)
        for self.templine in ora.fetchall():
            if self.templine[0].startswith('i2_logkeeper'):
                continue
            else:
                tgt['tab_name'].append(self.templine[0])
        tgt['tab_num'] = tgt['tab_name'].__len__()
        final = copy.deepcopy(self.tgt_final)
        for self.templine in tgt['tab_name']:
                ora.execute(config.get('clickhouse', 'col').format(dbname=ck_db,tbname=re.sub("'","''",self.templine)))
                p = ora.fetchall()
                for item_tuple in p:
                    item=list(item_tuple)
                    if 'Nullable' in item[2]:
                        item[2]=re.findall(r'\((.*?)\)',item[2])[0]
                        item[-1]='yes'
                    else: item[-1]='no'
                    self.tgt_col_list.append({self.col_tup[x]: item[x] for x in range(len(item))})
                i += 1
                self.tgt_col['tab_num'] = i
                self.tgt_col['tab_name'] = self.templine
                self.tgt_col['tab_col'] = self.tgt_col_list
                self.tgt_col_list = []
                final.append(self.tgt_col)
                self.tgt_col = {'tab_num': 0, 'tab_name': '', 'tab_col': []}
            # print(self.tgt_final)
        tgt['tab_num'] = tgt['tab_name'].__len__()

        return tgt['tab_num'], final
    def pg_tab(self):
        i=j=k=0
        if self.conf_src in self.pg:
            ora1=opg.MysqlConn(f'{self.conf_src}')
        else:
            ora1 = opg.MysqlConn('postgre')# 默认为pg数据库
        ora_conn=ora1.open_pg()
        ora=ora_conn.cursor()
        schema=config2.get('postgre','schema')#赋值schema
        if self.conf_src in self.pg:
            self.conn_src = ora_conn
        else:self.conn_tgt = ora_conn
        #self.conn_tgt = ora_conn
        ora.execute(f"select TABLE_NAME from INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '{schema}'")
        a = copy.deepcopy(self.tgt)
        p=ora.fetchall()
        for self.templine in p:
            if self.templine[0].startswith('i2_logkeeper'):
                continue
            else:
                a['tab_name'].append(self.templine[0])
        a['tab_num']= a['tab_name'].__len__()
        final =copy.deepcopy(self.tgt_final)
        for self.templine in a['tab_name']:
            ora.execute(rf'''{config.get('postgre','col').format(schema=schema)}'{re.sub("'","''",self.templine)}' order by ORDINAL_POSITION''')
            #ora.execute(rf"""select ORDINAL_POSITION,COLUMN_NAME,data_type,CHARACTER_OCTET_LENGTH,NUMERIC_PRECISION,NUMERIC_SCALE,DATETIME_PRECISION,IS_NULLABLE from INFORMATION_SCHEMA.COLUMNS where Table_schema='{schema}' and TABLE_NAME="{self.templine}" order by ORDINAL_POSITION""")
            p=ora.fetchall()
            for item in p:
                self.tgt_col_list.append({self.col_tup[x]:item[x] for x in range(len(item))})
            i+=1
            self.tgt_col['tab_num']=i
            self.tgt_col['tab_name']=self.templine
            self.tgt_col['tab_col']=self.tgt_col_list
            self.tgt_col_list=[]
            final.append(self.tgt_col)
            self.tgt_col = {'tab_num': 0, 'tab_name': '', 'tab_col': []}
        #print(self.tgt_final)
        a['tab_num']= a['tab_name'].__len__()
        return  a['tab_num'],final

    def map_analysis(self,file):
        if self.src_db in self.sqlserver:
            sheet='mapping_mss';complex='mss_complex_mapping'
        elif self.src_db in self.pg:
            sheet='mapping_pg';complex='pg_complex_mapping'
        else :sheet='mapping_mss';complex='mss_complex_mapping'
        self.data = pandas.read_excel(file, sheet_name=sheet, keep_default_na=False)  # dataframe类型
        self.complex_map = pandas.read_excel(file, sheet_name=complex, keep_default_na=False)
        k=0
        if self.tgt_db in self.pg:x='postgre'
        elif self.tgt_db in self.mysql:x='mysql'
        elif self.tgt_db in self.oracle:x='oracle'
        elif self.tgt_db in self.clickhouse:x='clickhouse'
        elif self.tgt_db in self.sqlserver:x='sqlserver'
        else:
            x='sqlserver'
            print('未在mapping映射表中找到备库类型，使用ssms映射表补位')
        for i in self.data.columns.values:
            if i==x:
                self.tgt_index=k
            if i==self.src_db:
                self.src_index=k
            k += 1
    def map_compare_simple(self,srcd,tgtd,tgt_col_temp):
        no_info='\033[0;31m NO! \033[0m \t %s列源备映射错误，源端为%s %s位\t期望更改为%s\t实际备端为%s %s位' % (srcd['col_name'], srcd['type'], srcd['len'],tgt_col_temp, tgtd['type'],tgtd['len'])
        yes_info='\033[0;32m YES! \033[0m \t %s列源备映射正确，源端为%s %s位\t期望更改为%s\t实际备端为%s %s位' % (srcd['col_name'], srcd['type'], srcd['len'],tgt_col_temp, tgtd['type'],tgtd['len'])
        p1=re.sub(r"\(.*?\)", '', tgtd['type']).replace(' ','').upper()
        p2=re.sub(r"\(.*?\)", '', tgt_col_temp).replace(' ','').upper()
        if re.sub(r"\(.*?\)", '', tgtd['type']).replace(' ','').upper() == re.sub(r"\(.*?\)", '', tgt_col_temp).replace(' ','').upper():
                #print('%s列源备映射正确，源：%s 备%s' % (srcd['col_name'], srcd['type'], tgtd['type']))
                if re.search(r"\((.*?)\)", tgt_col_temp):
                    a = re.search(r"\((.*?)\)", tgt_col_temp).group(1)
                    b = a.split(',')
                    if len(b) == 1:
                        if a.isalpha():  # 备端映射表是n，比对源备字段
                            if tgtd['num_pre'] :
                                if srcd['num_pre'] ==  tgtd['num_pre']:
                                    print(yes_info);self.bfe.append(yes_info)
                                else:
                                    print(no_info);self.bfe.append(no_info)
                            elif tgtd['time_sh'] :
                                if srcd['time_sh'] == tgtd['time_sh']:
                                    print(yes_info);self.bfe.append(yes_info)
                                else:
                                    print(no_info);self.bfe.append(no_info)
                            else:
                                if srcd['len'] and tgtd['len'] and (0.5 or 1 or 2 or 4 *srcd['len'] == tgtd['len']):
                                    print(yes_info); self.bfe.append(yes_info)
                                elif srcd['len']==-1 and tgtd['len']==2000 or 4000 or 8000:
                                    print(yes_info); self.bfe.append(yes_info)
                                elif srcd['type']=='bit' and tgtd['type']=='tinyint' and tgtd['num_pre']==3:
                                    print(yes_info,'源端为bit，特殊情况具体分析，转换正确'); self.bfe.append(yes_info+'源端为bit，特殊情况具体分析，转换正确')
                                else:
                                    print('no,len不存在')
                                    self.bfe.append('no,len不存在')# 可能是char列，源备存储格式长度不同，待改进
                        elif a.isdigit():
                            if tgtd['num_pre']:
                                if int(a) * 1 or 3== tgtd['num_pre']:
                                    print(yes_info) ; self.bfe.append(yes_info)
                                else:
                                    print(no_info) ; self.bfe.append(no_info)
                            elif tgtd['time_sh']:
                                if int(a) == tgtd['time_sh']:
                                    print(yes_info) ; self.bfe.append(yes_info)
                                else:
                                    print(no_info) ; self.bfe.append(no_info)
                            else:
                                if int(a) == 1 or 2 or 4 * tgtd['len']:
                                    print(yes_info,'\t位数精度不存在，通过长度比较') ; self.bfe.append(yes_info+'\t位数精度不存在，通过长度比较')
                                else:
                                    print(no_info,'\t位数精度不存在，未通过长度比较') ;self.bfe.append(no_info+'\t位数精度不存在，未通过长度比较')
                    elif len(b) > 1:  # 少数情况，多次比较精度、长度
                        item, item_scale = b
                        if item.isalpha():
                            if tgtd['num_pre']:
                                if srcd['num_pre'] == tgtd['num_pre']:
                                    if tgtd['num_scale']:
                                        if srcd['num_scale'] == tgtd['num_scale']: print(yes_info) ; self.bfe.append(yes_info)
                            else:
                                print('源备长度不一致,错误') and self.bfe.append('源备长度不一致,错误')
                        elif item.isdigit():
                            if tgtd['num_pre']:
                                if int(item) == tgtd['num_pre']:
                                    if tgtd['num_scale']:
                                        if int(item_scale) == tgtd['num_scale']: print(yes_info) ; self.bfe.append(yes_info)
                            else:
                                print('列属性数值不符合映射表') and self.bfe.append('列属性数值不符合映射表')
                else:print(yes_info) ; self.bfe.append(yes_info)

        elif  re.search(r"\(.*?\)", tgt_col_temp) is None:
            if tgt_col_temp.upper() == tgtd['type']:
                #print('yes，源端为%s，\t期望更改为%s\t实际备端为%s' % (srcd['type'], tgt_col_temp, tgtd['type']))
                print(yes_info) ; self.bfe.append(yes_info)
            else:
                print(no_info) ; self.bfe.append(no_info)
                #print('no，源端为%s，\t期望更改为%s\t实际备端为%s' % (srcd['type'], tgt_col_temp, tgtd['type']))
        else:
            print(no_info) ; self.bfe.append(no_info)
            #print('%s列源备映射错误，源端为%s，\t期望更改为%s\t实际备端为%s' % (srcd['col_name'], srcd['type'], tgt_col_temp, tgtd['type']))
    #sqlserver
    def src_cons_ana(self,table_name,col_num,n):#sqlserver

        columns_info = []
        if n == 'src':
            cursor = self.conn_src.cursor()
            #db_type = self.conf_src
        elif n == 'tgt':
            cursor = self.conn_tgt.cursor()
        cursor.execute(f"EXEC sp_help {table_name}")
        col_list=[]
        while True:
                f = cursor.fetchall()
                if not f:
                    break
                elif f[0] is None or len(f[0])== 1 or len(f[0])==4:
                    cursor.nextset()
                else:
                    col_list+=f
                    cursor.nextset()
        for item in col_list[0:col_num]:
                columns_info.append({
                    'col_name': item[0], 'pk': None,
                    'unique_name': None, 'unique_complex': None,
                    'check_name': None, 'check_define': None,
                    'col_default': None,
                    'index_name': None, 'index_type': None, 'index_complex': None
                })
        for item in col_list[col_num:]:
                if len(item)==3:#index
                    inno=item[2]
                    in_name=item[0]
                    in_type=re.findall(r'(.*?)\slocated\son',item[1])[0]

                    if len(inno.split(','))==1:
                        in_comp=None

                    else:in_comp=inno;inno=inno.split(',')[0]
                    for d in columns_info:
                        if d['col_name'] == inno:
                            d['index_name'] = in_name;d['index_type'] = in_type
                            d['index_complex'] = in_comp
                            break
                elif len(item)>4:
                    if 'CHECK' in item[0]:
                        ch_name=re.search(r'(?<=on\scolumn\s)(.*?)$', item[0]).group(0)
                        for d in columns_info:
                            if d['col_name']==ch_name:
                               d['check_name']=item[1];d['check_define']=item[-1];break
                    if 'DEFAULT' in item[0]:
                        df_name = re.search(r'(?<=on\scolumn\s)(.*?)$', item[0]).group(0)
                        for d in columns_info:
                            if d['col_name']==df_name:
                                d['col_default']=re.findall(r'\((.*?)\)',item[-1])[0].replace('(','').replace(')','')

                    if 'UNIQUE' in item[0]:
                        if len(item[-1].split(','))==1:
                            un_name=item[-1];un_comp=None
                        else:un_comp=item[-1];un_name=item[-1].split(',')[0]

                        un=item[1]
                        for d in columns_info:
                            if d['col_name'] == un_name:
                                d['unique_name']=un;d['unique_complex']=un_comp;break
                    if 'PRIMARY' in item[0]:
                        if len(item[-1].split(',')) == 1:
                            pk='YES';pk_name=item[-1]
                        else:
                            pk = item[-1];pk_name = item[-1].split(',')[0]
                        for d in columns_info:
                            if d['col_name'] == pk_name:
                                d['pk']=pk;break
        #print(columns_info)
        return columns_info
    #oracle/postgre/mysql
    def cons_analysis(self, table_name,col_num,n):#加类型参数

        columns_info = []
        if n == 'src':
            cursor = self.conn_src.cursor()
            db_type = self.conf_src
        elif n == 'tgt':
            cursor = self.conn_tgt.cursor()
            db_type = self.conf_tgt
        else:
            print('源备信息丢失')
        # if self.tgt_db in self.oracle:db_type='oracle'
        # elif self.tgt_db in self.mysql: db_type = 'mysql'
        # elif self.tgt_db in self.pg:db_type = 'postgre'
        # else:db_type='oracle'#缺省备库oracle

        if db_type == 'mysql':
            # 查询MySQL表的创建语句
            cursor.execute(f"SHOW CREATE TABLE {table_name.lower()}")
            create_table_result = cursor.fetchone()
            create_table_statement = create_table_result[1]
            # 解析创建语句，获取列信息
            lines = create_table_statement.split('\n')
            for line in lines[1:col_num+1]:  # 跳过表名和结束括号
                line = line.strip()
                if line.startswith('`'):  # 列名行
                    parts = line.split(' ')
                    column_name = parts[0].strip('`')
                    col_default = None
                    col_index_name = None
                    check_define = None
                    pk = None
                    unique_name = None
                    unique_complex = None
                    check_name = None
                    index_type = None
                    index_complex = None

                    # 查找默认值
                    if 'DEFAULT' in line:
                        start_index = line.find('DEFAULT') + len('DEFAULT')
                        end_index = line.find(' 'or',', start_index+1)
                        col_default = line[start_index:end_index].strip()
                    columns_info.append({
                            'col_name': column_name, 'pk': pk,
                            'unique_name': unique_name, 'unique_complex': unique_complex,
                            'check_name': check_name, 'check_define': check_define,
                            'col_default': col_default,
                            'index_name': col_index_name, 'index_type': index_type, 'index_complex': index_complex
                        })
                    # 查找索引名
            for line in lines[col_num+1:]:

                if 'PRIMARY' in line:
                    pk='PRIMARY'
                    pkn=re.findall(r"\((.*?)\)", line)[0].replace('`','')
                    if len(pkn.split(','))==1:
                        a='YES'
                    else:a=pkn;pkn=pkn.split(',')[0]
                    for d in columns_info:
                        fuk=d['col_name']
                        if d['col_name']==pkn:d['pk']=a;d['index_name']=pk;d['index_type']='UNIQUE';break
                elif 'KEY' in line :
                    cosn=re.findall(r"\(`(.*?)`\)", line)[0]
                    if len(cosn.split(','))==1:
                        na=re.sub('`','',cosn);complex=None
                    else:

                        na=re.sub('`','',cosn.split(',')[0]);complex=re.sub('`','',cosn)
                    cons_name=re.search(r"`(.*?)`", line).group(0)
                    for d in columns_info:
                        if d['col_name']==na:
                            d['index_name'] = cons_name
                            if 'UNIQUE' in line:
                                d['unique_name'] = cons_name;d['unique_complex'] = complex;d['index_type']='UNIQUE';break
                            else:pass
                elif 'CONSTRAINT' in line:
                    #cos = re.findall(r'\"\s(.*?)\s\(', line)
                    index_type='CHECK'
                    index_name=re.findall(r'(?<=CONSTRAINT\s`).*?(?=`\sCHECK)',line)[0].replace(' ','')
                    index_define_font=re.findall('\(\(\((.*?)\)\)\)',line)[0].replace(')'or'(','')
                    index_define=re.sub('`|\(|\s','',index_define_font)
                    name=re.sub('`','',re.search(r'`(.*?)`',index_define_font).group(0))
                    for d in columns_info:
                        if d['col_name']==name:
                            d['check_name']=index_name;d['check_define']=index_define;break
                else:pass

        elif db_type == 'postgre':
            # 查询PostgreSQL表的创建语句
            con_s=f'''SELECT pg_get_constraintdef(c.oid),c.conname FROM pg_constraint AS c JOIN pg_class AS t ON c.conrelid = t.oid WHERE t.relname = '{table_name.lower()}'  AND (c.contype <> 'p' or c.contype = 'p' or c.contype='d')
                     union 
                     SELECT pg_get_indexdef(indexrelid),null as conname FROM pg_index WHERE indrelid = '{table_name.lower()}'::regclass'''
            def_s=f'''select column_name,column_default from INFORMATION_SCHEMA.columns where TABLE_NAME = '{table_name.lower()}' order by ordinal_position'''
            cursor.execute(def_s)
            comment_s=f'''SELECT a.attname,col_description(a.attrelid,a.attnum) FROM pg_class as c,pg_attribute as a where a.attrelid = c.oid and a.attnum>0 and c.relname= '{table_name.lower()}' '''
            def_result = cursor.fetchall()
            cursor.execute(con_s)
            cos_result=cursor.fetchall()
            cursor.close()
            for item in def_result:
                column_name=item[0]
                if not item[1]:
                    col_default=item[1]
                elif item[1] and len(item[1].split(':'))==1:
                    col_default = item[1]
                else:col_default=item[1].split(':')[0]

                columns_info.append({
                'col_name': column_name, 'pk': None,
                'unique_name': None, 'unique_complex': None,
                'check_name': None, 'check_define': None,
                'col_default': col_default,
                'index_name': None, 'index_type': None, 'index_complex': None,'comment':None
            })
            for line in cos_result:
                a=line[0];b=line[1]
                if b is None :
                    index_type = re.findall(r'(?<=CREATE\s)(.*?)(?=\sINDEX\s)', a)
                    if index_type:
                        index_type=index_type[0]
                    else:index_type=None
                    index_name=re.findall(r'(?<=INDEX\s)(.*?)(?=ON\s)',a)[0]
                    inno=re.sub('"','',re.findall(r'(?<=btree\s\()(.*?)(?=\))',a)[0])
                    if len(inno.split(','))==1:
                        inno=inno;index_complex=None
                    else :index_complex=inno;inno=inno.split(',')[0]
                    for d in columns_info:
                        if d['col_name']==inno:
                            d['index_name']=index_name;d['index_type']=index_type;d['index_complex']=index_complex
                            break
                elif b is not None and 'UNIQUE' in a:
                    unno=re.findall(r'\((.*?)\)',a)[0]
                    if unno.split(',').__len__()==1:
                        un_complex=None
                    else:un_complex=unno;unno=unno.split(',')[0]
                    for d in columns_info:
                        if d['col_name']==unno:
                            d['unique_name']=b;d['unique_complex']=un_complex;break
                elif b is not None and 'CHECK' in a:
                    #a = re.sub('::text', '', re.findall(r'\s\(\((.*?\))\)',a)[0])
                    ch_define=re.sub('::text', '', re.findall(r'\s\(\((.*?\))\)',a)[0])
                    unno_befor=re.findall(r'(?<=\()(.*?)(?=\s>|\s<|\s=)',ch_define)[0]
                    unno=re.sub('\(|\)','',unno_befor)

                    for d in columns_info:
                        if d['col_name']==unno:
                            d['check_name']=b;d['check_define']=ch_define;break
                elif b is not None and 'PRIMARY' in a:
                    pkno=re.findall(r'\((.*?)\)',a)[0]
                    if pkno.split(',').__len__()==1:
                        pk='YES'
                    else:pk=pkno;pkno=pkno.split(',')[0]
                    for d in columns_info:
                        if d['col_name']==pkno:
                            d['pk']=pk;break

        elif db_type == 'oracle':
            ind_statement=[]
            # 查询Oracle表的创建语句
            ora_index=f"SELECT DBMS_METADATA.GET_DDL('INDEX',u.index_name) FROM USER_INDEXES u where TABLE_OWNER='DBO' and TABLE_NAME='{table_name.upper()}'"
            cursor.execute(ora_index)
            indexlins =cursor.fetchall()#clob列表
            cursor.execute(f"SELECT DBMS_METADATA.GET_DDL('TABLE', '{table_name.upper()}','DBO') FROM DUAL")
            create_table_result = cursor.fetchall()

            #print(create_table_result,type(create_table_result))
            create_table_statement = create_table_result[0][0].read().replace('\t','')
            #print(create_table_statement)
            for item in indexlins:
                ind_statement+=item[0].read().replace('\t','').split('\n')
            lines = create_table_statement.split('\n')+ind_statement
            print(lines)
            for line in lines[1:col_num+2]:
                line = line.strip()
                col_default = None;col_index_name = None;check_define = None
                pk=None;unique_name=None;unique_complex=None;check_name=None;index_type=None;index_complex=None
                if line.startswith('"') or line.startswith('("'):  # 列名行
                    parts = line.split(' ')
                    column_name = parts[0].replace('(','').replace('"','')
                    #col_default = None;col_index_name = None;check_define = None;constraint_name = None;cons_type = None
                    # 查找默认值
                    if 'DEFAULT' in line:
                        start_index = line.find('DEFAULT') + len('DEFAULT')
                        end_index = line.find((' 'or','), start_index+1)
                        col_default = line[start_index:end_index].strip()
                    columns_info.append({
                        'col_name': column_name,'pk':pk,
                        'unique_name':unique_name,'unique_complex':unique_complex,
                        'check_name':check_name,'check_define':check_define,
                        'col_default': col_default,
                        'index_name':col_index_name,'index_type': index_type, 'index_complex': index_complex
                    })
                    # 查找索引名
            for line in lines[col_num+2:]:
                unique_name=None
                #col_default = None;col_index_name = None;index_contain = None;check_define = None;constraint_name = None;cons_type = None
                if 'CREATE' in line and 'INDEX' in line and table_name.upper() in line:
                    index_type=re.findall(r'(?<=CREATE).*?(?=INDEX)',line)[0].replace(' ','')
                    index_name=re.findall(r'(?<=INDEX\s).*?(?=\sON\s)',line)[0].replace(' ','')

                    x=re.findall(r"\((.*?)\)", line)
                    if not x:continue
                    else:x=x[0]
                    if len(x.split(','))==1:
                        col_name= re.sub('"','',x);index_complex=None
                    elif len(x.split(','))>=1:
                        col_name=re.sub('"','',x.split(',')[0]);index_complex=x
                    for d in columns_info:
                        if d['col_name']==col_name:
                            d['index_type']=index_type;d['index_name']=index_name;d['index_complex']=index_complex;break

                elif 'PRIMARY' in line:
                    x = re.findall(r"\((.*?)\)", line)[0].replace('"','')
                    if len(x.split(','))==1:
                        col_name= re.sub('"','',x);pk='YES'
                    elif len(x.split(','))>=1:
                        col_name=re.sub('"','',x.split(',')[0]);pk=x
                    for d in columns_info:
                        if d['col_name']==col_name:
                            d['pk']=pk;break
                elif 'CONSTRAINT' in line:
                    x=re.findall(r'\"\s(.*?)\s\(',line)
                    if x[0].startswith('UNIQUE'):
                        unique_name=re.findall(r'(?<=CONSTRAINT\s\").*?(?=\"\sUNIQUE)',line)[0]
                        temp_n=re.sub('\"','',re.findall(r'\s\(\"(.*?)\"\)',line)[0])
                        if len(temp_n.split(','))==1:
                            col_name=temp_n;unique_complex=None
                        else:col_name=temp_n.split(',')[0];unique_complex=temp_n
                    elif x[0].startswith('CHECK'):
                        check_name=re.findall(r'(?<=CONSTRAINT\s\").*?(?=\"\sCHECK)',line)[0]
                        check_define=re.findall(r'\s\((.*?)\)\sENABLE',line)[0]
                        col_name=re.search(r'\"(.*?)\"',check_define).group(0).replace('"','')
                    for d in columns_info:
                        fu=d['col_name']
                        if d['col_name']==col_name:
                            if unique_name:d['unique_name']=unique_name;d['unique_complex']=unique_complex;break
                            else:d['check_name']=check_name;d['check_define']=check_define;break


                    # 将列信息添加到结果列表中

        elif db_type == 'sqlserver':
        #     pass
            columns_info=self.src_cons_ana(table_name,col_num,n)

        #print(columns_info)
        return columns_info
    def cons_compare(self,tgt,src):#字段为单位追加至self.bfe
        col_result=[]
        tab_cons=[]
        for s,t in zip(src,tgt):
            #print(len(src),len(tgt))
#pk 1列
            if s['pk'] and t['pk']:
                if s['pk'] == t['pk'] and s['pk']=='YES':
                    col_result.append('YES')
                elif re.sub('\(\)|\s','',s['pk']).lower() == re.sub('\(\)|\s','',t['pk']).lower() and s['pk']!='YES':
                    col_result.append('YES,复合主键%s'%s['pk'])
                else:col_result.append('NO! 主键不正常，源%s备%s'%(s['pk'],t['pk']))
            elif not s['pk'] and not t['pk']:
                col_result.append(None)
            elif s['pk'] and not t['pk'] or  not s['pk'] and t['pk']:
                col_result.append('NO! 主键不正常，源%s备%s'%(s['pk'],t['pk']))
#default 1列
            if s['col_default'] and t['col_default']:
                if s['col_default'] == t['col_default']:col_result.append('YES! %s'%t['col_default'])
                else:col_result.append('默认值不同源备%s%s'%(s['col_default'],t['col_default']))
            elif not s['col_default'] and not t['col_default']:col_result.append(None)
            elif not s['col_default'] and t['col_default']=='NULL':
                col_result.append('NULL')
            else:col_result.append('NO!源%s备%s'%(s['col_default'],t['col_default']))
#unique 2列
            if s['unique_name'] and t['unique_name'] :
                if s['unique_complex'] and t['unique_complex'] and re.sub('\(|\)|\"|`','',s['unique_complex']).lower() == re.sub('\(|\)|\"|`','',t['unique_complex']).lower() :
                    col_result.append('YES! %s'%t['unique_name']);col_result.append('YES! %s'%t['unique_complex'])
                elif not s['unique_complex'] and not t['unique_complex']:
                    col_result.append('YES! %s' % t['unique_name'])
                    col_result.append(None)
                else:
                    col_result.append('YES! %s'%t['unique_name']);col_result.append('NO! %s'%t['unique_complex'])
            elif not s['unique_name'] and not t['unique_name']:
                col_result.append(None);col_result.append(None)
            elif not s['unique_name'] and t['unique_name'] and t['index_type'] and s['index_type']:
                col_result.append(None)
                col_result.append(None)
            else:
                col_result.append('NO!源%s备%s' % (s['unique_name'], t['unique_name']));col_result.append(None)
#check 3列 check匹配情况 源端checkdefine 备端check情况
            if s['check_name'] and t['check_name']:
                if s['check_name'][0:-10].lower() == t['check_name'][0:-10].lower():
                    if re.sub('\(|\)|\[|\]|\s|\`|\"|_utf8mb4','',t['check_define']).lower() ==re.sub('\(|\)|\[|\]|\s|\`|\"|_utf8mb4','',s['check_define']).lower():
                        col_result.append('YES!');col_result.append('YES! %s'%(s['check_define']));col_result.append('YES! %s'%(s['check_define']))
                    else:col_result.append('YES!');col_result.append('YES! %s'%(s['check_define']));col_result.append('NO! check定义不同%s'%t['check_define']);
                else:col_result.append('YES!');col_result.append('YES! %s'%(s['check_define']));col_result.append('NO! check名称不对')
            elif not s['check_name'] and not t['check_name']:col_result.append(None);col_result.append(None);col_result.append(None)
            else:col_result.append('NO!源%s备%s'%(s['check_name'],t['check_name']));col_result.append('YES! %s'%(s['check_define']));col_result.append(None)
#index 2列
            if not s['index_name'] and not t['index_name']:
                col_result.append(None);col_result.append(None)
            elif s['index_name'] and t['index_name']:
                col_result.append('YES!')
                if  not s['index_type'] or not t['index_type']:col_result.append('YES! 普通索引')
                elif s['pk'] and t['index_name']:col_result.append('YES! 主键相关索引')
                elif s['index_type'] and t['index_type'] and re.search(t['index_type'],s['index_type'],flags=re.IGNORECASE):
                    col_result.append('YES! 索引类型正确，源%s备%s'%(s['index_type'],t['index_type']))
                else:col_result.append('NO! 索引类型错误，源%s备%s' % (s['index_type'], t['index_type']))
            else:
                col_result.append('NO! 源备索引不一致源%s备%s'%(s['index_name'],t['index_name']))
                col_result.append(None)

            #print(col_result)
            tab_cons.append(col_result)
            col_result=[]

        self.col_result.append(tab_cons)
        #print(self.col_result)
    def row_contain(self,src,tgt,tbname,tbcol,tgcol):#行数、内容比较
        src_cur=self.conn_src.cursor()
        tgt_cur = self.conn_tgt.cursor()
        err=[]
        f=[]
        i=0
        # 存储 convert 语句，包含一个占位符 {col_name}
        #self.type_cache[col['type']] = 'CONVERT(nvarchar(max), "{col_name}")'
        # 在后续代码中，将当前的 col["col_name"] 值传递给占位符
        #formatted_convert = f"{self.type_cache[col['type']]}".format(col_name=current_col_name)
        if self.conf_src=='sqlserver':

            sql=self.mss_spc(tbcol,tbname)
        else:sql=f'select * from {tbname}'
        src_cur.execute(sql)

        if self.conf_tgt=='sqlsrever':
            a=self.mss_spc(tgcol,tbname)
        elif self.tgt_db!='mysql' and not self.tgt_db.endswith('gbk'):
            a='%s' % config.get('sqlserver', 'row') + " " + tbname + " " + 'order by 1 asc'
        elif self.tgt_db.endswith('gbk'):
            b = "set client_encoding to 'GBK';"
            tgt_cur.execute(b)
            a = '%s' % config.get('sqlserver', 'row') + " " + tbname
        else : a='%s' % config.get('sqlserver', 'row') + " " + tbname.lower() + " " + 'order by 1 asc'
        if tbname in ('rollback_t2','i2_binary004','sparsetable2') :
            a='%s' % config.get('sqlserver', 'row') + " " + tbname + " " + 'order by 1 asc'
        tgt_cur.execute(a)
        ccc=src_cur.fetchall()
        s=pandas.DataFrame(ccc)
        #.applymap(self.process_datetime2)
        #s=self.process_datetime2(pandas.DataFrame(ccc))
        #ui=pandas.read_sql('%s'%config.get('sqlserver','row')+" "+tbname, self.conn_src,index_col=None, coerce_float=True, params=None, parse_dates=list,columns=None, chunksize=None)
        xxx=tgt_cur.fetchall()
        t=pandas.DataFrame(xxx)
        row=[]
        if len(s)!=0 and len(t)!=0 and len(s[0])==len(t[0]):
            print('Y 行数相同,源%d行,备%d行'%(len(s[0]),len(t[0]))) and self.bfe.append('Y 行数相同,源%d行,备%d行'%(len(s[0]),len(t[0])))

            for i in range(s.shape[0]):
                for j in range(s.shape[1]):
                    c=str(type(t.iloc[i,j]))
                    src_cube=s.iloc[i,j]
                    tgt_cube=t.iloc[i,j]

                    if isinstance(src_cube,type(tgt_cube)) and src_cube == tgt_cube:
                        row.append((1, type(src_cube)))
                    elif isinstance(src_cube,decimal.Decimal) and isinstance(tgt_cube,numpy.int64):
                        if int(src_cube)==tgt_cube:
                            row.append((1, type(src_cube)))
                    elif (src_cube=='' or src_cube is None) and tgt_cube is None:
                        row.append((1, type(src_cube)))
                    elif (isinstance(src_cube,str) and isinstance(tgt_cube,str)) and re.sub(' ','',src_cube).upper()==re.sub(' ','',tgt_cube).upper():
                        #if re.sub(' ','',src_cube).upper()==re.sub(' ','',tgt_cube).upper():
                        row.append((1, type(src_cube)))
                        # else:
                        #     row.append((0, (i, j), src_cube, tgt_cube))
                        #     err.append(((i, j), src_cube, tgt_cube))
                    elif isinstance(tgt_cube,str) and not isinstance(src_cube,str) and str(src_cube).upper()==str(tgt_cube).upper():
                        row.append((1, type(src_cube)))
                    elif ((type(src_cube) and type(tgt_cube))==bytes) and src_cube is tgt_cube:#byte类型处理
                        row.append((1, type(src_cube)))
                    #time类型处理
                    elif type(tgt_cube) in (pandas._libs.tslibs.timestamps.Timestamp ,str ) and type(src_cube)==bytes:#ssms为datetimeoffset，特殊处理
                        unpacked = struct.unpack('QIhH', src_cube)
                        m = []
                        for tup in unpacked:
                            m.append(tup)
                        days = m[1]
                        microseconds = m[0] / 10 if m[0] else 0
                        timezone = m[2]
                        tz = tzoffset('ANY', timezone * 60)
                        my_date = datetime(*[1900, 1, 1, 0, 0, 0], tzinfo=tz)
                        td = timedelta(days=days, minutes=m[2], microseconds=microseconds)
                        my_date += td
                        print(type(my_date),my_date)
                        if str(my_date)[:-6] == str(tgt_cube):#适配不同格式与进位
                            row.append((1, type(src_cube)))
                        elif str(my_date)[:-8] == str(tgt_cube)[:-2]:
                            row.append((1, type(src_cube)))
                        elif re.sub(' ','',str(my_date))[:18]==re.sub(' ','',str(tgt_cube))[:18]:
                            row.append((1, type(src_cube)))
                        else:
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))
                    elif (isinstance(tgt_cube,pandas._libs.tslibs.nattype.NaTType) and not src_cube) or (isinstance(src_cube,pandas._libs.tslibs.nattype.NaTType) and
                                                                                                         not tgt_cube):row.append((1, type(src_cube)))
                    elif type(src_cube) ==pandas._libs.tslibs.timestamps.Timestamp:#ssms timestamp精度可能丢失，保留小数2位再做比较
                        if str(src_cube)[:-4] == str(tgt_cube)[:-4]:
                            row.append((1, type(src_cube)))
                        elif str(src_cube)[:17] == str(tgt_cube)[:17]:
                            row.append((1, type(src_cube)))
                        else:
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))
                    elif isinstance(src_cube,time):#ssms time毫秒有误差，只判断至十分位
                        if str(src_cube)[:11] == str(tgt_cube)[:11]:
                            row.append((1, type(src_cube)))
                        elif str(src_cube)[:7] == str(tgt_cube)[:7]:
                            row.append((1, type(src_cube)))
                        else  :
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))
                    elif isinstance(src_cube,date):#ssms date转换至str直接比较
                        if str(src_cube) == str(tgt_cube):
                            row.append((1, type(src_cube)))
                        else  :
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))
                    elif (isinstance(src_cube,bool) or isinstance(src_cube,numpy.bool_))\
                            and (isinstance(tgt_cube,numpy.float64) or isinstance(tgt_cube,numpy.int64) or isinstance(tgt_cube,decimal.Decimal)):
                        if src_cube == False and tgt_cube == 0.0:
                            row.append((1, type(src_cube)))
                        elif src_cube == True and tgt_cube == 1.0 :
                            row.append((1, type(src_cube)))
                        else:
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))


                    elif type(tgt_cube)==numpy.float64 :#ssms float精度不一致处理
                        if str(src_cube)[0:len(str(tgt_cube))-2] == str(tgt_cube)[:-2]:
                            row.append((1, type(src_cube)))
                        elif numpy.isnan(tgt_cube) and not src_cube:
                            row.append((1, type(src_cube)))
                        elif isinstance(src_cube,decimal.Decimal) and float(src_cube)==tgt_cube:
                            row.append((1, type(src_cube)))
                        else :
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))
                    #binary类型
                    elif isinstance(tgt_cube, cx_Oracle.LOB) or (isinstance(src_cube,str) and isinstance(tgt_cube,str)):
                        if isinstance(tgt_cube,str):
                            pass
                        elif isinstance(tgt_cube, cx_Oracle.LOB):
                            tgt_cube=tgt_cube.read()
                        if tgt_cube==src_cube:
                            row.append((1, type(src_cube)))
                        elif isinstance(src_cube,str) and re.sub('\s','',tgt_cube) == re.sub('\s','',src_cube):
                            row.append((1, type(src_cube)))
                        elif isinstance(src_cube,str) and (src_cube.startswith('POINT') or src_cube.startswith('LINESTRING')):
                            temp_t=re.findall(r'\((.*?)\)',tgt_cube)[0].split(' ')
                            temp_s=re.findall(r'\((.*?)\)',src_cube)[0].split(' ')
                            #point类 小数省略后三位
                            if len(temp_t[0])==len(temp_s[0]) and len(temp_t[1])==len(temp_s[1]):
                                if temp_t[1][:-3] == temp_s[1][:-3] and temp_t[0][:-3]==temp_s[0][:-3]:
                                    row.append((1, type(src_cube)))
                            elif len(temp_t[0])!=len(temp_s[0]) and len(temp_t[1])==len(temp_s[1]):
                                if temp_t[1][:-3] == temp_s[1][:-3] and temp_t[0][:3] == temp_s[0][:3]:
                                    row.append((1, type(src_cube)))
                            elif temp_t[0][:3]==temp_s[0][:3] and temp_t[1][:3]==temp_s[1][:3]:
                                row.append((1, type(src_cube)))
                            else:
                                row.append((0, (i,j),src_cube,tgt_cube))
                                err.append(((i,j),src_cube,tgt_cube))
                        elif isinstance(src_cube,str) and src_cube.startswith('POLYGON'):
                            x=0
                            temp_t = re.findall(r'\(\((.*?)\)\)', tgt_cube)[0].split(',')
                            temp_s = re.findall(r'\(\((.*?)\)\)', src_cube)[0].split(',')

                            for iss,js in zip(temp_t,temp_s):
                                i_front=re.findall('(.*?)\s', iss.strip())[0]
                                i_behind=re.findall('\s(.+)', iss.strip())[0]
                                j_front=re.findall('(.*?)\s', js.strip())[0]
                                j_behind=re.findall('\s(.+)', js.strip())[0]
                                for ccx, char in enumerate(i_front):
                                    if char == '.':l=ccx;break
                                for cct, ccs in enumerate(i_behind):
                                    if ccs=='.':k=cct;break
                                if i_front[:l+2]==j_front[:l+2] and i_behind[:k+2]==j_behind[:k+2]:#取小数点后两位
                                    x+=1
                                else:pass
                            if x==len(temp_t):row.append((1, type(src_cube)))
                            else:
                                row.append((0, (i,j),src_cube,tgt_cube))
                                err.append(((i,j),src_cube,tgt_cube))
                        elif isinstance(src_cube,str) and src_cube.startswith('COMPOUNDCURVE'):
                            temp_t_front= re.findall(r'(?<=\(CIRCULARSTRING\().*?(?=\))',tgt_cube)[0]
                            temp_t_behind=re.findall(r'(?<=,\sCIRCULARSTRING\().*?(?=\))',tgt_cube)[0]
                            temp_s_front= re.findall(r'(?<=\(CIRCULARSTRING\s\().*?(?=\))',src_cube)[0]
                            temp_s_behind=re.findall(r'(?<=,\sCIRCULARSTRING\s\().*?(?=\))',src_cube)[0]
                            temp_t=temp_t_front+', '+temp_t_behind
                            temp_s=temp_s_front+', '+temp_s_behind
                            x=0
                            for iss,js in zip(temp_t.split(','),temp_s.split(',')):
                                i_front=re.findall('(.*?)\s', iss.strip())[0]
                                i_behind=re.findall('\s(.+)', iss.strip())[0]
                                j_front=re.findall('(.*?)\s', js.strip())[0]
                                j_behind=re.findall('\s(.+)', js.strip())[0]
                                for ccx, char in enumerate(i_front):
                                    if char == '.':l=ccx;break
                                for cct, ccs in enumerate(i_behind):
                                    if ccs=='.':k=cct;break
                                if i_front[:l+2]==j_front[:l+2] and i_behind[:k+2]==j_behind[:k+2]:#取小数点后两位
                                    x+=1
                                else:pass
                            if x == len(temp_t_front.split(','))*2: row.append((1, type(src_cube)))
                            else:
                                row.append((0, (i,j),src_cube,tgt_cube))
                                err.append(((i,j),src_cube,tgt_cube))
                        elif isinstance(src_cube,str) and re.sub('\x00.*','',src_cube) == re.sub('\x00.*','',tgt_cube):
                            row.append((1, type(src_cube)))

                        else:  # geometry暂时无法处理
                            row.append((0, (i,j),src_cube,tgt_cube))
                            err.append(((i,j),src_cube,tgt_cube))
                    elif isinstance(tgt_cube, memoryview) and src_cube == tgt_cube.tobytes():
                        row.append((1, type(src_cube)))
                    else:
                        row.append((0, (i, j), src_cube, tgt_cube))
                        err.append(((i, j), src_cube, tgt_cube))
                            # shapely_geometry = wkb.loads(src_cube, hex=True)
                            # geo=dumps(shapely_geometry)
                            # 检查几何类型
                            #if shapely_geometry.geom_type == 'LineString':
                                # 获取点坐标
                                #point_coordinates = shapely_geometry.coords.xy
                                #x, y = point_coordinates[0][0], point_coordinates[1][0]

                            # geometry_text = binascii.unhexlify(src_cube).decode('utf-8')
                            # riginal_text = src.decode('utf-8')
                                #print(f"点坐标：({x}, {y})")

                #print(row)#显示行数比对明细，行数过多不宜开启
                row=[]
        elif len(s)!=0 and len(t)!=0 and len(s[0])!=len(t[0]):
            print('NO! 行数不同,源%d行,备%d行'%(len(s[0]),len(t[0])));self.bfe.append('NO! 行数不同,源%d行,备%d行'%(len(s[0]),len(t[0])))
        elif len(t)==0 and len(s)!=0:
            print('\033[0;31m NO! \033[0m \t  行数不同,源%d行,备端空表'%(len(s[0])));self.bfe.append('\033[0;31m NO! \033[0m \t  行数不同,源%d行,备端空表'%(len(s[0])))
        else :print('~ 空表') ;self.bfe.append('~ 空表')
        #print(s,'\n',t,s.equals(t))
        print(err)
        self.cons_err.append(err)
    def mss_spc(self,tgcol,tbname):
        f=[];i=0
        for col in tgcol:
            if col['type'] in self.type_cache:
                f.append(f"{self.type_cache[col['type']]}".format(col_name=col['col_name']));i+=1
            elif col['type'].startswith('varchar'):
                self.type_cache[col['type']]='''CONVERT(nvarchar(max),"{col_name}")'''
                f.append(f"{self.type_cache[col['type']]}".format(col_name=col['col_name']));i+=1
            elif col['type'].startswith('char'):
                    self.type_cache[col['type']] ='''CONVERT(nchar,"{col_name}")'''
                    f.append(f"{self.type_cache[col['type']]}".format(col_name=col['col_name']));i+=1
            elif col['type'].startswith('text'):
                    self.type_cache[col['type']] ='''CONVERT(ntext,"{col_name}")'''
                    f.append(f"{self.type_cache[col['type']]}".format(col_name=col['col_name']));i+=1
            elif col['type'].startswith('geo'):
                    self.type_cache[col['type']]='"{col_name}".STAsText()'
                    f.append(f"{self.type_cache[col['type']]}".format(col_name=col['col_name']));i+=1
            elif col['type'].startswith('sql_variant') or col['type'].startswith('hierarchyid'):
                    self.type_cache[col['type']] = '''cast({col_name} as nvarchar(max))'''
                    f.append(f"{self.type_cache[col['type']]}".format(col_name=col['col_name']));i+=1
            else:
                    f.append(f'''"{col['col_name']}"''')
        if len(f)==1 or not f:
            sql=f'select * from {tbname}'
        elif i==0:
            sql = f'select * from {tbname}'
        else:
            col_str=','.join(f)
            sql=f"""select {col_str} from {tbname}"""
        return sql

    def process_datetime2(self,element):
        # 检查元素类型是否为 datetime64[ns]（Pandas datetime 类型）
        if element and isinstance(element, (datetime.datetime,datetime.date,datetime.time)):
            # 将 datetime 转换为字符串并返回
            return element.strftime('%Y-%m-%d %H:%M:%S.%f')
        else:
            # 对于其他类型的元素，不做处理
            return element
    def map_compare(self,srcd,tgtd):
        error=[]
        if srcd['null'].upper()[0]!=tgtd['null'].upper()[0]:
            print('NO! %s列源备库非空状态不一致，源库为%s,备库为%s'%(srcd['col_name'],srcd['null'],tgtd['null']))
            self.bfe.append('NO! %s列源备库非空状态不一致，源库为%s,备库为%s'%(srcd['col_name'],srcd['null'],tgtd['null']))
        for j in range(len(self.data.index.values)):
            b=re.sub(r"\(.*?\)",'',self.data.iloc[j,self.src_index])
            q=srcd['type']
            if b==srcd['type']:
                src_col_temp=self.data.iloc[j,self.src_index]
                tgt_col_temp=self.data.iloc[j,self.tgt_index]#类型
                if tgt_col_temp.split("，").__len__()<=1 :
                    self.map_compare_simple(srcd,tgtd,tgt_col_temp)
                elif tgt_col_temp.split("，").__len__() >1:#特殊复杂情况情况
                    #print(tgt_col_temp.split("，"),type(tgt_col_temp.split("，")))
                    #tgt_col_temp=tgt_col_temp.split("，")
                    for i in range(len(self.complex_map.index.values)):
                        #print(self.complex_map)
                        if re.sub(r"\(.*?\)",'',self.complex_map.iloc[i,self.src_index])==b:
                            rule_param=self.complex_map.iloc[i,self.tgt_index]
                    if isinstance(rule_param,int):#只需判断一次
                        if (srcd['num_pre'] and srcd['num_pre']>=int(rule_param))or(srcd['len'] and srcd['len']>=int(rule_param)
                        or srcd['time_sh'] and srcd ['time_sh']>int(rule_param) or srcd['len']==-1):
                            s1 = tgt_col_temp.split("，")[-1]
                            self.map_compare_simple(srcd,tgtd,s1)
                        else:
                            s2 = tgt_col_temp.split("，")[0]
                            self.map_compare_simple(srcd,tgtd,s2)
                    elif len(rule_param.split("，"))>=1:#需判断3次
                        rule_param=rule_param.split("，")
                        if (srcd['num_pre'] and srcd['num_pre']>=int(rule_param[-1]))or(srcd['len'] and srcd['len']>=int(rule_param[-1])
                        or srcd['len']==-1):
                            x1=tgt_col_temp.split("，")[-1]
                            self.map_compare_simple(srcd,tgtd,x1)
                        elif (srcd['num_pre'] and srcd['num_pre']<int(rule_param[0]))or(srcd['len'] and srcd['len']<int(rule_param[0])):
                            x2 = tgt_col_temp.split("，")[0]
                            self.map_compare_simple(srcd,tgtd,x2)
                        else:self.map_compare_simple(srcd,tgtd,tgt_col_temp.split("，")[1])

                        #print(rule_param,type(rule_param))

        #print(tgt_col_temp)
        #data[tgt_index]
        #print(srcd,tgtd)
    def search_dicts(self,dlist,key, value):
        self.templist = []
        for d in dlist:

            if key in d and d[key].upper() == value: #and not value.upper().startswith('MSREPL'):
                self.templist=d['tab_col']
        return self.templist
    def col_compair(self,src,tgt):
        for i in range(len(src)): #src 所有字段的字典列表
            scol=(src[i])
            tcol=(tgt[i])
            if scol['col_name'].upper()==tcol['col_name'].upper():#列名相同
                self.map_compare(scol,tcol)
            elif scol['col_name'].upper().startswith('MSREPL'):
                continue
            else:
                print('NO! 备端缺失列%s'%scol['col_name'])
                self.bfe.append('NO! 备端缺失列%s'%scol['col_name'])
        pass
    def dump_e(self):
        a = input('press a to dump infomation to EXCEL right now \t or \t press x exit go model ergodic operator later')
        while a == 'a':
            try:
                dump_excel.analysis(self.cons_err)
                dump_excel.xlsx(p.src_db,p.tgt_db)
                break
            except PermissionError as e:
                b = input('%s\npress c to continue \t or \t press x exit break' % e)
                if b == 'c':
                    continue
                elif b == 'x':
                    break
                else:print('重新输入')
    def define_type(self):
        if self.src_db in self.oracle:self.conf_src='oracle';src=self.ora_tab()
        elif self.src_db in self.mysql: self.conf_src='mysql';src=self.mysql_tab()
        elif self.src_db in self.pg: self.conf_src='postgre';src=self.pg_tab()
        elif self.src_db in self.sqlserver: self.conf_src='sqlserver';src=self.src_tab()
        elif self.src_db in self.clickhouse: self.conf_src='clickhouse';src=self.mysql_tab()
        elif self.src_db in self.db2:
            self.conf_src='sqlserver';src=self.src_tab()
        else:src=self.conf_src='oracle';self.src_tab()#缺省源库sqlserver
        if self.tgt_db in self.oracle:tgt=self.conf_tgt='oracle';self.ora_tab()
        elif self.tgt_db in self.mysql: tgt = self.conf_tgt='mysql';self.mysql_tab()
        elif self.tgt_db in self.pg:tgt = self.conf_tgt='postgre';self.pg_tab()
        elif self.tgt_db in self.sqlserver: self.conf_tgt='sqlserver';tgt=self.src_tab()
        elif self.tgt_db in self.clickhouse:
            self.conf_tgt = 'clickhouse';tgt = self.ck_tab()
        else:tgt=self.conf_tgt='oracle';self.ora_tab()#缺省备库oracle
        return src,tgt
    def compare(self):
        i=j=k=0
        col_list=[]
        #源备库设置
        self.src_db='postgre'
        self.tgt_db='clickhouse'
        self.map_analysis(compare_file)
        src,tgt=self.define_type()

        if src[0]!= tgt[0]:
            xsrc=[]
            xtgt=[]
            xerr=[]
            for nn in src[1]:
                xsrc.append(nn['tab_name'].lower())
            for mm in tgt[1]:
                xtgt.append(mm['tab_name'].lower())
            if src[0]>tgt[0]:
                for x in xtgt:
                    if x in xsrc:
                        continue
                    else:xerr.append(x)
            else:
                for x in xsrc:
                    if x in xtgt:
                        continue
                    else:xerr.append(x)

            print(f'源备表数量不一致，源端共计 %d个表，备端共计 %d个表，\n 缺失表单{xerr}'%(src[0],tgt[0]))
            self.bfe_last.append(f'源备表数量不一致，源端共计 %d个表，备端共计 %d个表，\n 缺失表单{xerr}'%(src[0],tgt[0]))
        else:
            print('源端共计 %d个表，备端共计 %d个表'%(src[0],tgt[0]))
            self.bfe_last.append('源端共计 %d个表，备端共计 %d个表'%(src[0],tgt[0]))
        for y in src[1]:
            a=self.search_dicts(tgt[1],'tab_name',y['tab_name'].upper())
            self.bfe.append(y['tab_name'])
            if a:
                #if len(a)==len(y['tab_col']) or len(a)+1==len(y['tab_col']):
                if len(a) == len(y['tab_col']) :
                    #length=len(a);table_name=y['tab_name']
                    print('\033[0;34m %s \033[0m源备字段数相同，源端字段：%d \t备端字段%d'%(y['tab_name'],len(y['tab_col']),len(a)))
                    self.bfe.append('\033[0;34m %s \033[0m源备字段数相同，源端字段：%d \t备端字段%d'%(y['tab_name'],len(y['tab_col']),len(a)))
                    self.col_compair(y['tab_col'],a)##比对字段属性
                    self.row_contain(self.conn_src,self.conn_tgt,y['tab_name'],y['tab_col'],a)
                    #单线程
                    self.cons_compare(
                        self.cons_analysis(y['tab_name'], len(a), 'tgt'),
                        self.cons_analysis(y['tab_name'], len(a),'src'))
                    #多线程
                    # ctx = multiprocessing.get_context('spawn')
                    # T1=ctx.Process(target=self.cons_analysis,args=(table_name,length))
                    # T2=ctx.Process(target=self.src_cons_ana,args=(table_name,length))
                else:
                    print('\033[0;34m ！ \033[0m%s\t源备字段数不同，源端字段：%d \t备端字段%d'%(y['tab_name'],len(y['tab_col']),len(a)))
                    self.bfe.append('\033[0;34m ！ \033[0m%s\t源备字段数不同，源端字段：%d \t备端字段%d'%(y['tab_name'],len(y['tab_col']),len(a)))
            else:
                print('\033[0;34m ！ \033[0m备端查无该表 %s'%y['tab_name'])
                self.bfe.append('\033[0;34m ！ \033[0m备端查无该表 %s'%y['tab_name'])
            self.bfe_last.append(self.bfe)
            self.bfe=[]
        #打表
        # self.xlsx(self.bfe_last)
        print(self.bfe_last)
        report=json.dumps(self.bfe_last)
        cons=json.dumps(self.col_result)
        #err=json.dumps(self.cons_err)
        with open('resource/test_report/report.txt','w+') as f:
            f.write(report)
        with open('resource/test_report/cons.txt','w+') as f:
            f.write(cons)
        # with open('resource/test_report/cons_err.txt','w+') as f:
        #     f.write(err)
        #print(tgt,'\n',src)

if __name__ == '__main__':
    p=ergodic_database()
    dump_excel=ergodic.get_casefile()
    p.compare()
    p.dump_e()

    #p.map_analysis(compare_file)
