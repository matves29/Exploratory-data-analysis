# Exploratory-data-analysis

Small repo with example files of exploratory data analysis using R and Quarto

The repository contains two example-files rendered as html.

-   A quarto of entirely random data hightlighting how quarto can be easily used to present analysis outputs in an article like format.
-   A cursory, exploratory analysis of train delay data that highlights a potential path for exploring a new dataset.

For the exploratory analysis we have created two version; the one with the suffix \_KTH uses the packages ktheme (for colors when plotting) and the kth-quarto template. While the file without a suffix uses viridis for colors.

The following R-packages need to be installed to be able to run the files:

-   ggplot2

-   matrixStats

-   plotly

-   tidyr

-   dplyr

-   kableExtra

-   stringr

-   eulerr

-   viridis

-   ktheme

For installation of the kth-quarto template please see: [KTHquarto](https://github.com/KTH-Library/kth-quarto)

To run the scripts either clone or fork the repository (or download as a zip file), and retrieve the data-files from [Zhang et al.](https://doi.org/10.6084/m9.figshare.15087882.v4) and place them in the 'data' folder.
