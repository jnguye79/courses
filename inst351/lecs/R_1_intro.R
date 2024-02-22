# our first line of code:
2+2

#  the "assignment operator" <-
x<-4
our_str<-"INST 314" 
y<-sqrt(x) 
y
# clicking "source" runs the entire script file. 

# assignment uses value of x at this moment. Won't update.
x<-100
y
# y is still 2. Doesn't update to 10. 




#the "combine" function
z<-c(x,y,our_str)
# parentheses take function inputs
z
z<-c(x,y,our_str,10*y,"UMD")
z

#functions can be called within functions:
log10(sqrt(100))


#class 
x=14
class(x)
x=sqrt(2)
class(x)
x="UMD"
class(x)
x=c(2,4,11)
class(x)

#for assigning, instead of <- we can also simply use =
#most programming languages use =
x=10
y=x+2
z=c(x,y,"UMD")
z
 
#vector operations:
x=c(4,25,144)
x-1
sqrt(x)


# ctrl+L to clean console
#the extraction operator:
x=c(11,22,33,44,55,66,77,88,99)
x[5]
my_indices=c(1,7,4)
x[my_indices]
y=x[my_indices]
y
new_indices=c(my_indices,9,2)
new_indices
x[new_indices]

# more on indexing:
indices=2:6
indices
x[indices]

indices=6:2
indices
x[indices]

indices=rep(c(9,8),times=3)
indices
x[indices]

indices=rep(c(9,8),each=3)
indices
x[indices]





#small point about printing simultaneously at assignment:
x=4
x
(x=17)
x
x=18;x





#let's define our own function
# it takes two inputs 
our_function=function(x1,x2=16){
  x=sqrt(x1*x2)
  y=(x1+x2)/2
  return(c(x,y))
}

our_function(4,16)
our_function(4)
our_function(x1=4,x2=16)



#have the values of x and y changed?
x
y


 

our_function=function(x1,x2=0){
   
  return(x1-3*x2)
}

our_function(3,8)
our_function(8,3)
our_function(x1=3,x2=8)
our_function(x2=8,x1=3)







#logical variables
x=9
x>1
x>=2
x>=9
x==47
x>-2
x<-2
# another motivation for not using <-
x

x=1:10
x==4
17%%5
x%%2
x%%2==0 #is it even? False: odd, True: even




x=c(11,22,33,44,55,66)
x=(1:6)*11
x
whether=c(TRUE,FALSE,FALSE,FALSE,FALSE,TRUE)
x[whether]
whether=c(TRUE,FALSE,TRUE,FALSE,TRUE,FALSE)
x[whether]
whether=c(TRUE,FALSE)
x[whether]
x=1:100
whether=c(TRUE,FALSE,FALSE)
x[whether]


#indexing is important
x=(1:9)*11
inds=seq(from=1,to=9,by=2)
x[inds] 

x=(10:42352) 
length(x)
inds=seq(from=1,to=length(x),by=13)
inds
x[inds]


midpoints=seq(from=0,to=50,by=4.5)
midpoints

midpoints=seq(from=0,to=30,by=sqrt(2))
midpoints

midpoints=seq(from=0,to=30,length.out=17)
midpoints



#sorting:
w=c(77, 12, 5, 34, 90, 9, 41, 26)
w
sort(w)
sort(w,decreasing = TRUE)
#let's inspect ?sort
y=sort(w,index.return=TRUE)
w
y
y$ix
order(w)
rank(w)



# number of occurrences of different values:
y=c(8,11,11,3,11,8,11,11)
table(y)
unique(y)
#as.numeric(table(y))
#as.data.frame(table(y))


 

y=c('a','a','b','b','b','b','c')
table(y)
as.numeric(table(y))
as.data.frame(table(y))





