ROCKSDB='/home/ctbrown/scratch3/2026-gtdb-dl/gtdb-cds-rs226.species.singleton.rocksdb'

METAGS=[ x.strip() for x in open('dog-list.txt') ]
METAGS=METAGS[:5]               # subselect first 5 for testing


rule all:
    input:
        expand('gather/{m}.gather.csv', m=METAGS)

rule gather:
    input:
        metag_sig='/group/ctbrowngrp5/wort/wort-sra/sigs/{metag}.sig',
        db=ROCKSDB,
    output:
        csv='gather/{metag}.gather.csv',
        out='gather/{metag}.gather.out',
    shell: """
        sourmash gather -k 21 --scaled=1000 --threshold-bp=0 \
           {input.metag_sig} {input.db} -o {output.csv} >& {output.out}
    """
