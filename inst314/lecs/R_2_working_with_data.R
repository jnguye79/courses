#first of all, let's set the working directory
#to be the same as the current file.
#if Run-ing, this:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#if source-ing, this: 
#setwd(getSrcDirectory()[1])

# Load packages
library(readr)
library(dplyr)

# Read in data
ourData = read_csv(file="acs2017_county_data.csv")

ourData

ourData$TotalPop
#ctrl L!

ourData$TotalPop[1:10]
head(ourData)


#how many rows and columns?
nrow(ourData)
ncol(ourData)

#let's see all column names:
glimpse(ourData)
#displays a side-ways view


ourData[1:3,1:5]
ourData[1:3,]
ourData[,1:3]
ourData[c(1,2,100,200),1:5]



#total population:
sum(ourData[,3])
#total black population:
sum(ourData[,3]*ourData[,"Black"]/100)
#note that we didn't have to find the column index of 
#"Black, we conveniently addressed it with column name
#total hispanic population:
sum(ourData[,3]*ourData[,"Hispanic"]/100)
#total Asian population:
sum(ourData[,3]*ourData[,"Asian"]/100)
#total Native population:
sum(ourData[,3]*ourData[,"Native"]/100)
#total Native population:
sum(ourData[,3]*ourData[,"Pacific"]/100)



#total women:
sum(ourData[,"Women"])
# percent women:
sum(ourData[,"Women"])/sum(ourData[,"TotalPop"])





# (1) let's find the 15 counties with smallest population.
x=ourData$TotalPop
inds=order(x)
ourData[inds[1:15],]
#ctrl L
#we could do this in one line:
ourData[order(ourData$TotalPop)[1:15],]

#Or using the pipeline approach from dplyr:
ourData %>%
  arrange(TotalPop)  

 

#let's find the 5 counties of Maryland with smallest population 
MD_inds=ourData$State=="Maryland"
D=ourData[MD_inds,]
D[order(D$TotalPop)[1:5],]

#or we could use "which" to only store the indices, 
#rather than the whole array of FALSE/TRUE values.
MD_inds=which(ourData$State=="Maryland")
D=ourData[MD_inds,]
D[order(D$TotalPop)[1:5],]



#or, instead of finding the MD_inds manually, 
#we could also use the function "subset":
D=subset(ourData,State=="Maryland")
D[order(D$TotalPop)[1:5],]



#using pipeline approach of dplyr:
ourData %>%
  filter(State=="Maryland") %>%
  arrange(TotalPop)


 

# the 5 counties with smallest population in 
# Maryland or Virginia

inds=(ourData$State=="Maryland")|(ourData$State=="Virginia")
D=ourData[inds,]
print(D[order(D$TotalPop),] ,n=Inf)

#or we could use "which":
inds=which((ourData$State=="Maryland")|(ourData$State=="Virginia"))
D=ourData[inds,]
print(D[order(D$TotalPop)[1:55],] ,n=Inf)




#using pipeline approach of dplyr:
ourData %>%
  filter(State=="Maryland" | State=="Virginia") %>%
  arrange(TotalPop) %>%
  print(n=55)









#let's sort the data in alphabetical order of state, 
#then within state sort by county population in descending order
inds=order(ourData$State,-ourData$TotalPop)
ourData[inds[1:10],]
#this is a useful feature of the order() function







#using the pipeline approach of dplyr:
ourData %>%
  group_by(State) %>%
  arrange(-TotalPop,.by_group=T) %>%
  print(n=10)



#counties with highest income per capita:
ourData[order(-ourData$IncomePerCap)[1:10],]
#how to force full display of names and all columns?
print(ourData[order(-ourData$IncomePerCap)[1:10],],width=Inf)
#how to only show state,county,incomePerCapita?
cols_show=c("State","County","IncomePerCap")
print(ourData[order(-ourData$IncomePerCap)[1:10],cols_show],width=Inf)
# we don't need the width=Inf and even the print()

#we could also use the "pipeline" approach of dplyr:
ourData %>%
  arrange(-IncomePerCap) %>%
  select(cols_show) 

#note that some funtion F(x,y,z), 
#inside a pipe of x, would be written F(y,z), 
#that is, x is implied because we are in 
#a pipe based on x





#what if all US population would pool their income?
# what would the income per capita look like?
total_income=sum(ourData[,"IncomePerCap"]*ourData[,"TotalPop"])
US_pop=sum(ourData[,"TotalPop"])
US_perCapita=total_income/US_pop
US_perCapita

#in how many counties, women outnumber men?

sum(ourData[,"Women"]>ourData[,"Men"])
sum(ourData[,"Women"]<ourData[,"Men"])

#which STATE has the highest population?
temp=aggregate(ourData$TotalPop,by=list(ourData$State),FUN=sum)
temp[order(-temp$x)[1:10],]

