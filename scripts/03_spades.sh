#!/bin/bash
set -euo pipefail

echo "=== ASM-GaSoM Workshop: SPAdes Assembly ==="

mkdir -p results/spades

spades.py \
  --only-assembler \
  -1 results/fastp/anc_trimmed_R1.fastq.gz \
  -2 results/fastp/anc_trimmed_R2.fastq.gz \
  -o results/spades/ancestor \
  -t 2 \
  -m 4

echo "SPAdes assembly completed."
echo "Assembly saved in results/spades/ancestor/"
