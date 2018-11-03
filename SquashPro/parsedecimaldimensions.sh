#!/bin/sh

FACTOR=1.5 # for DPI=240

for number in `cat res/values/dimens.xml | sed 's/>\([0-9.][0-9.]*\)dp</>\n\1\n</g' | grep '^[0-9.][0-9.]*$'`
do
result=$(echo "$number*$FACTOR" | bc) ;
sed -i 's/'$number'dp/'$result'px/g' res/values/dimens.xml;
echo $number "-" $result
done


