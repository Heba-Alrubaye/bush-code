#!/bin/bash
#
#
#-------------------distribute Makring files to Tutors--------------------#
#
# 
cd /home/CYBR371/AssignmentsSubmission/SubmissionLogin/&&ls > /home/result/totalSub.txt
cd /home/result

# Divide no. of submission into  3 tutors
Tutors=3
split -da 2 -n r/$Tutors totalSub.txt finalmarking --additional-suffix=".txt"

# assign marking to each tutor
count=0
for tutor in $(members tutors)
 
do
	echo -e "\nAllocated marking for $tutor:\n$(cat finalmarking0$count.txt)"
	echo -e "\n\n"
	count=$((count+1))
done


