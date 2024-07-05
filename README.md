This repo contains the files neccessary to generate the docker image currently available at https://hub.docker.com/r/modalaigh/sratoolkit

The image runs Ubuntu Jammy and has SRA Toolkit (3.1.1) installed

To run, follow these instructions 

Docker - run in directory with SRR file

```
docker run --rm -v $PWD:/mnt modalaigh/sratoolkit:latest
```

please make sure you create the data directory prior to running the script (with write permisisons for all users to allow docker to write), otherwise docker will create it and root will own it