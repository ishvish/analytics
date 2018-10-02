#Practice Exercise

#Create a 100 row DF with the following variables
#Gender, Spl, Age, Experience, Grade, Placement
#Creating indiviual vectors
(gender = sample(c('M','F'), size=100, replace=T, prob = c(0.6,0.4)))
(spl = sample(c('Marketing', 'Finance', 'HR'), size=100, replace=T, prob = c(0.4,.3,.3)))
(grade = sample(c('A','B','C','D'), size=100, replace=T, prob= c(0.1,0.4,0.4,0.1)))
(placement = sample(c('Y','N'), size=100, replace=T, prob=c(0.5,0.5)))
(experience=floor(rnorm(100,4,1)))
(age = floor(runif(100,21,30)))

#Creating data frame sorted as per Grade

student = data.frame(gender,spl,age,experience,grade,placement)
student = student %>% arrange(grade) 

student

#Write data to a file
?write
write.csv(student, './data/PracExerc-Student.csv')

#Average experience of students with Marketing spl
student %>% group_by(spl) %>% summarise(avg=mean(experience), max(experience))

#Average experience of Male students
student %>% group_by(gender) %>% summarise(avg=mean(experience))

student %>% filter(placement=='Y') %>% group_by(spl) %>% summarise(count=n())

student %>% filter(spl!= 'Marketing' & gender=='F') %>% group_by(grade) %>% summarise(min(experience), max(experience))

#Find Students having largest experience in each spl for each gender
student %>% group_by(spl, gender) %>% summarise(max(experience))

student %>% group_by(spl,gender) %>% arrange(spl,gender,experience) %>% top_n(1, experience)

#PLOTS
hist(student$experience)
t1= table(student$placement)
barplot(t1, col=1:2)
boxplot(student$age)
pairs(student[,c('age','experience')])
pie(t1)
par(mfrow=c(2,2))
pie(table(student$gender))
pie(table(student$placement))
pie(table(student$grade))
pie(table(student$spl))

#CLUSTERING
km3 = kmeans(student[,c('age','experience')], centers = 3)
km3
km3$centers
plot(student[,c('age','experience')], col=km3$cluster)

#DECISION TREE
library(rpart)
library(rpart.plot)

tree = rpart(placement ~ ., data=student) #placement depends on all other variables
tree
rpart.plot(tree, nn=T, cex=1)
printcp(tree)
prune(tree, cp=.03)

ndata = sample_n(student, 3)
ndata
predict(tree, newdata=ndata, type='class')
predict(tree, newdata=ndata, type='prob')

#Logistic Regression - not a good logistical model
logitmodel1= glm(placement ~ ., data=student, family='binomial')
summary(logitmodel1)
logitmodel2= glm(placement ~ age, data=student, family='binomial')
summary(logitmodel2)

#Linear regression
linear1 = lm(age ~., data=student)
summary(linear1)
