@ECHO OFF
SET PATH=%PATH%;%JAVA_HOME%\bin
START /B C:\sheret\sheret.exe -p 80 -d C:\sheret\htdocs -f C:\sheret\sheret.log 
CD C:\jetrix-0.2.3\
C:\jetrix-0.2.3\jetrix.bat