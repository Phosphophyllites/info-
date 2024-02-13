import pymysql
import pymssql
import logging
import time
import configparser
import cx_Oracle
import psycopg2
import pyodbc
import clickhouse_driver
#import ibm_db
#import ibm_db_dbi



logger = logging.getLogger(__name__)  #操作日志对象
#-*- coding:utf-8 -*-
config = configparser.ConfigParser()
config.read(r'resource/config.ini', encoding='utf-8')



class MysqlConn():

    def __init__(self,database):
        self.currentConn = None
        self.host = config.get(database,'host')
        self.user = config.get(database,'username')
        self.password = config.get(database,'password')
        self.dbName = config.get(database,'databasename')
        self.port = config.getint(database, 'port')
        if database.endswith('gbk'):
            self.charset = "GBK"
        else:self.charset = "utf8"
        self.resultlist = []

    def open(self):#msyql类
        T1=T2=0
        try:
            T1=time.perf_counter()
            conn = pymysql.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                db=self.dbName,
                port=self.port,
                charset=self.charset,
            )
            T2=time.perf_counter()
        except pymysql.err.OperationalError as e:
            logger.exception("数据库连接失败！")

        print("mysql数据库连接成功")
        print('%s链接耗时:%f毫秒'%(self.host,((T2 - T1) * 1000)))
        logger.info(f"mysql数据库连接成功")
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn
    def open_mssql(self):
        T1=T2=0
        try:
            T1=time.perf_counter()
            conn = pymssql.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.dbName,
                port=self.port,
                charset=self.charset
            )
            T2=time.perf_counter()
        except pymysql.err.OperationalError as e:
            logger.exception("数据库连接失败！")

        #print("数据库连接成功\t版本为：%s"%conn.cursor().connection.server_version)
        print('mssql %s 链接耗时: %f毫秒'%(self.host,((T2 - T1) * 1000)))
        logger.info(f"mssql数据库连接成功")
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn
    def open_oracle(self):
        T1=T2=0
        p = '%s:%d/%s' % (self.host, self.port, self.dbName)
        try:
            T1=time.perf_counter()

            conn = cx_Oracle.connect(self.user,self.password,p)

            T2=time.perf_counter()
        except cx_Oracle.OperationalError as e:
            logger.exception("数据库连接失败！")
        print('oracle %s链接耗时: %f毫秒'%(self.host,((T2 - T1) * 1000)))
        logger.info(f"mssql数据库连接成功")
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn
    def open_pg(self):
        T1=T2=0
        #p = '%s:%d/%s' % (self.host, self.port, self.dbName)
        try:
            T1=time.perf_counter()

            conn = psycopg2.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.dbName,
                port=self.port,
                client_encoding=self.charset
                ,options='''-c search_path=%s'''%config.get('postgre','schema')
            )
            T2=time.perf_counter()
        except cx_Oracle.OperationalError as e:
            logger.exception("数据库连接失败！")
        print('pg %s链接耗时:%f毫秒'%(self.host,((T2 - T1) * 1000)))
        logger.info(f"pg数据库连接成功")
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn

    def open_clickhouse(self):
        T1=T2=0
        #p = '%s:%d/%s' % (self.host, self.port, self.dbName)
        try:
            T1=time.perf_counter()

            conn = clickhouse_driver.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.dbName,
                port=self.port
            )
            T2=time.perf_counter()
        except cx_Oracle.OperationalError as e:
            logger.exception("数据库连接失败！")
        print('clickhouse %s链接耗时:%f毫秒'%(self.host,((T2 - T1) * 1000)))
        #logger.info(f"pg数据库连接成功")
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn

    def open_db2(self):
        T1 = T2 = 0
        #IBM DB2 ODBC DRIVER
        try:
            T1 = time.perf_counter()
            conn_text=f"Driver={{IBM DB2 ODBC DRIVER}};DATABASE={self.dbName};HOSTNAME={self.host};" \
                 f"PORT={self.port};PROTOCOL=TCPIP;UID={self.user};PWD={self.password};"
            conn=pyodbc.connect(conn_text)
            T2=time.perf_counter()
        except pyodbc.OperationalError as e:
            logger.exception("数据库连接失败！%s",e)
        print('ibm_db2 %s链接耗时:%f毫秒'%(self.host,((T2 - T1) * 1000)))
        logger.info(f"db2 数据库连接成功")
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn

    def open_dm(self):
        T1=T2=0
        try:
            T1=time.perf_counter()
            conn = pyodbc.connect(
                'DRIVER={DM Driver};SERVER=self.host;UID=self.user;PWD=self.password;DATABASE=self.dbName;charset=self.charset;'
            )
            #conn = ibm_db_dbi.connect("database=***;hostname=你的数据库ip地址;port=端口号;protocol=通信协议（tcp/ip）;UID=用户;PWD=密码","","")
            T2=time.perf_counter()
        except pymysql.err.OperationalError as e:
            logger.exception("数据库连接失败！")

        print("DM数据库连接成功")
        print('%s链接耗时:%f毫秒'%(self.host,((T2 - T1) * 1000)))
        self.currentConn = conn  # 数据库连接完成
        self.cursor = self.currentConn.cursor()  # 游标，用来执行数据库
        return self.currentConn
    def spliteSql(self,sql):
        sqllist = sql.split(';')
        return sqllist[0:-1]
        #最后面会多一条空值
    def execSql(self,sql:str,closeConn = True):
        '''执行sql,支持执行多条sql语句。'''
        self.open()
        sqllist = self.spliteSql(sql)  #先处理传入的sql语句
        logger.info(f"开始执行sql语句")
        with self.cursor as my_cursor:
            for i in sqllist:
                my_cursor.execute(i)         #执行sql语句
                self.resultlist = my_cursor.fetchall()  #获取数据
                self.currentConn.commit()        #提交
        if self.currentConn:
            self.close()
        return self.resultlist
    # def execProc(self):
    def close(self):  #关闭连接
        logger.info(f"关闭数据库连接")
        if self.cursor:
            self.cursor.close()
        self.currentConn.close()

if __name__ == '__main__':
    #print('PyCharm')
    # config = configparser.ConfigParser()
    # config.read(r'C:\Users\DELL\PycharmProjects\pythonProject\resource\config.ini', encoding='utf-8')
    # mysqlconn=MysqlConn('mysql')
    # #print(mysqlconn.host,mysqlconn.port,'\n',mysqlconn.dbName,mysqlconn.password)
    # mysqlconn.open()
    mssqlconn=MysqlConn('clickhouse')
    mssqlconn.open_clickhouse()
    # mssqlconn.open_mssql()
    #mysqlconn.open()

    pass
    # mysqlconn=MysqlConn('pg')
    # mysqlconn.open_pg()