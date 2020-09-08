#!/bin/bash
#-------------------enter courseID, Assignemnt no and file path--------------------#

read -p "Enter Course ID : " courseid
read -p "Enter Assignment number(like: A1 or A2): " assgno
read -p "Enter File Path: " filepath

if [ -z "$courseid" ] || [ -z "$assgno" ] || [ -z "$filepath" ]; then
	echo "Please enter all required information!"
        exit
fi
# save the submmision destination folder
desDir="/home/$courseid/AssignmentsSubmission/$(whoami)/$assgno/"
[ ! -d "$desDir" ] && mkdir -p "$desDir"
cp $filepath $desDir
EC=$?

# make submission,  one in home dir of studen and one in submission login directory
 
echo "$(date +%c)" > /home/$(whoami)/User:$(whoami)\ FileName:$(echo $filepath | rev | cut -d/ -f1 | rev)
echo "$(date +%c)" > /home/$courseid/AssignmentsSubmission/SubmissionLogin/User:$(whoami)\ FileName:$(echo $filepath | rev | cut -d/ -f1 | rev)


