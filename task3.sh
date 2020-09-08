
#!/bin/bash
#------------------Create new users-------------------#
useradd -m -d /home/masood/ -s /bin/bash masood
useradd -m -d /home/ian/ -s /bin/bash ian
useradd -m -d /home/harith/ -s /bin/bash harith
useradd -m -d /home/caud/ -s /bin/bash caud
useradd -m -d /home/hos/ -s /bin/bash hos
useradd -m -d /home/junaid/ -s /bin/bash junaid
useradd -m -d /home/abbasi/ -s /bin/bash abbasi
useradd -m -d /home/mohammed/ -s /bin/bash mohammed


# Add new users in batch from newuserlist.txt

for i in $(cat ./StudentList.txt)
do
        
	useradd -m -d /home/$i/ -s /bin/bash $i
done
#------------------Create groups and add users to groups--------------------# 
for eachGroup in students tutors lecturers
do
	if [ ! $(grep $eachGroup /etc/group) ]; then
		groupadd ${eachGroup}
	fi
done

for lect in masood ian harith caud hos
do
       	usermod -a -G lecturers ${lect}
done

for tut in junaid abbasi mohammed
do
       	usermod -a -G tutors ${tut}
done
for stud in $(cat StudentList.txt)
do
    usermod -a -G students ${stud}
done

#-------------------Create Directories--------------------# 
mkdir -p CYBR371/{MarkingFile,Assignments,AssignmentsSubmission/SubmissionLogin,Exam,ExamMarking,StudentsMarks,LectureNotes}

#-------------------Create info.txt file ------------------#
echo "Course Coordinator: Masood" > /home/CYBR371/info.txt
echo "Tutors: Junaid, Abbasi, Mohammed" >> /home/CYBR371/info.txt

#Create dirctory for each student under subdirectory
for student in $(members students)
do
	if [ ! -d /home/CYBR371/AssignmentsSubmission/$student ]; then
		mkdir /home/CYBR371/AssignmentsSubmission/$student
	fi

	if [ ! -d /home/CYBR371/ExamMarking/$student ]; then
		mkdir /home/CYBR371/ExamMarking/$student
	fi

	if [ ! -d /home/CYBR371/StudentsMarks/$student ]; then
		mkdir /home/CYBR371/StudentsMarks/$student
	fi

	if [ ! -d /home/CYBR371/MarkingFile/$student ]; then
		mkdir /home/CYBR371/MarkingFile/$student
	fi
done
#-------------------Set ACL for LectureNotes-------------------#
setfacl -Rm u:masood:rwx /home/CYBR371/LectureNotes
setfacl -dm u:masood:rw /home/CYBR371/LectureNotes

#-------------------Set ACL for Assignments-------------------# 
setfacl -Rm u:masood:rwx /home/CYBR371/Assignments
setfacl -dm u:masood:rw /home/CYBR371/Assignments
setfacl -dm g:lecturers:rx /home/CYBR371/Assignments/
setfacl -dm g:students:rx /home/CYBR371/Assignments/
setfacl -dm g:tutors:rx /home/CYBR371/Assignments/
setfacl -dm o::--- /home/CYBR371/Assignments

#-------------------Set ACL for Exam-------------------# 
setfacl -Rm u:masood:rwx /home/CYBR371/Exam/
setfacl -dm u:masood:rwx /home/CYBR371/Exam/
setfacl -Rm u:caud:rx /home/CYBR371/Exam/
setfacl -dm u:caud:r /home/CYBR371/Exam
setfacl -Rm u:hos:rx /home/CYBR371/Exam/
setfacl -dm u:hos:r /home/CYBR371/Exam
setfacl -Rm u:ian:rx /home/CYBR371/Exam/
setfacl -dm u:ian:r /home/CYBR371/Exam
setfacl -Rm u:harith:rx /home/CYBR371/Exam/
setfacl -dm u:harith:r /home/CYBR371/Exam
setfacl -Rm o::--- /home/CYBR371/Exam/
setfacl -dm o::--- /home/CYBR371/Exam/

