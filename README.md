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

Run ngsLCA before metaDMG

```
for i in $(ls *.sort.bam | awk -F "." '{print $1}')
do
echo $i
metaDMG-cpp lca -bam ${i}.sort.bam -names ~/course/data/shared/mapping/taxonomy/names.dmp -nodes ~/course/data/shared/mapping/taxonomy/nodes.dmp -acc2tax ~/course/data/shared/mapping/taxonomy/acc2taxid.map.gz -weighttype 1 -fix_ncbi 0 -out ${i}
```


Calculate the readlength of different samples and make a plot with R using package GGPLOT2
```
./read_lengths.sh
```

# Day3
## Species abundance
We used the provided scripts from the course homepage to generate these plots: 

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/c165216a-8338-4012-bdaf-7f7603576b86)

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/b7d5c94f-1d0d-4e40-b870-c76724b8fba8)

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/13e03c45-ca03-4d57-8a43-16f1c86b82c6)

We set the LR3 to be 5, since we would like to avoid the impact from non-ancient sequences, however in the end, MAP_significance of 5 could be too high.

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/8f9493cc-84a5-4f5f-9443-c4fcffe0bfcd)

## euka 
Run euka on all the trimmed fastq files and check the results
```
~/course/data/vgan/bin/vgan euka -fq1 <(zcat ~/course/wdir/day2/mapping/*.vs.fq.gz) -o all_files -t 5 --euka_dir euka_dir/
less all_files_abundance.tsv | grep yes
```
The results shows 

```
Bovidae yes     108     1
```

## PCA & f-statistics
Outgroup (polar bear) removed 

![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/5de6060c-9e03-4916-a6d1-957b4a3c25a2)

Output from f4-statistics
```
> r
# A tibble: 4 × 9
  pop1  pop2    pop3      pop4      est       se     z        p     n
  <chr> <chr>   <chr>     <chr>   <dbl>    <dbl> <dbl>    <dbl> <dbl>
1 Polar Mexican Kenai     East  0.00124 0.000575  2.15 3.15e- 2 12565
2 Polar Mexican SEAK      East  0.00139 0.000513  2.71 6.76e- 3 12566
3 Polar Mexican West      East  0.00435 0.000662  6.57 5.03e-11 12566
4 Polar Mexican Southwest East  0.00525 0.000857  6.13 8.91e-10 12566
```
![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/b963aa40-0e80-43e0-a3ec-8029c1e28cf0)

Output from f3-statistics
```
> r
# A tibble: 3 × 8
  pop1  pop2    pop3           est      se      z        p      n
  <chr> <chr>   <chr>        <dbl>   <dbl>  <dbl>    <dbl>  <dbl>
1 SEAK  Mexican Southwest  0.0681  0.00802  8.49  2.11e-17  12627
2 SEAK  East    Southwest  0.0198  0.00191 10.4   3.62e-25 174734
3 SEAK  Kenai   Southwest -0.00165 0.00212 -0.777 4.37e- 1 174659
```
![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/f6cbd0d0-1fdc-4bea-8b48-90a28675a515)

The neighbor joining tree based on Fst matrix
![image](https://github.com/GeoGenetics-edu/case-study-data-processing-documentation-team-5/assets/26409503/95f5c9d1-b5e5-40b6-bc3d-dc4834a69f45)


