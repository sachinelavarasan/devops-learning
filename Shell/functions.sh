myfunc() {
    echo "hello $1"
}

function myfunc {
    echo "hello $1"
}

myfunc "Elavarasan"

echo "\n*****************************\n"


myTest() {
    echo "$#" # Number of arguments
    echo "$@" # All positional arguments (as separate strings)
    echo "$*" # All positional arguments
    echo "$1" # First argument
    echo "$_" # Last argument of the previous command
    
}

myTest "John" "Doe"

echo "\n*****************************\n"

mySome() {
    local result="Some inside"
    echo $result
    
}

result="Some outside"
echo $result

mySome

echo "\n*****************************\n"

mul(){
    #local variable can't be access at outside
    local data=`expr $1 + $2`
    echo "Multiplication of $1 and $2 --> "$data;
    return $data;
}

# function name next argument for your function
mul 1 2

if [[ $? -gt 0 ]]; then
echo "success"
else
echo "failure"
fi