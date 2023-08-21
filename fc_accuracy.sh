yes_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f5)
today_fc=$(tail -1 rx_poc.log | cut -d  " " -f5)
accuracy=$(($yes_fc-$today_fc))
echo $accuracy
if [ -1 -le $accuracy ] && [ $accuracy -le 1  ]
then
	accuracy_range=excellent
elif [ -2 -le $accuracy ] && [ $accuracy -le 2  ]
then
	accuracy_range=good
elif [ -3 -le $accuracy ] && [ $accuracy -le 3  ]
then
        accuracy_range=fair
else
	accuracy_range=poor
fi
echo "Forecast accuracy $accuracy"
year=$( tail -1 rx_poc.log | cut -d  " " -f1)
month=$( tail -1 rx_poc.log | cut -d  " " -f2)
day=$( tail -1 rx_poc.log | cut -d  " " -f3)
echo -e "$year\t$month\t$day\t$today_fc\t$yes_fc\t$accuracy\t$accuracy_range" >>historical_fc_accuracy.tsv
