# Michelle Tomaselli
# Biotecnology: 4th course
# Date: 17/09/18  Adv.Bioinformatics
# Bash Hands-On

# Task -> 1
ls #Verify position; to go home: cd 
mkdir bash_HandsOn #Create a new folder named "bash_HandsOn"
ls #Show the content of the file, so you can check the creation of the new folder
cd bash_HandsOn #Move you inside the folder
mkdir bin input output logs trash #Create 5 subdirectories inside the folder bash_HandsOn
ls -l  #List the long format of the contents including hidden files
cp -R trash/ trash2 #Copy the information inside the folder and "-R" the entire subtree connected
ls #Show the content of the folder
mv trash trash1 #Rename the subdirectory
ls #Show the content of the folder 
rm -rf trash2 #Remove the folder "-rf" including all the contents
ls #Show the content of the folder

# Task -> 2 
wget https://raw.githubusercontent.com/dgarrimar/teaching/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv #Dowloand the information into bash_HandsOn 
mv sample-groups.tsv input/input.tsv #Modify the name of the file and move it inside the file input
ln -s ../input/input.tsv trash1 #Create a link into another subdirectory called trash1
mv trash1/input.tsv trash1/input_symlink #Rename the link of the file just created
head trash1/input_symlink #Show the beggining of the document to check it
cp input/input.tsv trash1/input_copy #Copy the information into another place renamed
touch trash1/IAmLearningSomeBash #Create a new file
rm -rf trash1 #Remove the subdirectory with all the contents

# Task -> 3
mkdir output/task_3 #Create a new folder inside output
head -n 100 input/input.tsv > output/task_3/top100.tsv #Save the first 100 lines into a document 
less output/task_3/top100.tsv #Check if the information it is the correct
tail -n 50 input/input.tsv > output/task_3/last50.tsv #Save the last 50 lines into a document
less output/task_3/last50.tsv #Check if the information it is the correct
wc -l output/task_3/* #Show all the documents and the lines of each one, also the TOTAL 
cat output/task_3/top100.tsv output/task_3/last50.tsv > output/task_3/150together.tsv #Concatenate bought documents into new one
wc -l output/task_3/* #Check if created
head output/task_3/150together.tsv #Check the separator "tabulador"
cut -f1 output/task_3/150together.tsv > output/task_3/150column1.tsv #Save the 1 column of the file into a new file 
less output/task_3/150column1.tsv #Check the new document created
paste output/task_3/150column1.tsv output/task_3/150column1.tsv > output/task_3/150firstcX2.tsv #Paste 2 times "the column" into a new file
less output/task_3/150firstcX2.tsv #Check if was copy correctly

# Task -> 4
mkdir output/task_4 #Create a new folder inside output
cut -f2 input/input.tsv | sort -r | grep -v "Adipose\|Artery" | uniq > output/task_4/unique.tissues2.txt #Cut the 2nd column, sort reverse, delete the columns with Adipose or Artery and the duplicates ones saving into a new file 
less output/task_4/unique.tissues2.txt #Show the document to check it  
cut -f3 input/input.tsv | sort -r | grep -v "Adipose\|Artery" | uniq > output/task_4/unique.tissues3.txt  #Cut the 2nd column, sort reverse, delete the columns with Adipose or Artery and the duplicates ones saving into a new file 
less output/task_4/unique.tissues3.txt #Show the document to check it 
# diff output/task_4/unique.tissues2.txt output/task_4/unique.tissues3.txt > output/task_4/differences #Compare the files and write the differences into a new file
# Which tissues are identical in both files? - 

# Task -> 5
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz #Download the document into bash_HandsOn
gunzip scripts.tar.gz #Uncompress the file 
tar -xf scripts.tar #To extract the file usage.sh
mv usage.sh bin/ #Move the file inside the subdirectory bin
less bin/usage.sh #Show the document
nano bin/usage.sh #Add the modifications into the file, so can print the correct sentence
                  #Info to add --> echo "The script $0 has received the argument $1"
PATH="$PATH:/Users/michelletomaselli/bash_HandsOn/bin" #Give the path environment to the folder
chmod +x bin/usage.sh #Give executions permissions to the document 
./usage.sh ACTG  #Run from any position and write an argument

# Task -> 6
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv #Download the document into bash_HandsOn
join -t $'\t' <(sort -k1,1 input/input.tsv) <(sort -k1,1 ../unknown.samples.tsv) > output/joint.tsv #Join from the field 1 bought documents and create a new one, sorted as field 1
#I chose to save it into another folder to avoid complications having 2documents with the same name
less output/joint.tsv #Show the document to check it
awk '{print$4,$3,$2,$1}' output/joint.tsv | sed 's/_//g' > joint.tsv #Reverse order with whitespaces
mv joint.tsv output/joint.tsv #Now that the file is created, we can storage into the correct file "I chose output"
less output/joint.tsv #Show the document to check it

# Task -> 7
#Modify the file, add:
#if [ "$1" = "" ]; then #If the variable is empty will go inside
#  echo "The script $0 has not received any argument" #Will show you the corresponding message
#else #If the variable is full will go inside
#  counter=0 #Initialize the counter
#  while [ $counter -lt 5 ]; do #Until the counter do not arrive to 5, continue inside the loop
#      echo "The script $0 has received the argument $1" #Will show you the corresponding message
#      let counter=counter+1 #Will add one to the counter
#  done  
#fi          #End of the script

# Run the script: 
bin/usage.sh ACTA  # --> (The script bin/usage.sh has received the argument ACTA)x5
bin/usage.sh       # --> (The script bin/usage.sh has not received any argument)
