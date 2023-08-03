# linux-big-files
bash script for getting value range on big files

basically, i use this code to get date ranges from big files that i cant open on my machine (and they usually also dont run on jupyter notebooks)

1- download the code
2- change the filename and column names on the first rows of the file (you can run "head -n 1 filename.csv" to get the column names)
3- open the terminal and run "chmod +x get_max_min.sh"
4- run "./get_max_min.sh"
