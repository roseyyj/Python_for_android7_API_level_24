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
patch -p0 < ../Setup.dist.patch
CONFIG_SITE=config.site ./configure --host=aarch64-linux-android --disable-ipv6 --prefix=$PWD/arm64_python CC=aarch64-linux-android-clang CFLAGS='-fPIE -fPIC' LDFLAGS='-pie' CPP=aarch64-linux-android-cpp --build=x86_64-pc-linux-gnu
#Because NDK library is lacking of nl_langinfo API, there will be a compile fail
#Python/pythonrun.c:307: undefined reference to `nl_langinfo'
#Try to hardcode it as following
# --loc_codeset = nl_langinfo(CODESET);
# ++loc_codeset = "ASCII"; 
#Install zlib
cd Modules/zlib
#zlib configure file has a bug which needs example.c and minigzip.c under the folder test. 
#just quickly solve it by making a folder and copy the file
mkdir test
cp example.c minigip.c test/
export PATH=$PATH:/usr/local/my-android-toolchain/bin 
export CC=aarch64-linux-android-clang 
export CFLAGS="-fno-strict-aliasing -fPIE -fPIC -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes"
./configure --prefix=/usr2/yijiangy/code_base/zlib --eprefix=/usr2/yijiangy/code_base/zlib
make
make install