#-------------------Set ACL for ExamMarking-------------------# 
setfacl -Rm u:masood:rwx,d:u:masood:rwx /home/CYBR371/ExamMarking
setfacl -dm u:masood:rw /home/CYBR371/ExamMarking
setfacl -dm u:caud:rx /home/CYBR371/ExamMarking
setfacl -dm u:hos:rx /home/CYBR371/ExamMarking
setfacl -dm u:ian:rx /home/CYBR371/ExamMarking
setfacl -dm u:harith:rx /home/CYBR371/ExamMarking
setfacl -dm o::--- /home/CYBR371/ExamMarking/

#-------------------Set ACL for AssignmentsSubmission--------------------# 
 for Stud in $(members students)
do
	setfacl -Rm u:"$Stud":rwx,d:u:"$Stud":rwx /home/CYBR371/AssignmentsSubmission/$Stud
	setfacl -dm u:"$Stud":rw /home/CYBR371/AssignmentsSubmission/$Stud
done
setfacl -Rm o::--x,d:o::--x /home/CYBR371/AssignmentsSubmission/
setfacl -dm o::--- /home/CYBR371/AssignmentsSubmission/
setfacl -Rm g:lecturers:rx,d:g:lecturers:rx /home/CYBR371/AssignmentsSubmission
setfacl -dm g:lecturers:r /home/CYBR371/AssignmentsSubmission
setfacl -Rm g:tutors:rx,d:g:tutors:rx /home/CYBR371/AssignmentsSubmission
setfacl -dm g:tutors:r /home/CYBR371/AssignmentsSubmission
setfacl -Rm g:students:wx,d:g:students:wx /home/CYBR371/AssignmentsSubmission/SubmissionLogin
setfacl -dm g:students:w /home/CYBR371/AssignmentsSubmission/SubmissionLogin
#ACL permission for SubmissionLogin
setfacl -Rm g:students:wx,d:g:students:wx /home/CYBR371/AssignmentsSubmission/SubmissionLogin
setfacl -dm g:students:w /home/CYBR371/AssignmentsSubmission/SubmissionLogin

#-------------------Set ACL for MarkingFile-------------------# 
 for Stud in $(members students)
do
	setfacl -Rm u:"$Stud":rx,d:u:"$Stud":rx /home/CYBR371/MarkingFile/$Stud
	setfacl -dm u:"$Stud":r /home/CYBR371/MarkingFile/$Stud
done
setfacl -Rm o::--x,d:o::--x /home/CYBR371/MarkingFile/
setfacl -dm o::--- /home/CYBR371/MarkingFile/
setfacl -Rm g:tutors:rwx,d:g:tutors:rwx /home/CYBR371/MarkingFile
setfacl -dm g:tutors:rw /home/CYBR371/MarkingFile
setfacl -Rm g:lecturers:rx,d:g:lecturers:rx /home/CYBR371/MarkingFile
setfacl -dm g:lecturers:r /home/CYBR371/MarkingFile

#-------------------Set ACL for StudentsMarks-------------------# 
 for Stud in $(members students)
do
	setfacl -Rm u:"$Stud":rx,d:u:"$Stud":rx /home/CYBR371/StudentsMarks/$Stud
	setfacl -dm u:"$Stud":r /home/CYBR371/StudentsMarks/$Stud
done
setfacl -Rm o::--x,d:o::--x /home/CYBR371/StudentsMarks/
setfacl -dm o::--- /home/CYBR371/StudentsMarks/
setfacl -Rm g:lecturers:rx,d:g:lecturers:rx /home/CYBR371/StudentsMarks
setfacl -dm g:lecturers:r /home/CYBR371/StudentsMarks


for eachStud in $(members students)
do
	touch /home/CYBR371/MarkingFile/$eachStud/$eachStud"Mark.txt"
	chown junaid /home/CYBR371/MarkingFile/$eachStud/$eachStud"Mark.txt" 
	cp /home/CYBR371/MarkingFile/$eachStud/$eachStud"Mark.txt" /home/CYBR371/StudentsMarks/$eachStud/
done

