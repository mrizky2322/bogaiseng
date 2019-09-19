#!/bin/bash
tempek(){
	randem=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)
	curl=$(curl -s --compressed --cookie ${random}_tmp "https://api.ultravoucher.co.id/urlredeem/api/voucher/info/" -L \
	-H 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' \
	-H 'Accept: application/json, text/plain, */*' \
	-H 'Accept-Language: en-US,en;q=0.5' \
	-H 'Referer: https://e.uvcr.me/$randem/1555401523' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Origin: https://e.uvcr.me' \
	-H 'Connection: keep-alive' \
	--data "id_stock=47fa828819ae5716a1bd4f8fb8c1e7c9&key=za9t02abu7&millisecond=1568888575376&pass=vka5ixpztinyyd5u849ehtt&signature=QPar/HzmmKRM0j0mNSdg3RwSfV/iaYyrJ47KS5TZZLM=&stock_validate=a4qvvdpj8ne9dezt&voucher_key=1557971792&voucher_sign=25j2f0x18dqfayit7qgmp86l7c34f923ftcv9sbm35gib2ar018eyi1lup6n")
	result=$(echo $curl | grep -Po '(?<="is_redeemed":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	if [[ $result =~ "Ya" ]]; then
		printf "TERPAKAI BRO\n"
		echo "$result"
	else
		printf "$curl\n"
		echo "$curl|$randem" >> asu.txt
	fi
}
read -p "Berapa Kali ? : " limit;
for (( i = 0; i < $limit; i++ )); do
	tempek
done
