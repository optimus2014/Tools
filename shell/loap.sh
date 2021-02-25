#!/bin/bash

year=( "2009" "2010" "2011" "2012" "2013" "2014" "2015" "2016" "2017" "2018" "2019" "2020")
month=("01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12")

for y in ${year[@]};do
        echo $y
     sh load_dws_btc_addr_year.sh $y
#        hive -n "hdfs" -p "" --hiveconf time_=${y}"-"$m -f load_dws_btc_addr_trans.hql 
done
