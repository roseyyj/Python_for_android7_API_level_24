wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
tar -zxvf Python-2.7.14.tgz
-->>> start from here. 
cd Python-2.7.14 
##### 
#Referring to Python documentation: https://bugs.python.org/issue3754
#There is a bug for python embedded cross compile. 
#Workaround is: add config.site with following content. 
# ac_cv_file__dev_ptmx=no
# ac_cv_file__dev_ptc=no
#Before configure, need to enable the expected modules in Python2.7.14/Modules/Setup.dist.
#
CONFIG_SITE=config.site ./configure --host=aarch64-linux-android --disable-ipv6 --prefix=$PWD/arm64_python CC=aarch64-linux-android-clang CFLAGS='-fPIE -fPIC' LDFLAGS='-pie' CPP=aarch64-linux-android-cpp --build=x86_64-pc-linux-gnu
make
make install
