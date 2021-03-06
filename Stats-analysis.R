#########################
# See Sasmito et al. for further information.
# Developed in R
# Cite:
# 
#########################



library(ggplot2)
library(dplyr)
library(ggpubr)
library(car)
library(MuMIn)
library(pastecs)
head(data)

#Generalised linear model to determine the best predictors for total ecosystem carbon stocks
#Loading the summary dataset
CStock2 <- read.csv('Variables_for_C_stocks.csv',header=TRUE, sep=",", dec=".")
CStock1 <- select(CStock2, Land_use, Typology, Eco_C, BA, TD, BD, C_content, C_density, Species_N, Soil_depth)
CStock <- na.omit(CStock1)
options(na.action = "na.fail")
model_global <-  glm(Eco_C ~ Land_use + Typology + BA + TD + BD + C_content + C_density + Species_N + Soil_depth, family = Gamma(), data = CStock)
dredge(model_global)



####### Undisturbed sites
#Loading BIOMASS CARBON STOCKS dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataBioFil <- select(dataFSPrep, Site, Typology, Bio)
dataBio <- na.omit(dataBioFil)
summary(dataBio)
View(dataBio)

###Comparison analysis for BIOMASS CARBON STOCKS toward study site and mangrove typology
shapiro.test((dataBio$Bio))                                                                       #Normality test
leveneTest((dataBio$Bio) ~ Site, data = dataBio)                                                   #Homogeniety test for site 
leveneTest((dataBio$Bio) ~ Typology, data = dataBio)                                               #Homogeniety test for typology
kruskal.test((dataBio$Bio) ~ Site, data = dataBio)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataBio$Bio, dataBio$Site, p.adjust.method = "BH", data = dataBio)             #Non-parametric multiple comparison for site
kruskal.test((dataBio$Bio) ~ Typology, data = dataBio)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataBio$Bio, dataBio$Typology, p.adjust.method = "BH", data = dataBio)         #Non-parametric multiple comparison for typology



####### Undisturbed sites
#Loading AGCMASS CARBON STOCKS dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataAGCFil <- select(dataFSPrep, Site, Typology, AGC)
dataAGC <- na.omit(dataAGCFil)
summary(dataAGC)
View(dataAGC)

###Comparison analysis for AGCMASS CARBON STOCKS toward study site and mangrove typology
shapiro.test((dataAGC$AGC))                                                                       #Normality test
leveneTest((dataAGC$AGC) ~ Site, data = dataAGC)                                                   #Homogeniety test for site 
leveneTest((dataAGC$AGC) ~ Typology, data = dataAGC)                                               #Homogeniety test for typology
kruskal.test((dataAGC$AGC) ~ Site, data = dataAGC)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataAGC$AGC, dataAGC$Site, p.adjust.method = "BH", data = dataAGC)             #Non-parametric multiple comparison for site
kruskal.test((dataAGC$AGC) ~ Typology, data = dataAGC)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataAGC$AGC, dataAGC$Typology, p.adjust.method = "BH", data = dataAGC)         #Non-parametric multiple comparison for typology



####### Undisturbed sites
#Loading BGCMASS CARBON STOCKS dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataBGCFil <- select(dataFSPrep, Site, Typology, BGC)
dataBGC <- na.omit(dataBGCFil)
summary(dataBGC)
View(dataBGC)

###Comparison analysis for BGCMASS CARBON STOCKS toward study site and mangrove typology
shapiro.test((dataBGC$BGC))                                                                       #Normality test
leveneTest((dataBGC$BGC) ~ Site, data = dataBGC)                                                   #Homogeniety test for site 
leveneTest((dataBGC$BGC) ~ Typology, data = dataBGC)                                               #Homogeniety test for typology
kruskal.test((dataBGC$BGC) ~ Site, data = dataBGC)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataBGC$BGC, dataBGC$Site, p.adjust.method = "BH", data = dataBGC)             #Non-parametric multiple comparison for site
kruskal.test((dataBGC$BGC) ~ Typology, data = dataBGC)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataBGC$BGC, dataBGC$Typology, p.adjust.method = "BH", data = dataBGC)         #Non-parametric multiple comparison for typology



