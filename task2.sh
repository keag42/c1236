read -p 'input the intial natural number : ' iNN
read -p 'input how many products you want to see: ' numProd #num of iterations
read -p 'input "x" as a postive int to find out if it is a factor of product ' fac
remember=0
prod=0

for (( i = 1; i <= $numProd; i++ )) ; do
    echo " test run $i"
    prod=$((iNN*(iNN + 1)))
    echo "product: $prod" 
    ((iNN++))
    if (( $prod % fac == 0 )); then
        echo "$prod is a factor of $fac"
    else
        echo "$prod not a factor of $fac"
    fi
done