# DA401 Project

A link to all data (remote sensing) used for this project: https://drive.google.com/drive/folders/19en3KFrPTWbO6jOHRgV_bT38JTvAjWw8?usp=drive_linkad759ac32d4841f7c7af0ff73eb593771093dafb

---

**Workflow Log for Flood Risk Modeling in Sindh**

### 1. Rainfall Map

* Obtained rainfall data for the Sindh region, linked in Data folder.
* Clip to study area

### 2. Land Use and Land Cover 
* Land Use & Land Cover (LULC) was obtained from the ESRI LULC dataset, linked in data folder 
* Clip to study area
* Reproject clipped **Land Use** raster into a geographic coordinate system (WGS 84) using **Project Raster tool**


### 3. Drainage Density Map

1. Downloaded **SRTM 1 DEM** data containing slope, color relief (elevation), and aspect.
2. Converted DEM to **Fill**, removing spurious depressions.
3. Generated **Flow Direction** raster from the Fill output.
4. Created **Flow Accumulation** raster from the flow direction layer, cells with **flow accumulation > 1000** were identified as potential stream channels.
5. Converted the stream raster to **polyline** format for the study area.
6. Applied the **Line Density Tool** to compute drainage density.


### 4. Slope

* Used the **Slope Tool** on the DEM data, selecting the **percent rise** option to quantify slope steepness across the study area.


### 5. Elevation

* Obtained elevation data from **Diva-GIS spatial datasets**, clipped to study area.

### 6. Flood Risk Index

1. Reclassified each input variable (rainfall, slope, elevation, drainage density, LULC) using **Reclassify** tool on a **scale of 1–5**, representing increasing flood susceptibility (1: low, 5: high).
2. Applied the **Weighted Sum Tool** to combine reclassified layers using predetermined variable weights.
3. Reclassified the resulting flood risk raster into **five categories (1–5)** (1: low, 5:high), to create a discrete integer raster.


### 7. Preparing Rasters for Regression

1. Overlay **Flood Risk** on **District**

   * Flood risk raster produces **4,960 points** over our study area
   * Match study area to flood risk by reprojecting it to the same cell size as our flood risk raster
   * Export study area as a table (located within project repo as Study_area.dbf)
   * Run zonal statistics, assign each district the majority flood risk value 
   * Export flood risk by district as a table to perform regression (located within project repo as floodrisk_bydistrict.dbf)
   
### Data Preparation and Regression Analysis in R

**Dependencies: **

foreign: used to read ArcGIS .dbf attribute tables
dplyr: used for data manipulation and joins
readr: used for reading CSV files

Data exported from GIS: Located within **Regression Files** folder 

***Files***
The two files are able to run separately depending on need.

1. weights.R: is run to revise pairwise comparison matrices by Ouma & Tateishi, also used to receive weights for our study using eigenvector approach. Code must be run in order. 

2. regressionDA401.R: conducts regression analysis between flood risk and literacy rates. Requires data tables to be downloaded from *Regression Files** folder. Code must be run in order. 





   
   