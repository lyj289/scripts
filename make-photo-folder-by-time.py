#coding=utf-8
'''
根据照片文件的修改时间，按年份\月份文件夹的形式自动分类

'''


import os, time, shutil

#Get fileDate info and move file to new path
def moveFile (path) :
	if os.path.isfile(path):
		path1 = path.decode('gbk')
		statinfo = os.stat(path1)
		# print statinfo.st_mtime
		name = os.path.basename(path1)
		filedate = time.localtime(statinfo.st_mtime)

		# return [filedate.tm_year, filedate.tm_mon]
		topath =  'D:\\img\\' + str (filedate.tm_year) + '\\' + str (filedate.tm_mon) 
		if not os.path.exists(topath):
			# 根据年份、月份生成文件夹
			os.makedirs(topath)

		shutil.copy(path, topath+ '\\' + name)

count = 0
for fpathe,dirs,fs in os.walk('D:\\img\\Camera'):
  for f in fs:
  	count = count + 1
	moveFile(os.path.join(fpathe,f))

print str (count) + 'photos'


