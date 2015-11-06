#!/bin/bash
#This learning project is based on c.biancheng.net/cpp/shell/.
echo `date`
echo This learbning project is based on the website of c.biancheng.net/cpp/shell/.
echo Input your name:
read USERNAME
echo Thank you for reading, ${USERNAME:-Anonymous}!
