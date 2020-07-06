#! /bin/bash

echo Gambling problem solved here

#Stake value everyday
DailyStake=100

#Each game bet
Bet=1

#Take Risk Percetage from user
echo "Enter win/loss percetage for stop playing"
read StopPercent

percentvalue=$(( $StopPercent*$DailyStake/100 ))
