# SNP-calling-pipeline-GBS-ApeKI

This pipeline takes the zipped fastq files that HudsonAlpha sequenced and calls SNPs for a set of SNPs present in the CDBN population and all parents in the CDBN pedigrees.

	0. Unzip the raw fastq files using bzip2
	1. Use cutadapt to remove all 96 barcodes from the 5' end of the read, with a 20% error rate and no insertions or deletions allowed. This step takes ~30 hours per large fastq file.
		a. QC: Look at the quality and size of various files using fastqc
	2. Use cutadapt to remove the universal Illumina adapter (plus two T's at the beginning) from the 3' end of the read, with a 10% error rate (the default).
	3. Use sickle adaptive trimming to remove windows of bases from the ends of the reads where the quality score is below 20.
		a. QC: Look at the quality and size of various files using fastqc
	4. Use bwa mem to align each fastq to the G19833 reference genome. Make a bam file and sort it for each of these alignments.
		a. QC: Look at the stats using samtools flagstat: In idev session, navigate to bwa output directory, run: for name in *.sort.bam; do samtools flagstat ${name} > ${name}.flagstat; done
	5. Add read group information for realignment using picard. 
	6. Use NGSEP to call SNPs for the entire set of varieties.
