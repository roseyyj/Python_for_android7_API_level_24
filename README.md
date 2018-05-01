Step 1: Download and install android NDK           !#NDK provides toolchain to cross compile python for android device. 
  1.a Download NDK from android develop webserver: 
      https://developer.android.com/ndk/downloads/    
      wget  https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip
  1.b Unzip NDK 
      unzip android-ndk-r16b-linux-x86_64.zip 
  1.c Install stand alone cross compiler 
      cd android-ndk-r16b-linux-x86_64/build/tools
  #api level 24 is used for android 7. You should choose the right android level based on your android version.
      python make_standalone_toolchain.py --arch=arm64 --api 24 --stl=libc++ --install-dir=/usr/local/my-android-toolchain
      
 Step 2: Download python source code and cross compile by using the script:
      ./code_download.sh
      
 Step 3:  Have fun after push arm64_python to your device:
      adb root 
      adb wait-for-devices
      adb push arm64_python /data/python
      adb shell chmod 777 -R /data/python
      adb shell
      export PATH=$PATH:/data/python/bin
      python 
      Python 2.7.14 (default, Apr 30 2018, 20:12:50)
      [GCC 4.2.1 Compatible Android Clang 5.0.300080 ] on linux2
      Type "help", "copyright", "credits" or "license" for more information.
      >>>
 
 Attention: By default, only minimal modules are enabled for python compile. Please use the patch file attached to enable the modules. 
 

  
      
    
