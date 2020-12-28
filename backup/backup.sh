#!/bin/bash

#see skript arhiveerib iga kasutaja kodukataloogi backup kausta

lahtekaust="/home/"
sihtkaust="/home/user/skriptid/bash_skriptimine/HOME_backup/"
echo $lahtekaust
echo $sihtkaust
for filename in $(ls $lahtekaust); do
	result=
	if [ -f $filename ]; then
		result="$filename is a regular file"
		echo $result
		echo ""
		sleep 2
	else
		if [ -d $filename ]; then
			result="$filename is a directory Do BACKUP!"
			echo $result
			#kuupäeva numbrid välja lõikamine
			kuupaev=$(date +%d.%m.%Y)
			#echo $kuupaev
			#echo "$lahtekaust$filename/"
			#kataloogi pakkimine ja arhiveerimine
			tar -zcvf $filename.$kuupaev.tar.gz $filename/
			#gzip $filename.$kuupaev.tar.gz
			#pakitud faili liigutamine loodud backup kausta
			mv $filename.$kuupaev.tar.gz $sihtkaust
			echo ""
			sleep 2
		fi
	fi
done
