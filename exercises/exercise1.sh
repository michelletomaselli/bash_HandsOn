# Michelle Tomaselli
# Biotecnology: 4th course
# Date: 02/10/18  Adv.Bioinformatics

#Exercise -> 1
cd #Goes home
cd bash_HandsOn/ #Goes inside the directory
mkdir exercises #Create a new subdirectory called exercises
cd exercises/ #Move inside the directory
nano exercise1.sh #Create a new document to write the script inside the folder exercise
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed #Download the document inside exercises
less TAIR9_mRNA.bed #Take a look inside the document to check which values are the columns
# -> To compress the file: gzip TAIR9_mRNA.bed 
# -> To read the content when it is compress: gunzip -l TAIR9_mRNA.bed
grep chr1 TAIR9_mRNA.bed | grep + |  wc -l  #Search the lines with bought characters and count it
# awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' TAIR9_mRNA.bed))) #First 10exons, removing the comma, and print the lenght of the last exon
uniq <(sort -nr <(awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' TAIR9_mRNA.bed))))) #Reorder, first the largest one "not repeated values"
grep chr1 TAIR9_mRNA.bed | cut -f 11 | tr , "\n" | sort -nr | head #Lenght of the longest exons in chr1
grep chr1 TAIR9_mRNA.bed | cut -f4,10 | sort -k2,2 -nr | head #Obtain the 10 top nº of exons and delete duplicates,
  							    #giving the names of the genes and the value of exons located in chr1
