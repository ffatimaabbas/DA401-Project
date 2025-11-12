#install.packages("foreign") 
library(foreign) 
table1 <-read.dbf("land_use.dbf", as.is = FALSE)
table2 <- read.dbf("flood_risk.dbf", as.is = FALSE)
head(table1)
head(table2)
table1$pointid <- 1:nrow(table1)

library(dplyr)

floodrisk_landuse <- inner_join(table1, table2, by = "pointid")
floodrisk_landuse_renamed <- data.frame(
  Sindh_Land = c(1,2,4,5,7,8,9,10,11),
  land_use_type = c("water", "trees", "flooded vegetation", "crops","built area", "bareland","cloud cover", "snow/ice", "rangeland")
)
floodrisk_landuse_merged <- inner_join(floodrisk_landuse, floodrisk_landuse_renamed, by = "Sindh_Land")
boxplot(grid_code ~ land_use_type, data = floodrisk_landuse_merged,
        xlab = "Land Use Class",
        ylab = "Flood Risk Class",
        main = "Flood Risk by Land Use Class",
        col = "lightblue")

lm_model <- lm(grid_code ~ land_use_type, data = floodrisk_landuse_merged)
summary(lm_model)
