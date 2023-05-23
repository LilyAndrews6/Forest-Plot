#Random effects model and freeman-tukey double arcsine transformation
install.packages("meta")
library("meta")
#Read in data
wadata <- read.table("data.txt, header=T)

#Normal model - for a standard forest plot
w <- metaprop(wadata$`V600 mutation prevalence`, wadata$`Total sample size (n)`, wadata$Author, #Change this line to your variables
         data = NULL, subset = NULL,
         sm="PFT", #PFT function is the freeman-tukey double arcsine transformation
         incr=0.5, allincr=FALSE, addincr=FALSE,
         level = 0.95,
         comb.fixed=FALSE, comb.random=TRUE, #comb.random=TRUE selects the random effect model
         title="", complab="", outclab="",
         print.byvar=TRUE,
         warn=TRUE)

#Model by variable - to create a forest plot into different variables
w <- metaprop(wadata$`V600 mutation prevalence`, wadata$`Total sample size (n)`, wadata$Author, #Change this line to your variables
              data = NULL, subset = NULL,
              sm="PFT", byvar=wadata$`Glioma Entity`, #PFT function is the freeman-tukey double arcsine transformation and byvar function seperates by variable
              incr=0.5, allincr=FALSE, addincr=FALSE,
              level = 0.95,
              comb.fixed=FALSE, comb.random=TRUE, #comb.random=TRUE selects the random effect model
              title="", complab="", outclab="",
              print.byvar=TRUE,
              warn=TRUE)

#Create forest plot and adjust to what you would like 
png(file='subtype_plot.png', width=800, height=15000) #These can be adjusted accordingly, this setting is to download a large plot
forest(w,
       rightlabs = c("g","95% CI","weight"), 
       leftlabs = c("Author"), #Change labels accordingly
       lab.e = "Intervention",
       pooled.totals = FALSE,
       smlab = "BRAF V600 prevalence", 
       text.random = "Overall effect",
       print.tau2 = FALSE,
       col.diamond = "red",
       col.diamond.lines = "black",
       col.predict = "black",
       print.I2.ci = TRUE,
       digits.sd = 2
)
dev.off()
#This will produce a forest plot in a png file ready to analyse
              