#pipeline approach, dplyr way:
ourData %>%
  group_by(State) %>%
  summarize(tempCol=sum(TotalPop)) %>%
  arrange(-tempCol) %>%
  print(n=15)

# "summarize" is used when we have a function
# which collapses many rows into a single row, 
#such as the sum() we had here.




#which STATE has the highest number of native population?
#now we need within-state summation of a new variable
#which is the product of two column: total state population
#times the native proportion
x1=ourData$TotalPop
x2=ourData$Native
temp=aggregate(x1*x2/100,by=list(ourData$State),FUN=sum)
temp[order(-temp$x)[1:10],]
 


#with pipe approach of dplyr:
ourData %>%
  group_by(State) %>%
  summarize(temp=sum(TotalPop*Native/100)) %>%
  arrange(-temp) %>%
  print(n=20)
#or if the operation was more complicated, 
#we could define an auxiliary column with 
#mutate() like this:
ourData %>%
  group_by(State) %>%
  mutate(temp1=TotalPop*Native/100) %>%
  summarize(temp2=sum(temp1)) %>%
  arrange(-temp2)

  


#in how many states, women outnumber men?
m=aggregate(ourData$Men,by=list(ourData$State),FUN=sum)
w=aggregate(ourData$Women,by=list(ourData$State),FUN=sum)
sum(w>m)
temp=w
temp$new_col=m[,2]
names(temp)=c("state","women","men")
temp


#with pipeline approach of dplyr:
ourData %>%
  group_by(State) %>%
  summarize_at(c("Men","Women"),sum)%>%
  arrange(Men) %>%
  summarize(sum(Women>Men))



#in how many states, blacks outnumber hispanics?
b=aggregate(ourData$TotalPop*ourData$Black/100,by=list(ourData$State),FUN=sum)
h=aggregate(ourData$TotalPop*ourData$Hispanic/100,by=list(ourData$State),FUN=sum)
sum(b>h)
temp=b
temp$new_col=h[,2]
names(temp)=c("state","black","hispanic")
temp



#with pipiline approach of dplyr:
ourData %>%
  group_by(State) %>%
  mutate(bb=TotalPop*Black/100) %>%
  mutate(hh=TotalPop*Hispanic/100) %>%
  summarize_at(c("bb","hh"),sum) %>%
  summarize(sum(bb>hh))

 

#now let's do it again:
ourData %>%
  group_by(State) %>%
  mutate(bb=TotalPop*Black/100) %>%
  mutate(hh=TotalPop*Hispanic/100) %>%
  summarize_at(c("bb","hh"),sum) %>%
  arrange(bb) %>%
  print(,n=Inf) %>%
  summarize(sum(bb>hh))


 


#in how many counties, 
#asians outnumber natives AND men outnumber women?
sum(ourData$Asian>ourData$Native)
sum(ourData$Men>ourData$Women)
sum(ourData$Men>ourData$Women & ourData$Asian>ourData$Native)


# what about states?
m=aggregate(ourData$Men,by=list(ourData$State),FUN=sum)
w=aggregate(ourData$Women,by=list(ourData$State),FUN=sum)
n=aggregate(ourData$TotalPop*ourData$Native/100,by=list(ourData$State),FUN=sum)
a=aggregate(ourData$TotalPop*ourData$Asian/100,by=list(ourData$State),FUN=sum)
z= m[,2]>w[,2] & a[,2]>n[,2]
sum(m[,2]>w[,2])
sum(a[,2]>n[,2])
temp=w
temp$c1=m[,2]
temp$c2=a[,2]
temp$c3=n[,2]
temp$c4=z
names(temp)=c("state","women","men","asian","native","criterion")
temp
sum(m>w & a>n)
#which states are they?
inds=(m>w & a>n)[,2]
temp[inds,]
 


#pipeline approach:
ourData %>%
  group_by(State) %>%
  mutate(aa=TotalPop*Asian/100) %>%
  mutate(nn=TotalPop*Native/100) %>%
  summarize_at(c("Men","Women","aa","nn"),sum) %>%
  print(,n=Inf) %>%
  summarize(sum(Men>Women & aa>nn))  


 





#-----------------------------------------

# what if we wanted to save the result into 
#a new variable

D1= ourData %>%
  mutate(aa=TotalPop*Asian/100) %>%
  mutate(nn=TotalPop*Native/100) 

#how to select specific columns?
D2= D1 %>%
  select (c(State,TotalPop,Men,Women,aa,nn,Poverty))
  
#how to delete a column?
D3= D2 %>%
  select(-Poverty)

#how to delete multiple columns?
D4= D2 %>%
  select(-c(TotalPop,Poverty))



#how to write D in a new file?
write_csv(D4,"new_output.csv")
  


 #-------------------------
#summarize can be called with other functions too. 
#for example, mean.



