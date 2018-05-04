git clone https://github.com/openssl/openssl.git
cd openssl
export ANDROID_NDK=/usr2/yijiangy/code_base/ndk/android-ndk-r16b
export PATH=$PATH:/usr2/yijiangy/code_base/my-android-toolchain/bin
./Configure android-arm64 -D__ANDROID_API__=24 --openssldir=/usr/local/ssl/ --prefix=/usr/local/ssl
make depend
make -j32 all
sudo -E make install