####### Undisturbed sites
#Loading SoilMASS CARBON STOCKS dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataSoilFil <- select(dataFSPrep, Site, Typology, Soil)
dataSoil <- na.omit(dataSoilFil)
summary(dataSoil)
View(dataSoil)

###Comparison analysis for SoilMASS CARBON STOCKS toward study site and mangrove typology
shapiro.test((dataSoil$Soil))                                                                       #Normality test
leveneTest((dataSoil$Soil) ~ Site, data = dataSoil)                                                   #Homogeniety test for site 
leveneTest((dataSoil$Soil) ~ Typology, data = dataSoil)                                               #Homogeniety test for typology
kruskal.test((dataSoil$Soil) ~ Site, data = dataSoil)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataSoil$Soil, dataSoil$Site, p.adjust.method = "BH", data = dataSoil)             #Non-parametric multiple comparison for site
kruskal.test((dataSoil$Soil) ~ Typology, data = dataSoil)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataSoil$Soil, dataSoil$Typology, p.adjust.method = "BH", data = dataSoil)         #Non-parametric multiple comparison for typology




####### Undisturbed sites
#Loading C_stocks_100cmMASS CARBON STOCKS dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataC_stocks_100cmFil <- select(dataFSPrep, Site, Typology, C_stocks_100cm)
dataC_stocks_100cm <- na.omit(dataC_stocks_100cmFil)
summary(dataC_stocks_100cm)
View(dataC_stocks_100cm)

###Comparison analysis for C_stocks_100cmMASS CARBON STOCKS toward study site and mangrove typology
shapiro.test((dataC_stocks_100cm$C_stocks_100cm))                                                                       #Normality test
leveneTest((dataC_stocks_100cm$C_stocks_100cm) ~ Site, data = dataC_stocks_100cm)                                                   #Homogeniety test for site 
leveneTest((dataC_stocks_100cm$C_stocks_100cm) ~ Typology, data = dataC_stocks_100cm)                                               #Homogeniety test for typology
kruskal.test((dataC_stocks_100cm$C_stocks_100cm) ~ Site, data = dataC_stocks_100cm)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataC_stocks_100cm$C_stocks_100cm, dataC_stocks_100cm$Site, p.adjust.method = "BH", data = dataC_stocks_100cm)             #Non-parametric multiple comparison for site
kruskal.test((dataC_stocks_100cm$C_stocks_100cm) ~ Typology, data = dataC_stocks_100cm)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataC_stocks_100cm$C_stocks_100cm, dataC_stocks_100cm$Typology, p.adjust.method = "BH", data = dataC_stocks_100cm)         #Non-parametric multiple comparison for typology





####### Undisturbed sites
#Loading DEAD WOOD CARBON STOCKS dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataWDCFil <- select(dataFSPrep, Site, Typology, WDC)
dataWDC <- na.omit(dataWDCFil)
summary(dataWDC)
View(dataWDC)

###Comparison analysis for DEAD WOOD CARBON STOCKS toward study site and mangrove typology
shapiro.test((dataWDC$WDC))                                                                       #Normality test
leveneTest((dataWDC$WDC) ~ Site, data = dataWDC)                                                   #Homogeniety test for site 
leveneTest((dataWDC$WDC) ~ Typology, data = dataWDC)                                               #Homogeniety test for typology
kruskal.test((dataWDC$WDC) ~ Site, data = dataWDC)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataWDC$WDC, dataWDC$Site, p.adjust.method = "BH", data = dataWDC)             #Non-parametric multiple comparison for site
kruskal.test((dataWDC$WDC) ~ Typology, data = dataWDC)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataWDC$WDC, dataWDC$Typology, p.adjust.method = "BH", data = dataWDC)         #Non-parametric multiple comparison for typology



#Loading the basal area dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataBAFil <- select(dataFSPrep, Site, Typology, BA)
dataBA <- na.omit(dataBAFil)
summary(dataBA)
View(dataBA)

###Comparison analysis for BASAL AREA toward study site and mangrove typology
shapiro.test((dataBA$BA))                                                                       #Normality test
leveneTest((dataBA$BA) ~ Site, data = dataBA)                                                   #Homogeniety test for site 
leveneTest((dataBA$BA) ~ Typology, data = dataBA)                                               #Homogeniety test for typology
kruskal.test((dataBA$BA) ~ Site, data = dataBA)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataBA$BA, dataBA$Site, p.adjust.method = "BH", data = dataBA)             #Non-parametric multiple comparison for site
kruskal.test((dataBA$BA) ~ Typology, data = dataBA)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataBA$BA, dataBA$Typology, p.adjust.method = "BH", data = dataBA)         #Non-parametric multiple comparison for typology


