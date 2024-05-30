
# install Seurat 
install.packages("https://cran.r-project.org/src/contrib/Archive/reticulate/reticulate_1.4.tar.gz", repos=NULL, type="source")
install.packages("https://cran.r-project.org/src/contrib/Archive/rsvd/rsvd_1.0.3.tar.gz", repos=NULL, type="source")
install.packages("https://cran.r-project.org/src/contrib/Archive/sctransform/sctransform_0.3.1.tar.gz", repos=NULL, type="source")
install.packages("https://cran.r-project.org/src/contrib/Archive/RcppTOML/RcppTOML_0.1.3.tar.gz", repos=NULL, type="source")
install.packages("https://cran.r-project.org/src/contrib/Archive/Rnanoflann/Rnanoflann_0.0.1.tar.gz", repos=NULL, type="source")
remotes::install_version("spatstat", version = "1.64-1")
remotes::install_version("Matrix", version = "1.6-1.1")
remotes::install_version("MASS", version = "7.3-59")
install.packages("https://cran.r-project.org/src/contrib/Archive/MASS/MASS_7.3-59.tar.gz", repos=NULL, type="source")
install.packages("https://cran.r-project.org/src/contrib/Archive/matrixStats/matrixStats_1.1.0.tar.gz", repos=NULL, type="source")


devtools::install_version(package = 'Seurat', version = package_version('3.2.3'), dependencies = T)

install.packages("https://cran.r-project.org/src/contrib/Archive/devtools/devtools_2.4.4.tar.gz", repos=NULL, type="source")

# for SCTransform
# vst.flavor='v2' set. Using model with fixed slope and excluding poisson genes. `vst.flavor` is set to 'v2' but could not find glmGamPoi installed. Please install the glmGamPoi package for much faster estimation.
BiocManager::install("glmGamPoi")

