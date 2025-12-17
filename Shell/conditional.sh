# Printing statement
name="Elavarasan"
echo $name;

echo "*****************************\n"

# condtional statement
name="Ela"
if [[ $name == "Ela" ]]; then
echo "Both are same";
else
echo "Both are not same";
fi

echo "*****************************\n"

# Odd or even numbers
nums=1
if (($nums % 2 == 0)); then
echo "Even number";
else
echo "Odd number";
fi

echo "*****************************\n"

# Positive or Negative numbers
value=1
if [[ $value -gt 0 ]]; then
echo "Postive number";
elif [[ $value -lt 0 ]]; then
echo "Negative number";
else
echo "Zero";
fi

echo "*****************************\n"


# Read input from terminal
echo "Enter the number";
read number
if [[ $number -gt 0 ]]; then
echo "Postive number";
elif [[ $number -lt 0 ]]; then
echo "Negative number";
else
echo "Zero";
fi

echo "*****************************\n"


# File operations - Exists
if [[ -e "./file.txt" ]]; then
echo "File Existed";
else
echo "File not existed";
fi

echo "*****************************\n"

# File operations - Readable
if [[ -r "./file.txt" ]]; then
echo "Readable Existed";
else
echo "Not Readable";
fi

echo "*****************************\n"

# File operations - Symlink
if [[ -h "./file.txt" ]]; then
echo "Symlink Existed";
else
echo "Not Symlink";
fi

echo "*****************************\n"

# File operations - Directory
if [[ -d "./file.txt" ]]; then
echo "Directory";
else
echo "Not Directory";
fi

echo "*****************************\n"

# File operations - Writable
if [[ -w "./file.txt" ]]; then
echo "Writable";
else
echo "Not Writable";
fi

echo "*****************************\n"

# File operations - FILE
if [[ -f "./file.txt" ]]; then
echo "FILE";
else
echo "Not FILE";
fi

echo "*****************************\n"

# File operations - FILE
if [[ "./file.txt" -nt "./file2.txt" ]]; then
echo "1 is more recent than 2";
else
echo "2 is more recent than 1";
fi

echo "*****************************\n"

# Nested if statement
num=11
if [ $num -gt 0 ]; then
  if [ $num -lt 10 ]; then
    echo "Number is between 1 and 9"
  else
    echo "Number is not between 1 and 9"
  fi
fi