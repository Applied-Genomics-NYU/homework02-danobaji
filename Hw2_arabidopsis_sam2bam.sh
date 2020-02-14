#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=sam2bam
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=dno214@nyu.edu

module load samtools/intel/1.9 

for file in ./*.sam
do 
	samtools view -bS $file > ${file::-3}bam
done

