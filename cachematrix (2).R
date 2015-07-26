## Take use of cache to let the calculation of inverse of matrix less
## repeated computations

## Create a new 'matrix' which is really a list containing a function to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse of matrix
## 4.get the value of the inverse of matrix

makeMatrix<-function(x=matrix()){
  m<-NULL 
  set<-function(y){
    x<<-y
    m<<-NULL
    }
  get<-function()x
  setinverse<-function(inverse) m<<-inverse
  getinverse<-function()m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  }

## calculates the inverse of the matrix created with the above function

cacheinverse<-function(x,...){
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
    }
  data<-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
  ## Return a matrix that is the inverse of 'x'
  }
