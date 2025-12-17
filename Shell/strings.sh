name="John"
echo "Hi $name"  #=> Hi John
echo 'Hi $name'  #=> Hi $name

echo "\n*****************************\n"

echo "I'm in $(pwd)"
echo "I'm in `pwd`"

echo "\n*****************************\n"

name="John"
echo "${name}"
echo "${name/J/j}"    #=> "john" (substitution)
echo "${name:0:2}"    #=> "Jo" (slicing)
echo "${name::2}"     #=> "Jo" (slicing)
echo "${name::-1}"    #=> "Joh" (slicing)
echo "${name:(-1)}"   #=> "n" (slicing from right)
echo "${name:(-2):1}" #=> "h" (slicing from right)
echo "${food:-Cake}"  #=> when food var is not being set , it print cake as value

echo "\n*****************************\n"