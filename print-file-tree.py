#coding=utf-8
'''
打印当前目录文件
'''
import os
 
def GetFileList(dir, fileList):
    newDir = dir
    if os.path.isfile(dir):
    	statinfo = os.stat(dir.decode('gbk'))
    	# print dir.decode('gbk')
    	print statinfo.st_mtime
        # fileList.append(dir.decode('gbk'))
    elif os.path.isdir(dir):  
        for s in os.listdir(dir):
            #如果需要忽略某些文件夹，使用以下代码
            #if s == "xxx":
                #continue
            newDir=os.path.join(dir,s)
            GetFileList(newDir, fileList)  
    return fileList
 
list = GetFileList('D:\\img', [])
for e in list:
    print e
