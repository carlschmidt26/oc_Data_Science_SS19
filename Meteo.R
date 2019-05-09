# set working directory:
setwd("C:/Users/Carl/Desktop/Master/Data Science/")

# import ggplot2
library(ggplot2)

sales <- read.csv("./Meteolytix/OpenCampusSales.csv", sep=";", dec=",", header=TRUE)
weather <- read.csv("./Meteolytix/OpenCampusWetter.csv", sep=";", dec=",", header=TRUE)


# get an overview of values in column ttav
table(weather$ttav)

# aggregate sales$Sales by weather$nnav and compute mean, sd and len
sales_nnav <- aggregate(sales$Sales,
                        by = list(av = round(weather$ttav/5)*5), # can also categorize this
                        FUN = function(x) c(raw = list(x), mean = mean(x), sd = sd(x),  n = length(x)))

# convert the matrices into vectors                                                                                        n = length(x)))
sales_nnav <- do.call(data.frame, sales_nnav)

# rename the vectors
colnames(sales_nnav) <- c("av", "raw", "mean", "sd", "count")

ggplot(sales_nnav) +
  geom_bar( aes(x=av, y=mean), stat="identity", fill="skyblue", alpha=0.5) +
  geom_crossbar( aes(x=av, y=mean, ymin=mean-sd, ymax=mean+sd), width=0.4, colour="orange", alpha=0.9, size=1.3)
# 
# 
# # set margin of plot as c(bottom, left, top, right)
# par(mar = c(5, 6, 4, 5) + 0.1)
# 
# plotTop <- max(sales_nnav$mean + sales_nnav$sd) * 1.2
# 
# barCenters <- barplot(height = sales_nnav$mean,
#                       names.arg = sales_nnav$nnav,
#                       beside = TRUE, las = 2, # orientation perpendicular to axis
#                       ylim = c(0, plotTop),
#                       cex.names = 0.75, xaxt = "n",
#                       border = "black", axes = TRUE)
# # besides: juxtaposed bars (T), las: orientation of the tick mark labels and any other text,
# # cex.names: expansion factor for labels, xaxt: "n" suppresses plotting of the axis
# 
# text(x = barCenters, y = par("usr")[3] - .1 * (par("usr")[4] - par("usr")[3]),
#      adj = 1, labels = sales_nnav$nnav, xpd = TRUE)
# # par("usr"): giving the extremes of the user coordinates of the plotting region,
# # adj: 1 produces right-justified text, xpd: if TRUE, all plotting is clipped to the figure region
# 
# segments(barCenters, sales_nnav$mean - sales_nnav$sd, barCenters,
#          sales_nnav$mean + sales_nnav$sd, lwd = 1.5)
# # lwd: line width
# 
# arrows(barCenters, sales_nnav$mean - sales_nnav$sd, barCenters,
#        sales_nnav$mean + sales_nnav$sd, lwd = 1.5, angle = 90,
#        code = 3, length = 0.05)
# # code: If 3 a head is drawn at both ends of the arrow,
# # lenght: length of the edges of the arrow head, i.e. width/2 of head (in inches)