#!/bin/bash
set -euo pipefail

echo "=== ASM-GaSoM Workshop: fastp ==="

mkdir -p results/fastp

fastp \
  --in1 data/anc_R1.fastq.gz \
  --in2 data/anc_R2.fastq.gz \
  --out1 results/fastp/anc_trimmed_R1.fastq.gz \
  --out2 results/fastp/anc_trimmed_R2.fastq.gz \
  --html results/fastp/fastp_report.html \
  --json results/fastp/fastp_report.json \
  --thread 2

echo "fastp completed successfully."
echo "Trimmed reads and reports saved in results/fastp/"
