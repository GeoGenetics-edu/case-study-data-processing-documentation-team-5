# Day1

Go to the wokring directory and make a "mirror" link to the files 

```
cd ~/course/wdir/day2/mapping/
ln -s ~/course/data/day2/fastq/* .
```

and then run  the bash script with 

```
nice -19 nohup ./assignment-2.sh > log.out &
```
# Day2

Calculate the readlength of different samples and make a plot with R using package GGPLOT2
```
./read_lengths.sh
```