#Loading tree density dataset
dataFSPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataTDFil <- select(dataFSPrep, Site, Typology, TD)
dataTD <- na.omit(dataTDFil)
summary(dataTD)
View(dataTD)

###Comparison analysis for TREE DENSITY toward study site and mangrove typology
shapiro.test((dataTD$TD))                                                                       #Normality test
leveneTest((dataTD$TD) ~ Site, data = dataTD)                                                   #Homogeniety test for site 
leveneTest((dataTD$TD) ~ Typology, data = dataTD)                                               #Homogeniety test for typology
kruskal.test((dataTD$TD) ~ Site, data = dataTD)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataTD$TD, dataTD$Site, p.adjust.method = "BH", data = dataTD)             #Non-parametric multiple comparison for site
kruskal.test((dataTD$TD) ~ Typology, data = dataTD)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataTD$TD, dataTD$Typology, p.adjust.method = "BH", data = dataTD)         #Non-parametric multiple comparison for typology


#Loading SOIL BULK DENSITY dataset
dataSoilPrep <- read.csv('Soil_LU.csv',header=TRUE, sep=",", dec=".")
dataSoilBDFil <- select(dataSoilPrep, Site, Typology, Land_use, Depth_range, BD)
dataUndSoilBD <- filter(dataSoilBDFil, Land_use == 'Undisturbed mangroves')                    #filtering dataset for undisturbed mangroves site
dataSoilBD <- na.omit(dataUndSoilBD)
summary(dataSoilBD)
group_by(dataSoilBD, Typology) %>% 
  summarise(
    count = n(), 
    mean = mean(BD, na.rm = TRUE),
    sd = sd(BD, na.rm = TRUE)
  )


###Comparison analysis for SOIL BULK DENSITY toward study site and mangrove typology
shapiro.test((dataSoilBD$BD))                                                                           #Normality test
leveneTest((dataSoilBD$BD) ~ Site, data = dataSoilBD)                                                   #Homogeniety test for site 
leveneTest((dataSoilBD$BD) ~ Typology, data = dataSoilBD)                                               #Homogeniety test for typology
kruskal.test((dataSoilBD$BD) ~ Site, data = dataSoilBD)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataSoilBD$BD, dataSoilBD$Site, p.adjust.method = "BH", data = dataSoilBD)         #Non-parametric multiple comparison for site
kruskal.test((dataSoilBD$BD) ~ Typology, data = dataSoilBD)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataSoilBD$BD, dataSoilBD$Typology, p.adjust.method = "BH", data = dataSoilBD)     #Non-parametric multiple comparison for typology
kruskal.test((dataSoilBD$BD) ~ Depth_range, data = dataSoilBD)                                          #Non-parametric comparison for depth
pairwise.wilcox.test(dataSoilBD$BD, dataSoilBD$Depth_range, p.adjust.method = "BH", data = dataSoilBD)  #Non-parametric multiple comparison for depth

#Loading SOIL CARBON DENSITY dataset
dataSoilPrep <- read.csv('Soil_LU.csv',header=TRUE, sep=",", dec=".")
dataSoilCDFil <- select(dataSoilPrep, Site, Typology, Land_use, Depth_range, CD)
dataUndSoilCD <- filter(dataSoilCDFil, Land_use == 'Undisturbed mangroves')                    #filtering dataset for undisturbed mangroves site
dataSoilCD <- na.omit(dataUndSoilCD)
summary(dataSoilCD)
group_by(dataSoilCD, Site) %>% 
  summarise(
    count = n(), 
    mean = mean(CD, na.rm = TRUE),
    sd = sd(CD, na.rm = TRUE)
  )

