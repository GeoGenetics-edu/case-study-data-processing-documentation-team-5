
for file in fastq/*.fq.gz; do

# remove duplicates, require >=30 bp read length
vsearch --fastx_uniques $file --fastqout $(basename $file).vs.fq --minseqlength 30 --strand both

# save disk space
gzip $(basename $file).vs.fq

#map, only output aligned reads, use 5 threads, compress the output file, output up to 100 alignments
bowtie2 --threads 5 -k 100 -x ~/course/data/shared/mapping/db/aegenomics.db -U $(basename $file).vs.fq.gz --no-unal \
| samtools view -bS - > $(basename $file).bam

done