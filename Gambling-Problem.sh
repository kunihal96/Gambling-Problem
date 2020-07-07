function calculateWinLossPercent()
{
   percentvalue=$(( $StopPercent*$PlayerAmount/100 ))
   Winbreak=$(( $PlayerAmount + $percentvalue ))
   Lossbreak=$(( $PlayerAmount - $percentvalue ))
}

#! /bin/bash
echo gambling problem solved here

#Stake value everyday
DailyStake=10

#Each game Bet
Bet=1

StopPercent=50
monthearningss=0
PlayerAmount=0

declare -a earnings
for i in {0..5} #loop for month(20 days)
do
   ((PlayerAmount+=$DailyStake))
   calculateWinLossPercent
   dayearning=0
   while(($PlayerAmount<$Winbreak && $PlayerAmount>$Lossbreak)) #loop for day
   do
	Betresult=$((RANDOM%2))
	if (($Betresult==1))
	then
	   ((PlayerAmount+=1)) #won so increase the amount
	   ((dayearning++))
	else
	   ((PlayerAmount-=1)) #lost so decrease the amount
	   ((dayearning--))
	fi
   done
   earnings[i]=$dayearning
done


monthearnings=0
win_days=0
loose_days=0
for ((i=0;i<20;i++))
do
   ((monthearnings+=earnings[i]))
   if ((earnings[i]>0))
   then
	((win_days++))
	((win_amount+=earnings[i]))
   else
	((loose_days++))
	((lose_amount+=earnings[i]))
   fi
done

echo
echo 'Monthly earnings:' $monthearnings
echo Days won : $win_days Winning amount: $win_amount
echo Days Lost : $loose_days Losing amount: $lose_amount


