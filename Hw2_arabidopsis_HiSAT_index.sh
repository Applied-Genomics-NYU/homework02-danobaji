#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=HiSAT2_align
#SBATCH --output=hisat2_align_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu


module load hisat2/intel/2.0.5

hisat2-build ./*.fa arabidopsis_hisat_index

for read in ./*_1.fastq
do
	hisat2 -p 8 -x arabidopsis_hisat_index -1 $read -2 ${read::-7}2.fastq -S ${read::-7}arabidopsis_HiSAT.sam
done
