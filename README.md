# DA401 Project

A link to all data used for this project: https://drive.google.com/drive/folders/19en3KFrPTWbO6jOHRgV_bT38JTvAjWw8?usp=drive_linkad759ac32d4841f7c7af0ff73eb593771093dafb

---

**Workflow Log for Flood Risk Modeling in Sindh**

### 1. Rainfall Map

* Obtained rainfall data for the Sindh region, linked in Data folder.
* Clip to study area


### 2. Distance from River

* Calculated **Euclidean distance** from all major rivers to each latitude/longitude point across the study area.


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

1. Reclassified each input variable (rainfall, slope, elevation, drainage density, distance from river) on a **scale of 1–5**, representing increasing flood susceptibility (1: low, 5: high).
2. Applied the **Weighted Sum Tool** to combine reclassified layers using predefined variable weights.
3. Reclassified the resulting flood risk raster into **five categories (1–5)** for final interpretation (1: low, 5:high).


### 7. Preparing Rasters for Regression

1. Converted both **Flood Risk** and **Land Use** rasters to **point features**.

   * Flood risk raster produced **4,960 points**.
   * Land use raster initially contained over a million points.
2. Reduced the land use sample to **4,960 points** using **spatially proportional sampling** across Sindh.

   * Maintained proportional representation by land use category.
   * Applied a **4-meter minimum selection distance**, matching the flood risk cell size.
3. Used the **Extract Multi Values to Points** tool to join land use attributes (grid codes) with the corresponding flood risk points.

