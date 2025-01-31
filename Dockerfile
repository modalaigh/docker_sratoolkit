FROM ubuntu:jammy

RUN apt-get update && apt-get install -y wget
RUN wget --output-document home/sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.1.1/sratoolkit.3.1.1-ubuntu64.tar.gz
RUN tar -vxzf home/sratoolkit.tar.gz -C home/

ENV PATH=$PATH:/home/sratoolkit.3.1.1-ubuntu64/bin

COPY sra_download.sh /home/sra_download.sh
RUN chmod +x /home/sra_download.sh

CMD [ "/home/sra_download.sh" ]
