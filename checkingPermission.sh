#!/usr/bin/zsh

#This will loop through CYBR371 folder and check permission for each object

for eachObject in $(ls /home/CYBR371)
do
	case $eachObject in
		Assignments)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	
		;;
		AssignmentsSubmission)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	
		
		;;

		Exam)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	

		;;
		ExamMarking)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	

		;;
		LectureNotes)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	

		;;
		MarkingFile)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	

		;;
		StudentsMarks)
		getfacl -p /home/CYBR371/$eachObject | sed '1d' > /tmp/tmpPer.txt
		if [ ! $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt)) ];then
			echo -e "'$eachObject' Permission Correct!\n"
		else
			echo -e "Permission Incorrect!"
			echo -e "Check permission at: $(comm -13 <(sort -u /home/Monitor/$eachObject) <(sort -u /tmp/tmpPer.txt))"
		fi	

		;;
	esac
done
