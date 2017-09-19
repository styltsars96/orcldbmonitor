#!/usr/bin/python
from sys import argv #get file as arguement
from sys import exit
if __name__ == '__main__':
	#argv[1] is the filename...
	#checking if file is in order.
	if len(argv) < 4:
		print "Provide file to parse, and 2 csv files to create (CPU & WAIT)..."
		exit(0)
	readFile = None
	try:
		readFile = open(argv[1], "r+")
	except IOError:
		print "No such file or directory"
		exit(0)
	lines = readFile.readlines()
	if lines[0] == None or lines[0].isspace() or not lines[0] :
		print "File is empty"
		exit(0)
	CPUwriteFile = open(argv[2], "w+")
	WAITWriteFile = open(argv[3], "w+")
	CPUwrite = ''
	for i in range(0, len(lines)):
		if  "-------------------------------------------------------------------------------------------------" in lines[i] :
			WAITwrite= ''
			i = i + 3
			CPUwrite = CPUwrite +  str( 100 - float(lines[i].split()[8]) ) + ', ' #CPU USAGE
			i = i + 7
			while "USERS CONNECTED------------------------------" not in lines[i] :
				WAITWriteFile.write(lines[i]) #DB Query results
				i = i + 1
			i = i + 1
	CPUwriteFile.write(CPUwrite)
	CPUwriteFile.close()
	WAITWriteFile.close()
