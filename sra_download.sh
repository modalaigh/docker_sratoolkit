#! /bin/bash

while IFS= read -r accession; do
  fasterq-dump "${accession}" --split-files --outdir /home/data/
done < home/SRR_Acc_List.txt