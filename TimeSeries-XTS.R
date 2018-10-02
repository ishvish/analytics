# xts  - create object and export data

#create matrix : 1 col for 1 share
(stockprices = matrix(c(100,103, 105, 205, 210, 207, 530, 500, 535), ncol=3, byrow = F))
(cdtindex = c('25-09-2018', '27-09-2018', '28-09-2018'))
#convert to date format
(dtindex = as.Date(cdtindex, format="%d-%m-%Y"))
#now we have index + matrix for xts object

(ts_xts = xts(x=stockprices, order.by=dtindex))
#this series is not continuous but has missing dates

#-----
#matrix data extract
coredata(ts_xts)
#extract dates
index(ts_xts)


#write to csv file
write.zoo(ts_xts, "./data/zoodata.csv")

(stockprices1 = matrix(rnorm(90,30,10), ncol = 3, byrow=F))
?seq
(dtindex1 = seq(as.Date("2018-09-01"), length=30, by = "days"))
(ts_xts1 = xts(x=stockprices1, order.by = dtindex1))
colnames(ts_xts1) = c("SBI", "ICICI", "HDFC")
ts_xts1
#matrix data extract
coredata(ts_xts1)
#extract dates
index(ts_xts1)
