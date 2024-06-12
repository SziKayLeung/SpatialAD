#!/bin/bash
#SBATCH --export=ALL # export all environment variables to the batch job
#SBATCH -D . # set working directory to .
#SBATCH -p mrcq # submit to the parallel queue
#SBATCH --time=10:00:00 # maximum walltime for the job
#SBATCH -A Research_Project-MRC148213 # research project to submit under
#SBATCH --nodes=1 # specify number of nodes
#SBATCH --ntasks-per-node=16 # specify number of processors per node
#SBATCH --mail-type=END # send email at job completion
#SBATCH --mail-user=sl693@exeter.ac.uk # email address
#SBATCH --output=1c_run_spaceRangerCount.o
#SBATCH --error=1c_run_spaceRangerCount.e

# 6 hours to run
# 10.06.2024: input of brightfield tif; note still using override-id 
# use loupebrower alignment with all spots

source ./input.config

cd ${WKDIR}/2_spaceRangerCount

# fastq: path of folder containing fastq files to be analyzed
# input image
# reference 10x-compatible reference and probes
# ID and name
# processing power

sampleID=11142_1059
sampleName=SampleB

spaceranger count \
--fastqs=${demux_fastq} \
--cytaimage=${sampleB_tif} --area=${areaSize} --slide=${slideSerialNumber} --loupe-alignment=${sampleB_allSpots_loupe} \
--transcriptome=${X10Ref} --probe-set=${inputProbeSet} \
--id=${sampleName} --sample=${sampleID} --use-all-spots \
--create-bam=true &>> ${sampleName}_spaceRanger.log