###Comparison analysis for SOIL CARBON DENSITY toward study site and mangrove typology
shapiro.test((dataSoilCD$CD))                                                                           #Normality test
leveneTest((dataSoilCD$CD) ~ Site, data = dataSoilCD)                                                   #Homogeniety test for site 
leveneTest((dataSoilCD$CD) ~ Typology, data = dataSoilCD)                                               #Homogeniety test for typology
kruskal.test((dataSoilCD$CD) ~ Site, data = dataSoilCD)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataSoilCD$CD, dataSoilCD$Site, p.adjust.method = "BH", data = dataSoilCD)         #Non-parametric multiple comparison for site
kruskal.test((dataSoilCD$CD) ~ Typology, data = dataSoilCD)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataSoilCD$CD, dataSoilCD$Typology, p.adjust.method = "BH", data = dataSoilCD)     #Non-parametric multiple comparison for typology
kruskal.test((dataSoilCD$CD) ~ Depth_range, data = dataSoilCD)                                                 #Non-parametric comparison for depth
pairwise.wilcox.test(dataSoilCD$CD, dataSoilCD$Depth_range, p.adjust.method = "BH", data = dataSoilCD)         #Non-parametric multiple comparison for depth

#Loading SOIL CARBON CONTENT dataset
dataSoilPrep <- read.csv('Soil_LU.csv',header=TRUE, sep=",", dec=".")
dataSoilCCFil <- select(dataSoilPrep, Site, Typology, Land_use, Depth_range, CC)
dataUndSoilCC <- filter(dataSoilCCFil, Land_use == 'Undisturbed mangroves')                    #filtering dataset for undisturbed mangroves site
dataSoilCC <- na.omit(dataUndSoilCC)
summary(dataSoilCC)
group_by(dataSoilCC, Typology) %>% 
  summarise(
    count = n(), 
    mean = mean(CC, na.rm = TRUE),
    sd = sd(CC, na.rm = TRUE)
  )


###Comparison analysis for SOIL CARBON CONTENT toward study site and mangrove typology
shapiro.test((dataSoilCC$CC))                                                                           #Normality test
leveneTest((dataSoilCC$CC) ~ Site, data = dataSoilCC)                                                   #Homogeniety test for site 
leveneTest((dataSoilCC$CC) ~ Typology, data = dataSoilCC)                                               #Homogeniety test for typology
kruskal.test((dataSoilCC$CC) ~ Site, data = dataSoilCC)                                                 #Non-parametric comparison for site
pairwise.wilcox.test(dataSoilCC$CC, dataSoilCC$Site, p.adjust.method = "BH", data = dataSoilCC)         #Non-parametric multiple comparison for site
kruskal.test((dataSoilCC$CC) ~ Typology, data = dataSoilCC)                                             #Non-parametric comparison for typology
pairwise.wilcox.test(dataSoilCC$CC, dataSoilCC$Typology, p.adjust.method = "BH", data = dataSoilCC)     #Non-parametric multiple comparison for typology
kruskal.test((dataSoilCC$CC) ~ Depth_range, data = dataSoilCC)                                                 #Non-parametric comparison for depth
pairwise.wilcox.test(dataSoilCC$CC, dataSoilCC$Depth_range, p.adjust.method = "BH", data = dataSoilCC)         #Non-parametric multiple comparison for depth


####### Undisturbed sites
#Loading the total ecosystem carbon stocks dataset
dataUndPrep <- read.csv('Eco_Und.csv',header=TRUE, sep=",", dec=".")
dataUndFil <- select(dataUndPrep, Site, Typology, Eco_C)
dataUnd <- na.omit(dataUndFil)
summary(dataUnd)
View(dataUnd)


###Comparison analysis for ecosystem carbon stocks toward study site and mangrove typology
shapiro.test(sqrt(dataUnd$Eco_C))                                                                         #Normality test
leveneTest(sqrt(dataUnd$Eco_C) ~ Site, data = dataUnd)                                                    #Homogeniety test for site 
leveneTest((dataUnd$Eco_C) ~ Typology, data = dataUnd)                                                    #Homogeniety test for typology
anova(aov(sqrt(dataUnd$Eco_C) ~ Site, data = dataUnd))                                                    #Parametric Analysis of Variance for Site
pairwise.t.test(sqrt(dataUnd$Eco_C), dataUnd$Site, p.adjust.method = "bonferroni", data = dataUnd)        #Multiple comparison analysis
kruskal.test((dataUnd$Eco_C) ~ Typology, data = dataUnd)                                                  #Non-parametric comparison for typology
pairwise.wilcox.test(dataUnd$Eco_C, dataUnd$Typology, p.adjust.method = "BH", data = dataUnd)             #Non-parametric multiple comparison for typology



