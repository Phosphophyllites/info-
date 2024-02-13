case 001 "数据：xml类型插入数据" 0
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
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml001') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml001'  ORDER BY   c.name,a.name,d.name;
go

case 002 "数据：xml类型更新数据" 0
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
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml002') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml002'  ORDER BY   c.name,a.name,d.name;
go

case 003 "数据：xml类型删除数据" 0
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
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml003') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml003'  ORDER BY   c.name,a.name,d.name;
go

case 004 "数据：xml类型添加列 " 0
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
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml004') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml004'  ORDER BY   c.name,a.name,d.name;
go

case 005 "数据：xml类型删除列 " 0
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
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml005') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml005'  ORDER BY   c.name,a.name,d.name;
go

case 006 "数据：xml类型重命名表 " 0
before:
drop table dbo.i2_xml006;
drop table i2_xml006_新表;
go
src_sql:
CREATE TABLE dbo.i2_xml006 (no int primary key, c_xml xml);

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
exec sp_rename 'dbo.i2_xml006','i2_xml006_新表';
INSERT INTO i2_xml006_新表 VALUES(3,'<Root>
<ProductDescription ProductID="1" ProductName="yf stream">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
insert into i2_xml006_新表(no,c_xml) values(4,'<Root>
<ProductDescription ProductID="1" ProductName="yf coopy">
<Features>
<Warranty>1 year parts and labor</Warranty>
<Maintenance>3 year parts and labor extended maintenance is available</Maintenance>
</Features>
</ProductDescription>
</Root>');
update dbo.i2_xml006_新表 set c_xml='<Root>
<Location LocationID="40"
LaborHours="4.1"
MachineHours=".2" >
<step>Manufacturing step 1 at this work center</step>
<step>Manufacturing step 2 at this work center</step>
 Manufacturing steps are described here.
</Location>
</Root>' where no=1;
delete from i2_xml006_新表 where no=2;
go

tgt_sql: (2)
select no from dbo.i2_xml006_新表 order by no;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml006_新表');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml006_新表') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml006_新表'  ORDER BY   c.name,a.name,d.name;
go

case 007 "数据：xml类型重命名列" 0
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
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml007') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml007'  ORDER BY   c.name,a.name,d.name;
go


case 008 "数据：无主键长xml更新" 0
before:
drop table dbo.i2_xml008;
go
src_sql:
create table i2_xml008(
plan_id int,
plan_name varchar(250),
plan_config xml,
plan_mode int
);
go

insert into dbo.i2_xml008 values(
1,
'jwy',
'<Form>
  <Area No="1">
    <AreaName>区域1</AreaName>
    <Rows>4</Rows>
    <Columns>15</Columns>
    <ScreenWide>120</ScreenWide>
    <ScreenHeight>80</ScreenHeight>
    <ScreenW>1920</ScreenW>
    <ScreenH>1920</ScreenH>
    <Panel PanelNo="1">
      <DecoderID>4402032520076</DecoderID>
      <Name>海康B20解码器1</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842753</Chanel>
      <Location Xlocation="20" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040110</CameraID>
    </Panel>
    <Panel PanelNo="2">
      <DecoderID>4402032520077</DecoderID>
      <Name>海康B20解码器2</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842754</Chanel>
      <Location Xlocation="140" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040111</CameraID>
    </Panel>
    <Panel PanelNo="3">
      <DecoderID>4402032520078</DecoderID>
      <Name>海康B20解码器3</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842755</Chanel>
      <Location Xlocation="260" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040112</CameraID>
    </Panel>
    <Panel PanelNo="4">
      <DecoderID>4402032520079</DecoderID>
      <Name>海康B20解码器4</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842756</Chanel>
      <Location Xlocation="380" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040113</CameraID>
    </Panel>
    <Panel PanelNo="5">
      <DecoderID>4402032520080</DecoderID>
      <Name>海康B20解码器5</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842757</Chanel>
      <Location Xlocation="500" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040106</CameraID>
    </Panel>
    <Panel PanelNo="6">
      <DecoderID>4402032520081</DecoderID>
      <Name>海康B20解码器6</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842758</Chanel>
      <Location Xlocation="620" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040132</CameraID>
    </Panel>
    <Panel PanelNo="7">
      <DecoderID>4402032520082</DecoderID>
      <Name>海康B20解码器7</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842759</Chanel>
      <Location Xlocation="740" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040029</CameraID>
    </Panel>
    <Panel PanelNo="8">
      <DecoderID>4402032520083</DecoderID>
      <Name>海康B20解码器8</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842760</Chanel>
      <Location Xlocation="860" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040087</CameraID>
    </Panel>
    <Panel PanelNo="9">
      <DecoderID>4402032520084</DecoderID>
      <Name>海康B20解码器9</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842761</Chanel>
      <Location Xlocation="980" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040009</CameraID>
    </Panel>
    <Panel PanelNo="10">
      <DecoderID>4402032520085</DecoderID>
      <Name>海康B20解码器10</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842762</Chanel>
      <Location Xlocation="1100" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040372</CameraID>
    </Panel>
    <Panel PanelNo="11">
      <DecoderID>4402032520086</DecoderID>
      <Name>海康B20解码器11</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842763</Chanel>
      <Location Xlocation="1220" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040414</CameraID>
    </Panel>
    <Panel PanelNo="12">
      <DecoderID>4402032520087</DecoderID>
      <Name>海康B20解码器12</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842764</Chanel>
      <Location Xlocation="1340" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040410</CameraID>
    </Panel>
    <Panel PanelNo="13">
      <DecoderID>4402032520088</DecoderID>
      <Name>海康B20解码器13</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842765</Chanel>
      <Location Xlocation="1460" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040457</CameraID>
    </Panel>
    <Panel PanelNo="14">
      <DecoderID>4402032520089</DecoderID>
      <Name>海康B20解码器14</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842766</Chanel>
      <Location Xlocation="1580" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040422</CameraID>
    </Panel>
    <Panel PanelNo="15">
      <DecoderID>4402032520090</DecoderID>
      <Name>海康B20解码器15</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842767</Chanel>
      <Location Xlocation="1700" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040022</CameraID>
    </Panel>
    <Panel PanelNo="16">
      <DecoderID>4402032520091</DecoderID>
      <Name>海康B20解码器16</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842768</Chanel>
      <Location Xlocation="20" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040108</CameraID>
    </Panel>
    <Panel PanelNo="17">
      <DecoderID>4402032520092</DecoderID>
      <Name>海康B20解码器17</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842769</Chanel>
      <Location Xlocation="140" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040109</CameraID>
    </Panel>
    <Panel PanelNo="18">
      <DecoderID>4402032520093</DecoderID>
      <Name>海康B20解码器18</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842770</Chanel>
      <Location Xlocation="260" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040114</CameraID>
    </Panel>
    <Panel PanelNo="19">
      <DecoderID>4402032520094</DecoderID>
      <Name>海康B20解码器19</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842771</Chanel>
      <Location Xlocation="380" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040115</CameraID>
    </Panel>
    <Panel PanelNo="20">
      <DecoderID>4402032520095</DecoderID>
      <Name>海康B20解码器20</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842772</Chanel>
      <Location Xlocation="500" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040121</CameraID>
    </Panel>
    <Panel PanelNo="21">
      <DecoderID>4402032520096</DecoderID>
      <Name>海康B20解码器21</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842773</Chanel>
      <Location Xlocation="620" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040119</CameraID>
    </Panel>
    <Panel PanelNo="22">
      <DecoderID>4402032520097</DecoderID>
      <Name>海康B20解码器22</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842774</Chanel>
      <Location Xlocation="740" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040372</CameraID>
    </Panel>
    <Panel PanelNo="23">
      <DecoderID>4402032520098</DecoderID>
      <Name>海康B20解码器23</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842775</Chanel>
      <Location Xlocation="860" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040456</CameraID>
    </Panel>
    <Panel PanelNo="24">
      <DecoderID>4402032520099</DecoderID>
      <Name>海康B20解码器24</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842776</Chanel>
      <Location Xlocation="980" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040018</CameraID>
    </Panel>
    <Panel PanelNo="25">
      <DecoderID>4402032520100</DecoderID>
      <Name>海康B20解码器25</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842777</Chanel>
      <Location Xlocation="1100" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040451</CameraID>
    </Panel>
    <Panel PanelNo="26">
      <DecoderID>4402032520101</DecoderID>
      <Name>海康B20解码器26</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842778</Chanel>
      <Location Xlocation="1220" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040024</CameraID>
    </Panel>
    <Panel PanelNo="27">
      <DecoderID>4402032520102</DecoderID>
      <Name>海康B20解码器27</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842779</Chanel>
      <Location Xlocation="1340" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040392</CameraID>
    </Panel>
    <Panel PanelNo="28">
      <DecoderID>4402032520103</DecoderID>
      <Name>海康B20解码器28</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842780</Chanel>
      <Location Xlocation="1460" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040010</CameraID>
    </Panel>
    <Panel PanelNo="29">
      <DecoderID>4402032520104</DecoderID>
      <Name>海康B20解码器29</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842781</Chanel>
      <Location Xlocation="1580" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040077</CameraID>
    </Panel>
    <Panel PanelNo="30">
      <DecoderID>4402032520105</DecoderID>
      <Name>海康B20解码器30</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842782</Chanel>
      <Location Xlocation="1700" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040441</CameraID>
    </Panel>
    <Panel PanelNo="31">
      <DecoderID>4402032520106</DecoderID>
      <Name>海康B20解码器31</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842783</Chanel>
      <Location Xlocation="20" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040123</CameraID>
    </Panel>
    <Panel PanelNo="32">
      <DecoderID>4402032520107</DecoderID>
      <Name>海康B20解码器32</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842784</Chanel>
      <Location Xlocation="140" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040125</CameraID>
    </Panel>
    <Panel PanelNo="33">
      <DecoderID>4402032520108</DecoderID>
      <Name>海康B20解码器33</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842785</Chanel>
      <Location Xlocation="260" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040117</CameraID>
    </Panel>
    <Panel PanelNo="34">
      <DecoderID>4402032520109</DecoderID>
      <Name>海康B20解码器34</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842786</Chanel>
      <Location Xlocation="380" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040118</CameraID>
    </Panel>
    <Panel PanelNo="35">
      <DecoderID>4402032520110</DecoderID>
      <Name>海康B20解码器35</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842787</Chanel>
      <Location Xlocation="500" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040129</CameraID>
    </Panel>
    <Panel PanelNo="36">
      <DecoderID>4402032520111</DecoderID>
      <Name>海康B20解码器36</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842788</Chanel>
      <Location Xlocation="620" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040130</CameraID>
    </Panel>
    <Panel PanelNo="37">
      <DecoderID>4402032520112</DecoderID>
      <Name>海康B20解码器37</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842789</Chanel>
      <Location Xlocation="740" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040409</CameraID>
    </Panel>
    <Panel PanelNo="38">
      <DecoderID>4402032520113</DecoderID>
      <Name>海康B20解码器38</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842790</Chanel>
      <Location Xlocation="860" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040011</CameraID>
    </Panel>
    <Panel PanelNo="39">
      <DecoderID>4402032520114</DecoderID>
      <Name>海康B20解码器39</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842791</Chanel>
      <Location Xlocation="980" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040010</CameraID>
    </Panel>
    <Panel PanelNo="40">
      <DecoderID>4402032520115</DecoderID>
      <Name>海康B20解码器40</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842792</Chanel>
      <Location Xlocation="1100" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040052</CameraID>
    </Panel>
    <Panel PanelNo="41">
      <DecoderID>4402032520116</DecoderID>
      <Name>海康B20解码器41</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842793</Chanel>
      <Location Xlocation="1220" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040034</CameraID>
    </Panel>
    <Panel PanelNo="42">
      <DecoderID>4402032520117</DecoderID>
      <Name>海康B20解码器42</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842794</Chanel>
      <Location Xlocation="1340" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040046</CameraID>
    </Panel>
    <Panel PanelNo="43">
      <DecoderID>4402032520118</DecoderID>
      <Name>海康B20解码器43</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842795</Chanel>
      <Location Xlocation="1460" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040068</CameraID>
    </Panel>
    <Panel PanelNo="44">
      <DecoderID>4402032520119</DecoderID>
      <Name>海康B20解码器44</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842796</Chanel>
      <Location Xlocation="1580" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040037</CameraID>
    </Panel>
    <Panel PanelNo="45">
      <DecoderID>4402032520120</DecoderID>
      <Name>海康B20解码器45</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842797</Chanel>
      <Location Xlocation="1700" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040064</CameraID>
    </Panel>
    <Panel PanelNo="46">
      <DecoderID>4402032520121</DecoderID>
      <Name>海康B20解码器46</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842798</Chanel>
      <Location Xlocation="20" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040126</CameraID>
    </Panel>
    <Panel PanelNo="47">
      <DecoderID>4402032520122</DecoderID>
      <Name>海康B20解码器47</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842799</Chanel>
      <Location Xlocation="140" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040127</CameraID>
    </Panel>
    <Panel PanelNo="48">
      <DecoderID>4402032520123</DecoderID>
      <Name>海康B20解码器48</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842800</Chanel>
      <Location Xlocation="260" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040134</CameraID>
    </Panel>
    <Panel PanelNo="49">
      <DecoderID>4402032520124</DecoderID>
      <Name>海康B20解码器49</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842801</Chanel>
      <Location Xlocation="380" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040136</CameraID>
    </Panel>
    <Panel PanelNo="50">
      <DecoderID>4402032520125</DecoderID>
      <Name>海康B20解码器50</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842802</Chanel>
      <Location Xlocation="500" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040131</CameraID>
    </Panel>
    <Panel PanelNo="51">
      <DecoderID>4402032520126</DecoderID>
      <Name>海康B20解码器51</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842803</Chanel>
      <Location Xlocation="620" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040133</CameraID>
    </Panel>
    <Panel PanelNo="52">
      <DecoderID>0</DecoderID>
      <Name />
      <IP />
      <CommPort>0</CommPort>
      <Chanel>0</Chanel>
      <Location Xlocation="0" Ylocation="0" />
      <Size XSize="0" YSize="0" />
      <CameraID>0</CameraID>
    </Panel>
    <Panel PanelNo="53">
      <DecoderID>0</DecoderID>
      <Name />
      <IP />
      <CommPort>0</CommPort>
      <Chanel>0</Chanel>
      <Location Xlocation="0" Ylocation="0" />
      <Size XSize="0" YSize="0" />
      <CameraID>0</CameraID>
    </Panel>
    <Panel PanelNo="54">
      <DecoderID>0</DecoderID>
      <Name />
      <IP />
      <CommPort>0</CommPort>
      <Chanel>0</Chanel>
      <Location Xlocation="0" Ylocation="0" />
      <Size XSize="0" YSize="0" />
      <CameraID>0</CameraID>
    </Panel>
    <Panel PanelNo="55">
      <DecoderID>4402032520127</DecoderID>
      <Name>海康B20解码器52</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842804</Chanel>
      <Location Xlocation="1100" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040368</CameraID>
    </Panel>
    <Panel PanelNo="56">
      <DecoderID>4402032520128</DecoderID>
      <Name>海康B20解码器53</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842805</Chanel>
      <Location Xlocation="1220" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040391</CameraID>
    </Panel>
    <Panel PanelNo="57">
      <DecoderID>4402032520129</DecoderID>
      <Name>海康B20解码器54</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842806</Chanel>
      <Location Xlocation="1340" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040092</CameraID>
    </Panel>
    <Panel PanelNo="58">
      <DecoderID>4402032520130</DecoderID>
      <Name>海康B20解码器55</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842807</Chanel>
      <Location Xlocation="1460" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040043</CameraID>
    </Panel>
    <Panel PanelNo="59">
      <DecoderID>4402032520131</DecoderID>
      <Name>海康B20解码器56</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842808</Chanel>
      <Location Xlocation="1580" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040061</CameraID>
    </Panel>
    <Panel PanelNo="60">
      <DecoderID>4402032520132</DecoderID>
      <Name>海康B20解码器57</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842809</Chanel>
      <Location Xlocation="1700" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040078</CameraID>
    </Panel>
  </Area>
</Form>',
123456
);
update dbo.i2_xml008 set plan_config='<Form>
  <Area No="1">
    <AreaName>区域1</AreaName>
    <Rows>4</Rows>
    <Columns>15</Columns>
    <ScreenWide>120</ScreenWide>
    <ScreenHeight>80</ScreenHeight>
    <ScreenW>1920</ScreenW>
    <ScreenH>1920</ScreenH>
    <Panel PanelNo="1">
      <DecoderID>4402032520076</DecoderID>
      <Name>海康B20解码器1</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842753</Chanel>
      <Location Xlocation="20" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040110</CameraID>
    </Panel>
    <Panel PanelNo="2">
      <DecoderID>4402032520077</DecoderID>
      <Name>海康B20解码器2</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842754</Chanel>
      <Location Xlocation="140" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040111</CameraID>
    </Panel>
    <Panel PanelNo="3">
      <DecoderID>4402032520078</DecoderID>
      <Name>海康B20解码器3</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842755</Chanel>
      <Location Xlocation="260" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040112</CameraID>
    </Panel>
    <Panel PanelNo="4">
      <DecoderID>4402032520079</DecoderID>
      <Name>海康B20解码器4</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842756</Chanel>
      <Location Xlocation="380" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040113</CameraID>
    </Panel>
    <Panel PanelNo="5">
      <DecoderID>4402032520080</DecoderID>
      <Name>海康B20解码器5</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842757</Chanel>
      <Location Xlocation="500" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040106</CameraID>
    </Panel>
    <Panel PanelNo="6">
      <DecoderID>4402032520081</DecoderID>
      <Name>海康B20解码器6</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842758</Chanel>
      <Location Xlocation="620" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040132</CameraID>
    </Panel>
    <Panel PanelNo="7">
      <DecoderID>4402032520082</DecoderID>
      <Name>海康B20解码器7</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842759</Chanel>
      <Location Xlocation="740" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040474</CameraID>
    </Panel>
    <Panel PanelNo="8">
      <DecoderID>4402032520083</DecoderID>
      <Name>海康B20解码器8</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842760</Chanel>
      <Location Xlocation="860" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040084</CameraID>
    </Panel>
    <Panel PanelNo="9">
      <DecoderID>4402032520084</DecoderID>
      <Name>海康B20解码器9</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842761</Chanel>
      <Location Xlocation="980" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040009</CameraID>
    </Panel>
    <Panel PanelNo="10">
      <DecoderID>4402032520085</DecoderID>
      <Name>海康B20解码器10</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842762</Chanel>
      <Location Xlocation="1100" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040372</CameraID>
    </Panel>
    <Panel PanelNo="11">
      <DecoderID>4402032520086</DecoderID>
      <Name>海康B20解码器11</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842763</Chanel>
      <Location Xlocation="1220" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040414</CameraID>
    </Panel>
    <Panel PanelNo="12">
      <DecoderID>4402032520087</DecoderID>
      <Name>海康B20解码器12</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842764</Chanel>
      <Location Xlocation="1340" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040410</CameraID>
    </Panel>
    <Panel PanelNo="13">
      <DecoderID>4402032520088</DecoderID>
      <Name>海康B20解码器13</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842765</Chanel>
      <Location Xlocation="1460" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040457</CameraID>
    </Panel>
    <Panel PanelNo="14">
      <DecoderID>4402032520089</DecoderID>
      <Name>海康B20解码器14</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842766</Chanel>
      <Location Xlocation="1580" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040422</CameraID>
    </Panel>
    <Panel PanelNo="15">
      <DecoderID>4402032520090</DecoderID>
      <Name>海康B20解码器15</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842767</Chanel>
      <Location Xlocation="1700" Ylocation="20" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040022</CameraID>
    </Panel>
    <Panel PanelNo="16">
      <DecoderID>4402032520091</DecoderID>
      <Name>海康B20解码器16</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842768</Chanel>
      <Location Xlocation="20" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040108</CameraID>
    </Panel>
    <Panel PanelNo="17">
      <DecoderID>4402032520092</DecoderID>
      <Name>海康B20解码器17</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842769</Chanel>
      <Location Xlocation="140" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040109</CameraID>
    </Panel>
    <Panel PanelNo="18">
      <DecoderID>4402032520093</DecoderID>
      <Name>海康B20解码器18</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842770</Chanel>
      <Location Xlocation="260" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040114</CameraID>
    </Panel>
    <Panel PanelNo="19">
      <DecoderID>4402032520094</DecoderID>
      <Name>海康B20解码器19</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842771</Chanel>
      <Location Xlocation="380" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040115</CameraID>
    </Panel>
    <Panel PanelNo="20">
      <DecoderID>4402032520095</DecoderID>
      <Name>海康B20解码器20</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842772</Chanel>
      <Location Xlocation="500" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040121</CameraID>
    </Panel>
    <Panel PanelNo="21">
      <DecoderID>4402032520096</DecoderID>
      <Name>海康B20解码器21</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842773</Chanel>
      <Location Xlocation="620" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040119</CameraID>
    </Panel>
    <Panel PanelNo="22">
      <DecoderID>4402032520097</DecoderID>
      <Name>海康B20解码器22</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842774</Chanel>
      <Location Xlocation="740" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040065</CameraID>
    </Panel>
    <Panel PanelNo="23">
      <DecoderID>4402032520098</DecoderID>
      <Name>海康B20解码器23</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842775</Chanel>
      <Location Xlocation="860" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040068</CameraID>
    </Panel>
    <Panel PanelNo="24">
      <DecoderID>4402032520099</DecoderID>
      <Name>海康B20解码器24</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842776</Chanel>
      <Location Xlocation="980" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040018</CameraID>
    </Panel>
    <Panel PanelNo="25">
      <DecoderID>4402032520100</DecoderID>
      <Name>海康B20解码器25</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842777</Chanel>
      <Location Xlocation="1100" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040451</CameraID>
    </Panel>
    <Panel PanelNo="26">
      <DecoderID>4402032520101</DecoderID>
      <Name>海康B20解码器26</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842778</Chanel>
      <Location Xlocation="1220" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040024</CameraID>
    </Panel>
    <Panel PanelNo="27">
      <DecoderID>4402032520102</DecoderID>
      <Name>海康B20解码器27</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842779</Chanel>
      <Location Xlocation="1340" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040392</CameraID>
    </Panel>
    <Panel PanelNo="28">
      <DecoderID>4402032520103</DecoderID>
      <Name>海康B20解码器28</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842780</Chanel>
      <Location Xlocation="1460" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040010</CameraID>
    </Panel>
    <Panel PanelNo="29">
      <DecoderID>4402032520104</DecoderID>
      <Name>海康B20解码器29</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842781</Chanel>
      <Location Xlocation="1580" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040077</CameraID>
    </Panel>
    <Panel PanelNo="30">
      <DecoderID>4402032520105</DecoderID>
      <Name>海康B20解码器30</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842782</Chanel>
      <Location Xlocation="1700" Ylocation="100" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040441</CameraID>
    </Panel>
    <Panel PanelNo="31">
      <DecoderID>4402032520106</DecoderID>
      <Name>海康B20解码器31</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842783</Chanel>
      <Location Xlocation="20" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040123</CameraID>
    </Panel>
    <Panel PanelNo="32">
      <DecoderID>4402032520107</DecoderID>
      <Name>海康B20解码器32</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842784</Chanel>
      <Location Xlocation="140" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040125</CameraID>
    </Panel>
    <Panel PanelNo="33">
      <DecoderID>4402032520108</DecoderID>
      <Name>海康B20解码器33</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842785</Chanel>
      <Location Xlocation="260" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040117</CameraID>
    </Panel>
    <Panel PanelNo="34">
      <DecoderID>4402032520109</DecoderID>
      <Name>海康B20解码器34</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842786</Chanel>
      <Location Xlocation="380" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040118</CameraID>
    </Panel>
    <Panel PanelNo="35">
      <DecoderID>4402032520110</DecoderID>
      <Name>海康B20解码器35</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842787</Chanel>
      <Location Xlocation="500" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040129</CameraID>
    </Panel>
    <Panel PanelNo="36">
      <DecoderID>4402032520111</DecoderID>
      <Name>海康B20解码器36</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842788</Chanel>
      <Location Xlocation="620" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040130</CameraID>
    </Panel>
    <Panel PanelNo="37">
      <DecoderID>4402032520112</DecoderID>
      <Name>海康B20解码器37</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842789</Chanel>
      <Location Xlocation="740" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040097</CameraID>
    </Panel>
    <Panel PanelNo="38">
      <DecoderID>4402032520113</DecoderID>
      <Name>海康B20解码器38</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842790</Chanel>
      <Location Xlocation="860" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040011</CameraID>
    </Panel>
    <Panel PanelNo="39">
      <DecoderID>4402032520114</DecoderID>
      <Name>海康B20解码器39</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842791</Chanel>
      <Location Xlocation="980" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040010</CameraID>
    </Panel>
    <Panel PanelNo="40">
      <DecoderID>4402032520115</DecoderID>
      <Name>海康B20解码器40</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842792</Chanel>
      <Location Xlocation="1100" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040052</CameraID>
    </Panel>
    <Panel PanelNo="41">
      <DecoderID>4402032520116</DecoderID>
      <Name>海康B20解码器41</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842793</Chanel>
      <Location Xlocation="1220" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040034</CameraID>
    </Panel>
    <Panel PanelNo="42">
      <DecoderID>4402032520117</DecoderID>
      <Name>海康B20解码器42</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842794</Chanel>
      <Location Xlocation="1340" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040046</CameraID>
    </Panel>
    <Panel PanelNo="43">
      <DecoderID>4402032520118</DecoderID>
      <Name>海康B20解码器43</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842795</Chanel>
      <Location Xlocation="1460" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040068</CameraID>
    </Panel>
    <Panel PanelNo="44">
      <DecoderID>4402032520119</DecoderID>
      <Name>海康B20解码器44</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842796</Chanel>
      <Location Xlocation="1580" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040037</CameraID>
    </Panel>
    <Panel PanelNo="45">
      <DecoderID>4402032520120</DecoderID>
      <Name>海康B20解码器45</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842797</Chanel>
      <Location Xlocation="1700" Ylocation="180" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040064</CameraID>
    </Panel>
    <Panel PanelNo="46">
      <DecoderID>4402032520121</DecoderID>
      <Name>海康B20解码器46</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842798</Chanel>
      <Location Xlocation="20" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040126</CameraID>
    </Panel>
    <Panel PanelNo="47">
      <DecoderID>4402032520122</DecoderID>
      <Name>海康B20解码器47</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842799</Chanel>
      <Location Xlocation="140" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040127</CameraID>
    </Panel>
    <Panel PanelNo="48">
      <DecoderID>4402032520123</DecoderID>
      <Name>海康B20解码器48</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842800</Chanel>
      <Location Xlocation="260" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040134</CameraID>
    </Panel>
    <Panel PanelNo="49">
      <DecoderID>4402032520124</DecoderID>
      <Name>海康B20解码器49</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842801</Chanel>
      <Location Xlocation="380" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040136</CameraID>
    </Panel>
    <Panel PanelNo="50">
      <DecoderID>4402032520125</DecoderID>
      <Name>海康B20解码器50</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842802</Chanel>
      <Location Xlocation="500" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040131</CameraID>
    </Panel>
    <Panel PanelNo="51">
      <DecoderID>4402032520126</DecoderID>
      <Name>海康B20解码器51</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842803</Chanel>
      <Location Xlocation="620" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040133</CameraID>
    </Panel>
    <Panel PanelNo="52">
      <DecoderID>0</DecoderID>
      <Name />
      <IP />
      <CommPort>0</CommPort>
      <Chanel>0</Chanel>
      <Location Xlocation="0" Ylocation="0" />
      <Size XSize="0" YSize="0" />
      <CameraID>0</CameraID>
    </Panel>
    <Panel PanelNo="53">
      <DecoderID>0</DecoderID>
      <Name />
      <IP />
      <CommPort>0</CommPort>
      <Chanel>0</Chanel>
      <Location Xlocation="0" Ylocation="0" />
      <Size XSize="0" YSize="0" />
      <CameraID>0</CameraID>
    </Panel>
    <Panel PanelNo="54">
      <DecoderID>0</DecoderID>
      <Name />
      <IP />
      <CommPort>0</CommPort>
      <Chanel>0</Chanel>
      <Location Xlocation="0" Ylocation="0" />
      <Size XSize="0" YSize="0" />
      <CameraID>0</CameraID>
    </Panel>
    <Panel PanelNo="55">
      <DecoderID>4402032520127</DecoderID>
      <Name>海康B20解码器52</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842804</Chanel>
      <Location Xlocation="1100" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040368</CameraID>
    </Panel>
    <Panel PanelNo="56">
      <DecoderID>4402032520128</DecoderID>
      <Name>海康B20解码器53</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842805</Chanel>
      <Location Xlocation="1220" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040391</CameraID>
    </Panel>
    <Panel PanelNo="57">
      <DecoderID>4402032520129</DecoderID>
      <Name>海康B20解码器54</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842806</Chanel>
      <Location Xlocation="1340" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040093</CameraID>
    </Panel>
    <Panel PanelNo="58">
      <DecoderID>4402032520130</DecoderID>
      <Name>海康B20解码器55</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842807</Chanel>
      <Location Xlocation="1460" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402032040043</CameraID>
    </Panel>
    <Panel PanelNo="59">
      <DecoderID>4402032520131</DecoderID>
      <Name>海康B20解码器56</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842808</Chanel>
      <Location Xlocation="1580" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402057040061</CameraID>
    </Panel>
    <Panel PanelNo="60">
      <DecoderID>4402032520132</DecoderID>
      <Name>海康B20解码器57</Name>
      <IP>44.43.85.6</IP>
      <CommPort>8000</CommPort>
      <Chanel>16842809</Chanel>
      <Location Xlocation="1700" Ylocation="260" />
      <Size XSize="120" YSize="80" />
      <CameraID>4402031040078</CameraID>
    </Panel>
  </Area>
</Form>';
go

tgt_sql: (2)
select * from dbo.i2_xml008 order by plan_id;
select name,xtype,length,isnullable from sys.syscolumns where id = OBJECT_ID('i2_xml008');
select name,xtype from sys.sysobjects where parent_obj= OBJECT_ID('i2_xml008') and xtype <> 'IT' order by name;
select 索引名称=a.name ,表名=c.name ,索引字段名=d.name ,索引字段位置=d.colid  FROM  sysindexes   a JOIN   sysindexkeys   b   ON   a.id=b.id   AND   a.indid=b.indid JOIN   sysobjects   c   ON   b.id=c.id  JOIN   syscolumns   d   ON   b.id=d.id   AND   b.colid=d.colid WHERE   a.indid   NOT IN(0,255) AND   c.name='i2_xml008'  ORDER BY   c.name,a.name,d.name;
go