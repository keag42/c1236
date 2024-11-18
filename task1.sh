read -p 'Enter minimum number: ' minvar #minimum input
read -p 'Enter maximum number: ' maxvar #maximum input
tri=0 #triangular number 
odd=0 #sum of odd numbers
even=0 #sum of even numbers
i=1 #variable for iterating through triangular numbers

echo "range $minvar to $maxvar"
#use [ square brackets ] for test conditions
#use ((parenthesis)) for math functions and if you put a $ infront u dont need to put it infront of each variable
while [ $tri -lt $maxvar ] ; do #while triangular number is less than max
  tri=$((i*(i+1)/2))	
	if [ $tri -ge $minvar ] && [ $tri -le $maxvar ]; then #if triangular number is greater than min and smaller than max
		echo "tringular number $i: $tri"
	
		if (( tri % 2 != 0)); then #if triangular number is odd
		echo "odd"
		odd=$((odd + tri))

		else #if triangular number is not odd (ie even)
		echo "even"
		even=$((even + tri))
	
		fi #end of if statements about even & odd
	fi #end of if statement determining which triangular numbers to print
	((i++))	#add 1 to i with each iteration
done # end of while

echo "Odd: $odd" #print Odd and sum of odd numbers
echo "Even $even" #print Even and sum of even numbers

while [ "$stay_leave" != "m" ] && [ "$stay_leave" != "e" ] ; do #to go back to menu or exit
	read -p "'m' to go back to menu, 'e' to exit: " stay_leave # leave by clicking e, go back to menu by clicking m
	if [ "$stay_leave" = "m" ] ; then
		cd .. && cd menu && ./menu.sh # && App1 # still asks for password? why? cant enter commands in new directory once it runs because it ends running yours?
	elif [ "$stay_leave" = "e" ] ; then
		break
	else
		echo "please enter: m, or e: "
	fi
done