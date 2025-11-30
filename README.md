# DA401 Project

A link to all data used for this project: https://drive.google.com/drive/folders/19en3KFrPTWbO6jOHRgV_bT38JTvAjWw8?usp=drive_linkad759ac32d4841f7c7af0ff73eb593771093dafb

---

**Workflow Log for Flood Risk Modeling in Sindh**

### 1. Rainfall Map

* Obtained rainfall data for the Sindh region, linked in Data folder.
* Clip to study area

### 2. Land Use and Land Cover 
* Land Use & Land Cover (LULC) was obtained from the ESRI LULC dataset, linked in data folder 
* Clip to study area


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

1. Reclassified each input variable (rainfall, slope, elevation, drainage density, LULC) on a **scale of 1–5**, representing increasing flood susceptibility (1: low, 5: high).
2. Applied the **Weighted Sum Tool** to combine reclassified layers using predefined variable weights.
3. Reclassified the resulting flood risk raster into **five categories (1–5)** for final interpretation (1: low, 5:high).


### 7. Preparing Rasters for Regression

1. Overlay **Flood Risk** on **District**

   * Flood risk raster produces **4,960 points** over our study area
   * Convert study area to a raster with the same cell size as our flood risk raster, with the same extent  
   * Run zonal statistics, assign each district the majority flood risk value 
   * Export flood risk by district as a table to perform regression