This repo contains the files neccessary to generate the docker image currently available at https://hub.docker.com/r/modalaigh/sratoolkit

The image runs Ubuntu Jammy and has SRA Toolkit (3.1.1) installed. It automatically downloads SRA files as specified in the `SRR_Acc_List.txt`

To build the docker image locally follow these instructions (assuming Docker is installed):

```
git clone https://github.com/modalaigh/docker_sratoolkit.git
cd docker_sratoolkit/
docker build -t modalaigh/sratoolkit:latest .
```

Before running the container, please make sure that the directory that the container will be run from has an empty folder named `data/` and a file named `SRR_Acc_List.txt` with SRA Accession . To run the image in Docker or Singularity, follow the instructions below:

### Docker
Run the following command in the same directory as `SRR_Acc_List.txt`

```
docker run --rm -v $PWD:/mnt modalaigh/sratoolkit:latest
```


### Singularity
```
Singularity run --bind $PWD:/mnt docker://modalaigh/sratoolkit:latest
```