# INIT STEP 1

# create my image from the image 
# "golang:alpine", which is an lighter 
# golang image and give the "builder" 
# id to it
FROM golang:alpine as builder

# create the directory on the image 
# to run the commands
WORKDIR /src/app

# copy the files from src folder
# to the work directory set above
COPY src .

# create the binary file using 
# from the go file using the
# command "go build"
RUN go build hello-world.go

# delete the go gile from the
# work directory
RUN rm hello-world.go

# 

# INIT STEP 2

# create an image from scratch
# which is an empty Docker image 
FROM scratch

# copy the binary file to this
# empty image root
COPY --from=builder /src/app .

# execute the binary
ENTRYPOINT [ "/hello-world" ]