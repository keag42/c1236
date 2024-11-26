attempts=0

while [ $attempts -lt 3 ] && [ "$pwd" != "App1" ] ; do #if you get it wrong it runs 3 times 
    read -p "please enter password: " pwd #ask for password
    if [ "$pwd" = "App1" ]; then #if password is correct do

        while [ "$task" != "a" ] && [ "$task" != "A" ] && [ "$task" != "b" ] && [ "$task" != "B" ] && [ "$task" != "c" ] && [ "$task" != "C" ] && [ "$task" != "bye" ]; do
            echo "Task 1, enter A-a"
            echo "Task 2, enter B-b"
            echo "Task 3, enter C-c"
            read -p "what task do you wish to view?  " task #task selection 
            echo
            ms=""
            if [ "$task" = "a" ] || [ "$task" = "A" ] ; then #enterd a-A 
                echo "task 1 selected"

                tri=0 #triangular number 
                prodOdd=1 #sum of odd numbers
                prodEven=1 #sum of even numbers
                odd=0
                even=0
                oddString='Odd: '
                evenString='Even: '

                i=1 #variable for iterating through triangular numbers

                read -p 'Enter minimum number: ' minvar #minimum input
                read -p 'Enter maximum number: ' maxvar #maximum input
                echo
                echo "Range $minvar to $maxvar"
                echo
                echo "The tringular numbers are: "
                #use [ square brackets ] for test conditions
                #use ((parenthesis)) for math functions and if you put a $ infront u dont need to put it infront of each variable
                while [ $tri -lt $maxvar ] ; do #while triangular number is less than max
                    
                    tri=$((i*(i+1)/2))
                    
                    if [ $tri -ge $minvar ] && [ $tri -le $maxvar ]; then #if triangular number is greater than min and smaller than max
                    
                        if (( tri % 2 != 0)); then #if triangular number is odd
                            echo "$tri: odd"
                            prodOdd=$((prodOdd * tri))
                            odd=$(($odd + 1))

                        else #if triangular number is not odd (ie even)
                            echo "$tri: even"
                            prodEven=$((prodEven * tri))
                            even=$((even + 1))

                        fi #end of if statements about even & odd

                    fi #end of if statement determining which triangular numbers to print
                    ((i++))	#add 1 to i with each iteration
                done # end of while

                
                echo " \nThe number of even triangular numbers are: $even"
                echo "The number of odd triangular numbers are: $odd \n"
                echo "The product of odd triangular numbers are: $prodOdd" #print Odd and sum of odd numbers
                echo "The product of even triangular numbers are: $prodEven \n" #print Even and sum of even numbers
                
                while [ "$ms" != "m" ] && [ "$ms" != "e" ]; do
                    read -p "please enter: m to go back to menu or, e to leave " ms
                    echo

                    if [ "$ms" == "m" ]; then
                        task="stay"
                    elif [ "$ms" == "e" ]; then
                        task="bye"
                        echo goodbye
                    fi

                done
                    
            elif [ "$task" = "b" ] || [ "$task" = "B" ] ; then #entered b-B
                echo "task 2 selected"
                
                read -p 'Enter the intial number: ' startNum
                read -p 'How many products do you want to print?: ' numProd #num of iterations
                read -p 'Enter a number to check if it is a factor of the products: ' factor
                echo

                prod=0

                echo "The products are: \n" 

                for (( i = 1; i <= $numProd; i++ )) ; do
                    
                    prod=$((startNum*(startNum + 1)))
                    ((startNum++))
                    
                    if (( $prod % factor == 0 )); then
                        echo "$prod: is a factor of $factor"
                    else
                        echo "$prod: not a factor of $factor"
                    fi
                done

                while [ "$ms" != "m" ] && [ "$ms" != "e" ]; do
                    echo    
                    read -p "please enter: m to go back to menu or, e to leave " ms
                    echo
                    if [ "$ms" == "m" ]; then
                        task="stay"
                    elif [ "$ms" == "e" ]; then
                        task="bye"
                        echo goodbye
                    fi
                done

            elif [ "$task" = "c" ] || [ "$task" = "C" ] ; then #entered c-C
                echo "task 3 selected"
                
                read -p 'enter a: ' a
                read -p 'enter b: ' b
                read -p 'eter c:  ' c
                read -p 'enter min: ' min
                read -p 'enter max: ' max

                total=0
                count=1
                startTotal=0
                endTotal=0

                for (( i = $min; i <= $max; i++ )); do
                    total=$(( a*(i**3) + (b*i) + c ))
                    printf "$total, "
                    if (( i == $min )); then
                        startTotal=$total
                    elif (( i == $max )); then
                        endTotal=$total
                    fi
                done
                
                prod=$(( startTotal * endTotal ))
                echo "product: " $prod

                while [ "$ms" != "m" ] && [ "$ms" != "e" ]; do
                    echo
                    read -p "please enter: m to go back to menu, or e to leave " ms
                    echo
                    if [ "$ms" == "m" ]; then
                        task="stay"
                    elif [ "$ms" == "e" ]; then
                        task="bye"
                        echo goodbye
                    fi
                done

            else
                echo "incorrect, Please enter a,A,b,B,c or C"


            fi
        done

    elif [ $attempts -eq 0 ]; then #first incorrect input
        echo "incorrect password 2 more guesses till your locked out"
        ((attempts++))

    elif [ $attempts -eq 1 ]; then #second incorrect input
        echo "incorrect password 1 more guesses till your locked out"
        ((attempts++))

    elif [ $attempts -eq 2 ]; then #third & final incorrect input
        echo "incorrect password you've exhausted your attempts"
        ((attempts++))
        
    fi
done