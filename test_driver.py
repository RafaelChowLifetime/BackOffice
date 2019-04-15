import pymysql
mydb=pymysql.Connect('localhost','rafael','lifetime','cliente',autocommit=True)
cursor = mydb.cursor()