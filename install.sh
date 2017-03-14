#!/bin/bash

while [ $UserNameAnswer != "y" ];
do
  read -p "What is your username? :" UserName
  echo "User name is : ${UserName}"
  read -p "Is this correct? (y/n) : " UserNameAnswer
done

