### random password generator


password=$RANDOM ### RANDOM is a bash variable

echo "$password"


password=$(date +%S%N)   ### PASSWORD based on the epic date

echo "$password"

password=$(date +%S%N|sha256sum|head -c16)  ## sha256sum gives the output based on sha256sum algorithm

echo "password is : $password"

specialchars="><%$#@()*="

randomspecialchar=$(echo "$specialchars"|fold -w2|shuf|head -1)

### here, fold -w1 = prints the horizontal string to verical lines with the width of 2 columns

### shuf - shuffles the rows


password_final="${password}${randomspecialchar}"

echo "Random characters are: ${randomspecialchar}"

echo "Final password is : ${password_final}"
