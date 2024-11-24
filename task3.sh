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