# For loop example
for i in {1..5}; do
  echo "Iteration $i"
done

echo "\n*****************************\n"
# While loop example

echo "Enter element count"
read -p "Enter a value: " count
my_array=()
while [ $count -gt 0 ]; do
  echo "Count is $count"
  read -p "Enter a value: " input
  my_array+=("$input")
  ((count--))
done

cal(){
  sums=0
 echo "You entered: $# arguments"
  for item in $@; do
    sums=$((sums + item))
  done
  echo $sums
}

cal "${my_array[@]}"

echo "\n*****************************\n"

# Break and continue example
for i in {1..5}; do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo "Number $i"
  if [ $i -eq 4 ]; then
    break
  fi
done

echo "\n*****************************\n"
# Nested loops example
for i in {1..3}; do
  for j in {1..2}; do
    echo "Outer loop $i, Inner loop $j"
  done
done