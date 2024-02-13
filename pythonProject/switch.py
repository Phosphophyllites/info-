import pymysql
import pymssql
import os
import re
import time

import opg
from opg import MysqlConn
pg_case=r'resource/postgre/pg_basedml'
mss_case=r'resource/resource101'

class read_case():
    def __init__(self):
        self.addr=''
        self.current_cursor=None
        self.mode=''
        self.case_name=''
        self.numer=0
        self.templine=''
        self.sqllist=[]#最终大列表
        self.sqldict={}
        self.sqldict['dml']=''#结构体
        self.sqldict['before']=[]
        self.tempstring=[]#存储before等临时ddl、dml等
        self.result=[]
        self.tempdict={}
        self.case_dir=r'resource/resource101'
        self.case_file_list=[]
        self.before=[]

        #self.dml=('insert','update','delete')
    def ergodic(self):

        for files in os.listdir(self.case_dir):
            if files.endswith('.sql'):
                self.case_file_list.append('%s/%s'%(self.case_dir,files))
        return self.case_file_list
    def analysis(self,addr):     #返回最终sql用例列表 每个用例为一个字典
        self.addr=r'%s'%addr
        with open(self.addr,mode='r',encoding='utf-8') as f:
            while True:
                self.templine = f.readline()
                if(self.templine==''):
                    break
                else:
                    self.templine=self.templine.replace('\n', '').replace('\t',' ')

                # if self.templine.startswith('case') and  \
                #         ('重命名' or '修改列属性') not in self.templine.replace(' ',''):
                if self.templine.startswith('case'):
                    self.sqldict['casename']=self.templine
                    self.numer+=1
                    #print(self.sqldict)
                    while True:
                        self.templine = f.readline()
                        #print(self.sqldict)
                        if self.mode=='tgt' :
                            self.before.append(self.sqldict['before'])
                            self.sqllist.append(self.sqldict)
                            self.sqldict={}
                            self.sqldict['dml'] = ''
                            self.sqldict['before']=[]
                            self.mode=''
                            break

                        elif self.templine.replace(' ','').lower().startswith('before'):#before
                            while True:
                                self.templine=f.readline()
                                if self.templine.replace(' ','').startswith('go') or self.templine.replace(' ','').startswith('src_sql'):
                                    break
                                else:
                                    self.sqldict['before'].append(self.templine.replace('\n',' ').replace('\t',' '))
                            #print(self.sqldict)
                            continue
                        elif self.templine.startswith('src'):
                            self.templine=''
                            self.mode='src'
                            while True:
                                self.templine=f.readline()
                                if self.templine.replace(' ','').startswith('tgt'):
                                    self.mode='tgt'
                                    break
                                elif self.templine.startswith('sleep') or re.sub(' ','',self.templine).lower().startswith('go'):
                                    continue
                                elif self.templine.split('--',1).__len__()>1:
                                    if self.templine.split('--',1)[1].replace('\n','').endswith(';'):
                                        self.sqldict['dml']+= self.templine
                                    else:self.sqldict['dml'] += self.templine.split('--',1)[0]
                                else:
                                    self.sqldict['dml']+=r'%s'%self.templine.replace('\n',' ').replace('\t',' ')
                        elif self.templine.replace('\t','').startswith('sleep'):
                            continue

        #print(self.sqllist)
        return self.sqllist,self.numer
    def execute(self,conn):#mssql
        '''执行sql,支持执行多条sql语句。'''
        T1=T2=T3=T4=k = j = 0
        #print(conn.cursor().connection.server_version)
        self.current_cursor=conn.cursor()
        print('正在执行用例文件：\t%s\t\t\tcase数：%d'%(self.addr,self.numer))
        T1=time.perf_counter()
        for i in range(self.numer):

            print('%s'%self.sqllist[i]['casename'],'\t\t\t进度：%d/%d'%(i+1,self.numer))
            T2 = time.perf_counter()
            #print(self.sqllist[i]['dml'],'\n')
            sqllist1 = self.sqllist[i]['dml'].split(';')
            for b in self.sqllist[i]['before']:
                if b=='':break
                else:
                    try:
                        self.current_cursor.execute(b)
                        time.sleep(0.2)
                        conn.commit()
                        print('执行完毕%s' % b)
                    except pymssql._pymssql.OperationalError as e:
                        print('执行%s失败'%b,e)
            for caseline in sqllist1:
                try:
                    if 'sp_rename' in caseline:
                        time.sleep(1);print(f'特殊语句，等候3s ：：{caseline}')
                    self.current_cursor.execute(caseline)
                    conn.commit()
                    k += 1
                    print("语句%s执行完毕\n暂停2s"%caseline)
                    #time.sleep(1.0)
                    time.sleep(0.5)
                except pymssql._pymssql.OperationalError or pymssql._pymssql.ProgrammingError or pymssql._pymssql.IntegrityError as err:
                    print('执行语句%s失败，跳过该语句'%caseline,err)
                    j+=1
                    pass
            T3 = time.perf_counter()
            print('执行完毕，该条用例耗时：\t\t%f毫秒\n'%((T3 - T2)*1000))

            time.sleep(1)
            # print('暂停15s')
        T4 = time.perf_counter()

        print('该用例文件%s耗时：\t%f毫秒,\t\t成功%d/失败%d/共计%d'%(self.addr,((T4 - T1)*1000),k,j,k+j))

        self.numer=0
        self.sqllist=[]

    def colseconn(self):
        if self.current_cursor:
            self.current_cursor.close()
            print('cursor close')
        else:print('cursor has been closed')
    def clean(self,conn):
        #conn=self.current_cursor
        i=j=0
        self.current_cursor = conn.cursor()
        print(self.before)
        while True:
            a=input('press a to clean database witch connecting right now \t or \t press x exit')
            if a =='a':
                for item in self.before:
                    for element in item:
                        j+=1
                        if element =='':break
                        try:
                            self.current_cursor.execute(element)
                            conn.commit()
                            #print("语句%s执行完毕" % element)
                            i+=1
                        except pymssql._pymssql.OperationalError as e:
                            print('执行%s失败' % element, e)
                print('clean 完毕,成功%d条/共计%d'%(i,j))
                break
            if a=='x':
                print('Exit')
                break

if __name__ == '__main__':
        # print('PyCharm')
        # config = configparser.ConfigParser()
        # config.read(r'C:\Users\DELL\PycharmProjects\pythonProject\resource\config.ini', encoding='utf-8')
        #mysqlconn = MysqlConn()
        # print(mysqlconn.host,mysqlconn.port,'\n',mysqlconn.dbName,mysqlconn.password)
        #mysqlconn.open()

        conn=opg.MysqlConn('mssql')
        p = read_case()
        p.case_dir=pg_case####################
        mssql=conn.open_mssql()#open_mssql()传回mssql游标，赋给mssql变量
        T1=time.perf_counter()
        for casefile in p.ergodic():
            p.analysis(casefile)
            p.execute(mssql)
        T2=time.perf_counter()
        print('总共耗时：\t\t%f毫秒'%((T2 - T1)*1000))
        p.clean(mssql)


if __name__ == '__ii__':
        conn=opg.MysqlConn('mssql')
        p = read_case()
        mssql=conn.open_mssql()#open_mssql()传回mssql游标，赋给mssql变量
        p.clean(mssql)





        # p.analysis()
        # p.execute(conn.open_mssql())


