#!/usr/bin/python
from sys import argv #get file as arguement
from sys import exit
if __name__ == '__main__':
	#argv[1] is the filename...
	#checking if file is in order.
	if len(argv) < 3:
		print "Provide file to parse, and a csv file to create..."
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
	writeFile = open(argv[2] ,"w+")
	for i in range(0, len(lines)):
		if  "-------------------------------------------------------------------------------------------------" in lines[i] :
			writeLine = None
			i = i + 3
			writeLine = str( 100 - float(lines[i].split()[8]) ) + ","#CPU USAGE (0)
			i = i + 7
			while "USERS CONNECTED------------------------------" not in lines[i] :
				words = lines[i].split()#the query's results
				for w in words: 
					writeLine = writeLine + w + ","
				i = i + 1
			i = i + 1
			writeLine = writeLine + lines[i].split()[3]  #Number of users (last)
			writeLine = writeLine + "\n"
			print writeLine
