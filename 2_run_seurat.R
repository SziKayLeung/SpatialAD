# https://github.com/milliesander/Spatial-transcriptomics-Chapter2
library(Seurat)
library(ggplot2)
library(patchwork)
library(dplyr)

imageSampleA <- Read10X_Image(image.dir="/lustre/projects/Research_Project-MRC190311/longReadSeq/ONTRNA/Project_11142_spatial_SKL/2_spaceRangerCount/SampleA/outs/spatial/", 
                              image.name = "tissue_lowres_image.png",
                              filter.matrix = TRUE,)

sampleA <- Load10X_Spatial(
  "/lustre/projects/Research_Project-MRC190311/longReadSeq/ONTRNA/Project_11142_spatial_SKL/2_spaceRangerCount/SampleA/outs/",
  filename = "filtered_feature_bc_matrix.h5",
  assay = "Spatial",
  slice = "imageSampleA",
  filter.matrix = TRUE,
  to.upper = FALSE,
  image = imageSampleA
)


plot1 <- VlnPlot(sampleA, features = "nCount_Spatial", pt.size = 0.1) + NoLegend()
plot2 <- SpatialFeaturePlot(sampleA, features = "nFeature_Spatial", image.alpha = 0.2) + theme(legend.position = "right")
wrap_plots(plot1, plot2)

sampleATransformed <- SCTransform(sampleA, assay = "Spatial", verbose = TRUE)
SpatialFeaturePlot(sampleATransformed, features = "nFeature_Spatial", image.alpha = 0.2) + theme(legend.position = "right")
SpatialFeaturePlot(sampleATransformed, features = c("HPCA"), image.alpha = 0.2)

sampleATransformed <- RunPCA(sampleATransformed, assay = "SCT", verbose = FALSE)
sampleATransformed <- FindNeighbors(sampleATransformed, reduction = "pca", dims = 1:30)
sampleATransformed <- FindClusters(sampleATransformed, verbose = FALSE)
sampleATransformed <- RunUMAP(sampleATransformed, reduction = "pca", dims = 1:30)

load(file = "/lustre/projects/Research_Project-MRC190311/longReadSeq/ONTRNA/Project_11142_spatial_SKL/3_seurat/sampleA.RData")
DimPlot(sampleATransformed, reduction = "umap", label = TRUE)



### testing data
library(SeuratData)
library(Seurat)
#InstallData("stxBrain")
brain <- LoadData("stxBrain", type = "anterior1")
SpatialFeaturePlot(brain, features = "nCount_Spatial") + theme(legend.position = "right")
brain <- SCTransform(brain, assay = "Spatial", verbose = FALSE)
SpatialFeaturePlot(brain, features = c("Ttr")) + theme(legend.text = element_text(size = 0),
                                                       legend.title = element_text(size = 20), legend.key.size = unit(1, "cm"))
SpatialDimPlot(brain, interactive = TRUE)   


brain <- RunPCA(brain, assay = "SCT", verbose = FALSE)
brain <- FindNeighbors(brain, reduction = "pca", dims = 1:30)
brain <- FindClusters(brain, verbose = FALSE)
brain <- RunUMAP(brain, reduction = "pca", dims = 1:30)
