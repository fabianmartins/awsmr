#!/bin/sh
# AWS MULTI REGION (awsmr) COMMAND
# This shell script expects "AWSMR COMMAND" and execute "aws COMMAND" in all regions
regions=($(aws ec2 describe-regions --query 'Regions[].{Name:RegionName}' --output text))
echo "COMMAND $@"
for ((i=0;i<=(${#regions[*]}-1);i++))
do
  echo ${regions[i]}
  aws --region ${regions[i]} $@
  echo "\n"
done