####### Land use change affected sites
#Loading the soil dataset
dataSoil <- read.csv('Soil_LU.csv',header=TRUE, sep=",", dec=".")
dataSoilFil <- select(dataSoil, Site, Land_use, Depth_code, CStocksNormalSite)
data <- na.omit(dataSoilFil)
summary(data)

#Loading biomass dataset
dataBioPrep <-read.csv('Biomass_LU.csv',header=TRUE, sep=",", dec=".")
dataBio <- na.omit(dataBioPrep)
summary(dataBio)

#Loading dead wood dataset
dataDWPrep <-read.csv('WD_LU.csv',header=TRUE, sep=",", dec=".")
dataDW <- na.omit(dataDWPrep)
summary(dataDW)



###Comparison analysis for Biomass datasets
KaimanaBio <- filter(dataBio,Site == 'Kaimana')                    #filtering dataset for specific site location
shapiro.test(log10(KaimanaBio$Bio))                                #Normality test
leveneTest(log10(KaimanaBio$Bio) ~ Land_use, data = KaimanaBio)    #Homogeniety test
anova(aov(log10(KaimanaBio$Bio) ~ Land_use, data = KaimanaBio))    #Parametric Analysis of Variance

BintuniBio <- filter(dataBio,Site == 'Bintuni')                    #filtering dataset for specific site location
shapiro.test(sqrt(BintuniBio$Bio))                                 #Normality test
leveneTest(sqrt(BintuniBio$Bio) ~ Land_use, data = BintuniBio)     #Homogeniety test
anova(aov(sqrt(BintuniBio$Bio) ~ Land_use, data = BintuniBio))     #Parametric Analysis of Variance
pairwise.t.test(sqrt(BintuniBio$Bio), BintuniBio$Land_use, p.adjust.method = "bonferroni", data = BintuniBio)   #Multiple comparison analysis
summary(BintuniBio)


###Comparison analysis for dead wood datasets
KaimanaDW <- filter(dataDW,Site == 'Kaimana')                      #filtering dataset for specific site location
shapiro.test((KaimanaDW$WDC))                                      #Normality test
leveneTest((KaimanaDW$WDC) ~ Land_use, data = KaimanaDW)           #Homogeniety test
anova(aov((KaimanaDW$WDC) ~ Land_use, data = KaimanaDW))           #Parametric Analysis of Variance

BintuniDW <- filter(dataDW,Site == 'Bintuni')                      #filtering dataset for specific site location
shapiro.test(log(BintuniDW$WDC))                                   #Normality test
leveneTest(log(BintuniDW$WDC) ~ Land_use, data = BintuniDW)        #Homogeniety test
anova(aov(log(BintuniDW$WDC) ~ Land_use, data = BintuniDW))        #Parametric Analysis of Variance
pairwise.t.test(sqrt(BintuniDW$WDC), BintuniDW$Land_use, p.adjust.method = "bonferroni", data = BintuniDW)   #Multiple comparison analysis



###Comparison analysis for soil datasets
KaimanaDepth1 <- filter(data,Site == 'Kai' & Depth_code == -1)               #filtering dataset for specific site location
shapiro.test(log(KaimanaDepth1$CStocksNormalSite))                                   #Normality test
leveneTest(sin(KaimanaDepth1$CStocksNormalSite) ~ Land_use, data = KaimanaDepth1)    #Homogeniety test
anova(aov(log(KaimanaDepth1$CStocksNormalSite) ~ Land_use, data = KaimanaDepth1))    #Parametric Analysis of Variance
summary(KaimanaDepth1)


KaimanaDepth2 <- filter(data, Site == 'Kai' & Depth_code == -2)
shapiro.test(sin(KaimanaDepth2$CStocksNormalSite))
leveneTest(sin(KaimanaDepth2$CStocksNormalSite) ~ Land_use, data = KaimanaDepth2)
anova(aov(log(KaimanaDepth2$CStocksNormalSite) ~ Land_use, data = KaimanaDepth2))
summary(KaimanaDepth2)


