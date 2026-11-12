#!/bin/bash
set -euo pipefail

echo "=== ASM-GaSoM Workshop: FastQC ==="

mkdir -p results/fastqc

fastqc \
  --threads 2 \
  --outdir results/fastqc \
  data/anc_R1.fastq.gz \
  data/anc_R2.fastq.gz

echo "FastQC completed successfully."
echo "Reports saved in results/fastqc/"
