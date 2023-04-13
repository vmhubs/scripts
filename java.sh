#!/bin/bash
# Java environment variation Settings
# Describe the position: /etc/profile.d/java.sh 
export JAVA_HOME=/usr/java/jdk1.8.0_321
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_PATH=$JAVA_HOME/bin:$JRE_HOME/bin
