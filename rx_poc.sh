#! /bin/bash
today=$(date +%Y%m%d)
weather_report=raw_data_$today
city=Casablanca
curl wttr.in/$city --output $weather_report
grep °C $weather_report > temperature.txt
obs_tmp=$(cat -A temperature.txt | head -1 | cut -d "+" -f2 | cut -d "^" -f5 | cut -d "m" -f2)
echo "observed temperature = $obs_tmp"
fc_tmp=$(cat -A temperature.txt | head -2 | tail -1 | cut -d "+" -f3 | cut -d "^" -f1)
echo "forecast temperature = $fc_tmp"
hour=$(TZ='Morocco/Casablanca' date -u +%H)
day=$(TZ='Morocco/Casablanca' date -u +%d)
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)
record=$(echo -e $"$year\t$month\t$day\t$obs_tmp\t$fc_tmp")
echo $record>>rx_poc.log

