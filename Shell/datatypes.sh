
# Bash does not support floating-point arithmetic natively

# String example
greeting="Hello, World!"
name="Alice"
full_greeting="$greeting, $name!"
echo $full_greeting

echo "\n*****************************\n"


# Number example
num1=5
num2=10
sum=$((num1 + num2))
difference=$((num2 - num1))
product=$((num1 * num2))
quotient=$((num2 / num1))
reminder=$((num2 % num1))
echo "Sum: $sum, Difference: $difference, Product: $product, Quotient: $quotient, Reminder: $reminder"


echo "\n*****************************\n"

# Array example
fruits=("apple" 1 "cherry")
for fruit in "${fruits[@]}"; do
  echo $fruit
done


echo "\n*****************************\n"

# Associative array example
declare -A colors
colors[apple]="red"
colors[banana]="yellow"
colors[grape]="purple"
unset colors[banana]
echo ${colors[apple]} # red
echo ${colors[grape]} # purple