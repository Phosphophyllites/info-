case 036 "数据：xml类型插入数据" 0
before:
drop table dbo.i2_xml001;
go
src_sql:
CREATE TABLE dbo.i2_xml001 (no int primary key, c_xml xml);
INSERT INTO dbo.i2_xml001 VALUES(1,'<catalog>
<book category="ITPro">
<title>Windows Step By Step</title>
<author>Bill Zack</author>
<price>49.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>克干辣椒是该考虑激昂慷慨刻录机开朗卡拉就是克劳福德考虑健康快乐吉安卡罗刻录机奥克兰就刻录机Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>街舞求我i球体quit艾俄外交官克拉金克拉将通过卡拉金融控股的感觉啊滚开啦风口浪尖安居客临近高考临近ask附件Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>会计法琼恩u他立刻打开工具奥克兰数据库安康结果开朗卡卡结果看了就阿喀琉斯结果给埃里克房价过快啦发噶记录泸沽湖埃里克就噶昆仑剑法Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>金卡卡的世界观卡数据库管理教案课件公开付款啦和概括来讲奥克兰就的卡了几个绿卡离开过金克拉尽快了解埃里克就Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="ITPro">
<title>Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
<book category="Developer">
<title>空间大卡卡里卡多江苏高考临近奥克兰给金克拉金克拉感觉奥克兰就概括了撒加快了看了几个卡拉观看了急啊看了几个老咔叽Developing ADO .NET</title>
<author>Andrew Brust</author>
<price>39.93</price>
</book>
<book category="ITPro">
<title>克拉斯就i啊u提欧穷人无我饿却外来空间快乐和居然开了就会考虑急啊看了很久饿啊很快垃圾和刻录机奥克兰和Windows Cluster Server</title>
<author>Stephen Forte</author>
<price>59.99</price>
</book>
</catalog>');
INSERT INTO dbo.i2_xml001 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml001 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into dbo.i2_xml001(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
go

tgt_sql:
select * from dbo.i2_xml001 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml001');
go

case 037 "数据：xml类型更新数据" 0
before:
drop table dbo.i2_xml002;
go
src_sql:
CREATE TABLE dbo.i2_xml002 (no int primary key, c_xml xml);
INSERT INTO dbo.i2_xml002 VALUES(1,'<Root>
<ProductDescription ProductID="1" ProductName="Road Bike">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml002 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml002 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into dbo.i2_xml002(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
update dbo.i2_xml002 set c_xml='<Root>
<Location LocationID="10"
LaborHours="1.1"
MachineHours=".2" >Manufacturing steps are described here.
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
</Location>
</Root>' where no=1;
go

tgt_sql: (2)
select * from dbo.i2_xml002 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml002');
go

case 038 "数据：xml类型删除数据" 0
before:
drop table dbo.i2_xml003;
go
src_sql:
CREATE TABLE dbo.i2_xml003 (no int primary key, c_xml xml);
INSERT INTO dbo.i2_xml003 VALUES(1,'<Root>
<ProductDescription ProductID="1" ProductName="Road Bike">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml003 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml003 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into dbo.i2_xml003(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
delete from dbo.i2_xml003 where  no=3;
go

tgt_sql: (2)
select * from dbo.i2_xml003 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml003');
go

case 039 "数据：xml类型添加列 " 0
before:
drop table dbo.i2_xml004;
go
src_sql:
CREATE TABLE dbo.i2_xml004 (no int primary key, c_xml xml);
INSERT INTO dbo.i2_xml004 VALUES(1,'<Root>
<ProductDescription ProductID="1" ProductName="Road Bike">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml004 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
alter table dbo.i2_xml004 add v1 xml;
INSERT INTO dbo.i2_xml004 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>','<Root>
<ProductDescription ProductID="1" ProductName="yf stream1">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into dbo.i2_xml004(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
update dbo.i2_xml004 set v1='<Root>
<Location LocationID="30"
LaborHours="3.1"
MachineHours=".2" >Manufacturing steps are described here.
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
</Location>
</Root>' where no=1;
update dbo.i2_xml004 set v1='<Root>
<Location LocationID="40"
LaborHours="4.1"
MachineHours=".2" >Manufacturing steps are described here.
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
</Location>
</Root>' where no=4;
update dbo.i2_xml004 set c_xml='<Root>
<Location LocationID="50"
LaborHours="5.1"
MachineHours=".2" >Manufacturing steps are described here.
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
</Location>
</Root>' where no=2;
delete from i2_xml004 where no=2;
go

tgt_sql: (2)
select * from dbo.i2_xml004 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml004');
go

case 040 "数据：xml类型删除列 " 0
before:
drop table dbo.i2_xml005;
go
src_sql:
CREATE TABLE dbo.i2_xml005 (no int primary key, c_xml xml,v1 xml);
INSERT INTO dbo.i2_xml005 VALUES(1,'<Root>
<ProductDescription ProductID="1" ProductName="Road Bike">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>','<Root>
<ProductDescription ProductID="1" ProductName="v1">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml005 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>','<Root>
<ProductDescription ProductID="1" ProductName="v1">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
alter table dbo.i2_xml005 drop column v1;
INSERT INTO dbo.i2_xml005 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into dbo.i2_xml005(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
update dbo.i2_xml005 set c_xml='<Root>
<Location LocationID="40"
LaborHours="4.1"
MachineHours=".2" >Manufacturing steps are described here.
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
</Location>
</Root>' where no=1;
delete from i2_xml005 where no=2;
go

tgt_sql: (2)
select * from dbo.i2_xml005 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml005');
go

case 041 "数据：xml类型重命名表 " 0
before:
drop table dbo.i2_xml006;
drop table i2_xml006_renew;
go
src_sql:
CREATE TABLE dbo.i2_xml006 (no int primary key, c_xml xml);
sleep(3000);
INSERT INTO dbo.i2_xml006 VALUES(1,'<Root>
<ProductDescription ProductID="1" ProductName="Road Bike">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml006 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
exec sp_rename 'dbo.i2_xml006','i2_xml006_renew';
INSERT INTO i2_xml006_renew VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into i2_xml006_renew(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
update dbo.i2_xml006_renew set c_xml='<Root>
<Location LocationID="40"
LaborHours="4.1"
MachineHours=".2" >
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
 Manufacturing steps are described here.
</Location>
</Root>' where no=1;
delete from i2_xml006_renew where no=2;
go

tgt_sql: (2)
select no from dbo.i2_xml006_renew order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml006_renew');
go

case 144 "数据：xml类型重命名列" 0
before:
drop table dbo.i2_xml007;
go
src_sql:
CREATE TABLE dbo.i2_xml007 (no int primary key, c_xml xml);
INSERT INTO dbo.i2_xml007 VALUES(1,'<Root>
<ProductDescription ProductID="1" ProductName="Road Bike">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
INSERT INTO dbo.i2_xml007 VALUES(2,'<Root>
<ProductDescription ProductID="1" ProductName="yingfang active">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
ALTER TABLE dbo.i2_xml007 ADD c_x1 xml,c_x2 xml;
exec sp_rename 'dbo.i2_xml007.c_x1','c_x1_n','COLUMN';
exec sp_rename 'dbo.i2_xml007.c_x2','c_x2_n','COLUMN';
INSERT INTO dbo.i2_xml007 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>',
'<Root>
<ProductDescription ProductID="2" ProductName="yf stream">
<Features>
<Warranty>2 year parts and labor</Warranty>
<Maintenance>2 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>',
'<Root>
<ProductDescription ProductID="3" ProductName="yf stream">
<Features>
<Warranty>3 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into dbo.i2_xml007(no,c_x2_n) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
update dbo.i2_xml007 set c_x1_n= '<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>'  where no=1;
delete from dbo.i2_xml007 where no=3;
go

tgt_sql: (2)
select * from dbo.i2_xml007 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml007');
go