KaimanaDepth3 <- filter(data, Site == 'Kai' & Depth_code == -3)
shapiro.test(log10(KaimanaDepth3$CStocksNormalSite))
leveneTest(log10(KaimanaDepth3$CStocksNormalSite) ~ Land_use, data = KaimanaDepth3)
anova(aov(log10(KaimanaDepth3$CStocksNormalSite) ~ Land_use, data = KaimanaDepth3))
summary(KaimanaDepth3)

KaimanaDepth4 <- filter(data, Site == 'Kai' & Depth_code == -4)
shapiro.test(log10(KaimanaDepth4$CStocksNormalSite))
leveneTest(log10(KaimanaDepth4$CStocksNormalSite) ~ Land_use, data = KaimanaDepth4)
anova(aov(log10(KaimanaDepth4$CStocksNormalSite) ~ Land_use, data = KaimanaDepth4))

BintuniDepth1 <- filter(data, Site == 'Bin' & Depth_code == -1)
shapiro.test(log10(BintuniDepth1$CStocksNormalSite))
leveneTest(log10(BintuniDepth1$CStocksNormalSite) ~ Land_use, data = BintuniDepth1)
anova(aov(log10(BintuniDepth1$CStocksNormalSite) ~ Land_use, data = BintuniDepth1))
pairwise.t.test(log10(BintuniDepth1$CStocksNormalSite), BintuniDepth1$Land_use, p.adjust.method = "bonferroni", data = BintuniDepth1)   #Multiple comparison analysis
summary(BintuniDepth1)

BintuniDepth2 <- filter(data, Site == 'Bin' & Depth_code == -2)
shapiro.test(sqrt(BintuniDepth2$CStocksNormalSite))
leveneTest(sqrt(BintuniDepth2$CStocksNormalSite) ~ Land_use, data = BintuniDepth2)
anova(aov(sqrt(BintuniDepth2$CStocksNormalSite) ~ Land_use, data = BintuniDepth2))
pairwise.t.test(sqrt(BintuniDepth2$CStocksNormalSite), BintuniDepth2$Land_use, p.adjust.method = "bonferroni", data = BintuniDepth2)

BintuniDepth3 <- filter(data, Site == 'Bin' & Depth_code == -3)
shapiro.test(sqrt(BintuniDepth3$CStocksNormalSite))
leveneTest(sqrt(BintuniDepth3$CStocksNormalSite) ~ Land_use, data = BintuniDepth3)
anova(aov(sqrt(BintuniDepth3$CStocksNormalSite) ~ Land_use, data = BintuniDepth3))
pairwise.t.test(sqrt(BintuniDepth3$CStocksNormalSite), BintuniDepth3$Land_use, p.adjust.method = "bonferroni", data = BintuniDepth3)

BintuniDepth4 <- filter(data, Site == 'Bin' & Depth_code == -4)
shapiro.test(log10(BintuniDepth4$CStocksNormalSite))
leveneTest(log10(BintuniDepth4$CStocksNormalSite) ~ Land_use, data = BintuniDepth4)
anova(aov(log10(BintuniDepth4$CStocksNormalSite) ~ Land_use, data = BintuniDepth4))
pairwise.t.test(log10(BintuniDepth4$CStocksNormalSite), BintuniDepth4$Land_use, p.adjust.method = "bonferroni", data = BintuniDepth4)

BintuniDepth5 <- filter(data, Site == 'Bin' & Depth_code == -5)
shapiro.test((BintuniDepth5$CStocksNormalSite)) #non normally distributed
leveneTest((BintuniDepth5$CStocksNormalSite) ~ Land_use, data = BintuniDepth5)
anova(aov(log10(BintuniDepth5$CStocksNormalSite) ~ Land_use, data = BintuniDepth5))
pairwise.t.test((BintuniDepth5$CStocksNormalSite), BintuniDepth5$Land_use, p.adjust.method = "bonferroni", data = BintuniDepth5)


BintuniDepth6 <- filter(data, Site == 'Bin' & Depth_code == -6)
shapiro.test(log10(BintuniDepth6$CStocksNormalSite))
leveneTest(log10(BintuniDepth6$CStocksNormalSite) ~ Land_use, data = BintuniDepth6)
anova(aov(log10(BintuniDepth6$CStocksNormalSite) ~ Land_use, data = BintuniDepth6))
pairwise.t.test(log10(BintuniDepth6$CStocksNormalSite), BintuniDepth6$Land_use, p.adjust.method = "bonferroni", data = BintuniDepth6)

