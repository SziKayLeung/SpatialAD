# Spatial Transcriptomics - 10X Visium

**Samples**: n = 2 (BDR)  
**Method**: 10X Genomics Visium CytAssist  
**Data generated**: November 2023 (R.Bamford, A.Smith, C.Flaxman, S.Leung) Training  

## Input 
If input is raw base call (BCL) files from Illumina sequencers, first demultiplex into fastq using spaceranger mkfastq pipeline/Illumina's bcl2fastq/ BCL Convert software.

If input is fastq, data have already been demultiplexed and can proceed to run spaceranger count.


## To run on ISCA

```
module load Mamba/4.14.0-0 
mamba activate Spatial
```
