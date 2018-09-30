grade = sample(c('A','B','C','D'),size=30,replace = T, prob=c(.4,.2,.3,.1))
grade
summary(grade)
gradeF = factor(grade)
summary(gradeF)
table(gradeF)
class(gradeF)
gradeFO = factor(grade, ordered=T) #ORDERED FACTOR
summary(gradeFO)
gradeFO1 = factor(grade, ordered=T, levels = c('B','C','A','D')) #ORDERED FACTOR WITH ORDERING DEFINED
summary(gradeFO1)

(marks = ceiling(rnorm(30, mean=60, sd=5)))
(gender = factor(sample(c('M', 'F'), size=30, replace=T)))
(student1 = data.frame(marks, gender, gradeFO1))
boxplot(marks ~ gradeFO1, data=student1) #create a boxplot - distribution of data between various grades
boxplot(marks ~ gradeFO1 + gender, data=student1) 
summary(marks)
abline(h=summary(marks))
