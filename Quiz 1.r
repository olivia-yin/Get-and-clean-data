#question1 How many properties are worth $1,000,000 or more?
getwd()
setwd("E://Google Drive//2015- Data Analysis")
getwd()

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="2006_Idaho_housing.csv",mode="w",method="curl")
housing<- (`2006_Idaho_housing.csv`)
housing$VAL
length(housing$VAL[!is.na(housing$VAL) & housing$VAL==24])


#question3
#Download the Excel spreadsheet on Natural Gas Aquisition Program
if (file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file(fileUrl,destfile="E://Google Drive//2015- Data Analysis//Quiz//gas.xlsx",method="curl")
dateDownloaded <-date()

library(xlsx)

GAS <- read.xlsx("E://Google Drive//2015- Data Analysis//Quiz//gas_ori.xlsx",sheetIndex=1,header=TRUE)
rowIndex <-18:23
colIndex <-7:15
dat <- read.xlsx(file="E://Google Drive//2015- Data Analysis//Quiz//gas.xlsx" ,sheetIndex=1,colIndex=colIndex,startRow=18, endRow=23, header=TRUE)
dat

sum(dat$Zip*dat$Ext,na.rm=T) 

#question4
library(XML)
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(fileURL, ssl.verifypeer = FALSE)
doc <- xmlParse(xData)
doc
zipcode21231 <- xpathSApply(doc,"//zipcode",xmlValue)
zipcode21231
sum(zipcode21231==21231)

#question5
getwd()
setwd("E://Program Files//workdata")
if (!file.exists("workdata")){
  dir.create("workdata")
}

library(data.table)

DT <- fread(".//workdata/Idaho_housing.csv")

system.time(DT[,PWGTP15:={mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}])

system.time(tapply(DT$pwgtp15,DT$SEX,mean))

system.time(DT[,PWGTP15:={rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}])

system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
