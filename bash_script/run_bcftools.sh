#!/bin/bash
brain=$1

bcftools view -S ${brain}_WGS_id.txt -Oz -o ${brain}_WGS.vcf.gz GTEx_Analysis_20160115_v7_WholeGenomeSeq_635Ind_PASS_AB02_GQ20_HETX_MISS15_PLINKQC.PIR.vcf.gz 
tabix -p vcf ${brain}_WGS.vcf.gz 
# change chr name and add snp ID
bcftools annotate --rename-chrs rename_chr -a dbSNP/All_20180423_rename_chr.vcf.gz -c ID -o ${brain}_WGS_rename_chr_add_rsid.vcf.gz -Oz  ${brain}_WGS.vcf.gz  
tabix -p vcf ${brain}_WGS_rename_chr_add_rsid.vcf.gz
