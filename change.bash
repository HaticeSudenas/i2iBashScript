function factorial {
    if [ $1 -eq 0 ]; then
        echo 1
    else
        echo $(( $1 * $(factorial $(( $1 - 1 ))) ))
    fi
}

# Ask for the calculation operand
echo "Choose a calculation operand:"
echo "+ (addition)"
echo "- (subtraction)"
echo "* (multiplication)"
echo "/ (division)"
echo "% (modulo)"
echo "! (factorial)"

read operand

# Ask for input numbers
if [ "$operand" == "!" ]; then
    echo "Enter a number for factorial:"
    read num1
else
    echo "Enter the first number:"
    read num1
    echo "Enter the second number:"
    read num2
fi

# Perform the calculation based on the operand
case $operand in
    "+")
        result=$(( num1 + num2 ))
        ;;
    "-")
        result=$(( num1 - num2 ))
        ;;
    "*")
        result=$(( num1 * num2 ))
        ;;
    "/")
        result=$(( num1 / num2 ))
        ;;
    "%")
        result=$(( num1 % num2 ))
        ;;
    "!")
        result=$(factorial $num1)
        ;;
    *)
        echo "Invalid operand!"
        exit 1
        ;;
esac

# Print the calculation result
echo "Result: $result"
