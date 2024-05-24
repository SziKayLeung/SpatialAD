#!/bin/bash
#SBATCH --export=ALL # export all environment variables to the batch job
#SBATCH -D . # set working directory to .
#SBATCH -p mrcq # submit to the parallel queue
#SBATCH --time=20:00:00 # maximum walltime for the job
#SBATCH -A Research_Project-MRC148213 # research project to submit under
#SBATCH --nodes=1 # specify number of nodes
#SBATCH --ntasks-per-node=16 # specify number of processors per node
#SBATCH --mail-type=END # send email at job completion
#SBATCH --mail-user=sl693@exeter.ac.uk # email address
#SBATCH --output=1_run_spaceRangerCount.o
#SBATCH --error=1_run_spaceRangerCount.e

source ./input.config

cd ${WKDIR}/2_spaceRangerCount

# fastq: path of folder containing fastq files to be analyzed
# input image
# reference 10x-compatible reference and probes
# ID and name
# processing power

spaceranger count \
    --fastqs=${demux_fastq} \
    --cytaimage=${sampleA_tif} --area=${areaSize} --slide=${slideSerialNumber} \
    --override-id \
    --transcriptome=${X10Ref} --probe-set=${inputProbeSet} \
    --id=${sampleName} --sample=${sampleID} \
    --create-bam=true &>> ${sampleName}_spaceRanger.log