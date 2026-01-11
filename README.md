# 2026-gather-many-metagenomes

## Install

Start srun:
```
srun -p high --time=48:00:00 --nodes=1 --cpus-per-task=16 --mem=40GB \
     -A ctbrowngrp -J smash --pty /bin/bash 
```

Install software:
```
module load conda
conda create -n smash -y sourmash snakemake
```

Grab repo:
```
git clone https://github.com/ctb/2026-gather-many-metagenomes.sig
```

## Run

Activate conda environment:
```
conda activate smash
```

```
cd 2026-gather-many-metagenomes
snakemake -j 16 -k
```
