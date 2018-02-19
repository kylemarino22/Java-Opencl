#!/bin/bash

javac Helloworld.java
javah -jni HelloWorld
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
gcc -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/darwin/"  -o HelloWorld.o -shared HelloWorld.cpp -framework OpenCL
gcc -dynamiclib -o libhelloworld.jnilib HelloWorld.o
java HelloWorld


