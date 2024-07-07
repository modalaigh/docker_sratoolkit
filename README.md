### Introduction
This repo contains the files neccessary to build the docker image currently available at https://hub.docker.com/r/modalaigh/sratoolkit

The image runs Ubuntu Jammy and has SRA Toolkit (3.1.1) installed. It downloads SRA files listed in a file called `SRR_Acc_List.txt` by automatically running the following `sra_download.sh` bash script on start-up:

```bash
#! /bin/bash

while IFS= read -r accession; do
  fasterq-dump "${accession}" --split-files --outdir /mnt/data/
done < /mnt/SRR_Acc_List.txt
```

To build the docker image locally (instead of downloading it from dockerhub), follow these instructions:

```
git clone https://github.com/modalaigh/docker_sratoolkit.git
cd docker_sratoolkit/
docker build -t modalaigh/sratoolkit:latest .
```

### Set up

Before running the container, please make sure that the current directory has an empty folder named `data/

```
mkdir data
```

Your directory should also contain a file callsd `SRR_Acc_List.txt` with each SRA accession that you wish to download on a new line like so:

```
<SRR_1>
<SRR_2>
<SRR_3>
```

> [!WARNING]
> To make sure the last accession name is read in, be sure that your `SRR_Acc_List.txt` file ends on a new line.

### Runnning the container

To run the container in Docker or Singularity, run the relevant command in the same directory as `SRR_Acc_List.txt`. 

#### Docker
```
docker run --rm -v $PWD:/mnt modalaigh/sratoolkit:latest
```

#### Singularity
```
singularity run --bind $PWD:/mnt docker://modalaigh/sratoolkit:latest
```