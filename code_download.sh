wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
tar -zxvf Python-2.7.14.tgz
-->>> start from here. 
cd Python-2.7.14 
##### 
#Referring to Python documentation: https://bugs.python.org/issue3754
#There is a bug for python embedded cross compile. 
#Workaround is: set config.site
# ac_cv_file__dev_ptmx=no
# ac_cv_file__dev_ptc=no
