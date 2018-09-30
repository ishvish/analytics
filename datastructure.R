# Data Structures in R

# Vectors----
x=1:10 #Create sequence of numbers from 1 to 10
x #Print

(x1=1:10) #Create and print
(x2=c(1,2,3,4,5)) #concatinate the numbers and create a vector
class(x2) #class of vector

x3 <- 1:20 # another way of creating vector

(x4=letters[1:10])
class(x4)

(x5=c('a',"Dhiraj","4")) # vector with char and strings
class(x5)

?c #HELP

(x6=c(T,FALSE,TRUE,T,F))
class(x6)

x7=c(3L,4L) #by default num -> to change to int
class(x7)

(x8 = c(1,'a', T, 4L)) #can only have one data type, if we mix they all are converted to char
class(x8)

#ACCESS ELEMENTS
(x9 = seq(0,100,by=3))
?seq

ls() #Variables in my environment

length(x9)
x9[20] #Access 20th element
x9[3]
x9[c(2,4)] #Access 2nd and 4th element
x9[-1] #Access all but 1st element
x9[-c(1:10, 15:20)]
x9[c(2.4, 3.6)] # real numbers truncated to integers
x9[-c(1,5,20)]
x9[-(length(x9)-1)] #remove 2nd last element

(x10 = c(x2,x3))

#MODIFY
sort(x10)
sort(x10, decreasing=T)
rev(x10)

seq(-3, 10, .2)
(x = -3:2) #-3 to 2 default interval 1
x[2] <- 0; x #modify second element

x[x<0] = 5; x #modify all elements that are less than 0
  
x = x[1:4]; x #Truncate x to first 4 elements

#DELETE
(x = seq(1,5,length.out = 10)) #numbers from 1 to 5 divided into 10 parts
x= NULL
x
x[4] #NULL

(x= rnorm(100))
plot(density(x))
?rnorm
?distribution()

(x1= rnorm(1000, mean=50, sd=5))
plot(density(x1))
mean(x1)
abline(v=mean(x1), h=0.04) #horizontal and vertical lines
 
# Matrices----
100:111
(m1 = matrix(1:12, nrow=4))
(m2 = matrix(1:12, ncol=3, byrow=T)) #fill the rows first in the matrix

x=101:124
length(x)
matrix(x, ncol=6)
class(m1)
attributes(m1)
dim(m1)
m1

#ACCESS ELEMENTS
m1[1,2:3] #1st row 2nd and 3rd col
m1[1,2]
m1[c(1,3),] #1st and 3rd row and all cols
m1[-2,] #Exclude 2nd row

# NAMES OF COL AND ROW
paste("C","D",sep="-")
paste("C",1:100,sep="-")

(colnames(m1) = paste('C', 1:3, sep=''))
m1
(rownames(m1) = paste('R', 1:4, sep=''))
m1
attributes(m1)

#VECTOR TO MATRIX
(m3= 1:24)
dim(m3)=c(6,4)
m3

m3[c(TRUE,F,T,F,T,T),c(2,3)]

m1;m2
m1[c('R1','R3'),c('C1','C2')]

#MODIFY
m2[m2>10]=99
m2
rbind(m2, c(50,60,70))
m2
cbind(m2, c(55,65,75,85))
cbind(m2,m2)
rbind(m2,m2)

#ROW and COL summary
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)

t(m1) #transpose - temporary
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+") #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*") #colwise
?sweep

addmargins(m1,margin=1,sum) #colwise
addmargins(m1,1,sd)
addmargins(m1,c(1,2),list(list(mean,sum,max), list(var,sd))) #both row and col wise

# Arrays----

# Data Frames----
#create Vectors to be combined into DF
(rollno = 1:30)
(sname = paste('student',1:30,sep=''))
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
(marks = floor(rnorm(30,mean= 50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks ; marks2; course

?sample
df1= data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors = F)
df1
str(df1)
head(df1) #top 6 by default
?head
head(df1,n=3)
tail(df1)
summary(df1)

df1$gender = factor (df1$gender) #convert a vector into factor
summary(df1) #shows number of M and F now

# Factors----

# Lists----

