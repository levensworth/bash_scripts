#!/bin/bash
checks(){
    expresion=$2
    elemento=$1
    echo "$elemento" | egrep $expresion >> /dev/null
    if [ $? -eq 0 ]
    then
        return 0
    else
        return 1
    fi
}

is_number (){
    val=$1
    echo "$val" | egrep '^-?[0-9]+$' >> /dev/null
    if [ $? -eq 0 ]
    then
        return 0
    else
        return 1
    fi
}

is_alpha(){
    val=$1
    echo "$val" | egrep '^[a-zA-Z]+$' >> /dev/null
    if [ $? -eq 0 ]
    then
        return 0
    else
        return 1
    fi
}

require_number(){
    val=$1
    message=$2
    code=$3
    is_number $val
    if [ $? -eq 0 ]
    then
        echo
    else
        echo "$message"
        return $code
    fi
}

require_directory(){
    val=$1
    message="that is not a directory"
    code=64
    if [ -d $val ]
    then
        echo
    else
        echo $message
        return $code
    fi
}

require_file(){
    file=$1
    message=$2
    code=$3
    if [ -f $file ]
    then
        echo
    else
        echo $message
        return $code
    fi
}
help(){
    echo " all the function and requirements are:"
    echo "checks()  str regex"
    echo "is_number num"
    echo "is_alpha str"
    echo "require_number num message code "
    echo "require_directory val message code"
    echo "require_file val message code"
    echo "thats all! good luck"
}
