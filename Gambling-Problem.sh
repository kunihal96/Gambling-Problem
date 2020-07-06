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

Winbreak=$(( $DailyStake + $percentvalue ))
Lossbreak=$(( $DailyStake - $percentvalue ))

monthearnings=0
   declare -a earnings
   for i in {0..19}  #loop for month(20 days)
   do
       todayAmount=$DailyStake
       dayearning=0
       while(($todayAmount<$Winbreak && $todayAmount>$Lossbreak)) #loop for day
       do
           betresult=$((RANDOM%2))
           if (($betresult==1))
           then
               ((todayAmount+=1))  #won so increase the amount
               ((dayearning++))
           else
               ((todayAmount-=1))  #lost so decrease the amount
               ((dayearning--))
           fi
       done
       earnings[i]=$dayearning
       ((monthearnings+=dayearning))
       if (($dayearning>0))
       then
           ((win_dayss++))
       else
           ((loose_dayss++))
       fi
   done


   #for ((i=0;i<20;i++))
   #do
       #((monthearnings+=earnings[i]))
   #done

   echo
   echo 'Monthly earnings:' $monthearnings

