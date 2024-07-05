#! /bin/bash

while IFS= read -r accession; do
  fasterq-dump "${accession}" --split-files --outdir /mnt/data/
done < /mnt/SRR_Acc_List.txt