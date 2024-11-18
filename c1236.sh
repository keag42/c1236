attempts=0
ms=false #menu not selected properly

while [ $attempts -lt 3 ] && [ "$pwd" != "App1" ] ; do #if you get it wrong it runs 3 times 
    read -p "please enter password: " pwd #ask for password
    if [ "$pwd" = "App1" ]; then #if password is correct do
        echo "Task 1, enter A-a"
        echo "Task 2, enter B-b"
        echo "Task 3, enter C-c"
        ms=false

        while [ "$task" != "a" ] && [ "$task" != "A" ] && [ "$task" != "b" ] && [ "$task" != "B" ] && [ "$task" != "c" ] && [ "$task" != "C" ] && [ "$ms" = false ] ; do
            read -p "what task do you wish to view? " task #task selection 
            if [ "$task" = "a" ] || [ "$task" = "A" ] ; then #enterd a-A 
                ms=true
                echo "task 1 selected"
                ./task1.sh # go to task 1
            elif [ "$task" = "b" ] || [ "$task" = "B" ] ; then #entered b-B
                ms=true
                echo "task 2 selected" 
                ./task2.sh # go to task 2
            elif [ "$task" = "c" ] || [ "$task" = "C" ] ; then #entered c-C
                echo "task 3 selected"
                ms=true
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
