#!/usr/bin/env bash

VAR=""
VAR2="a"
if [[ "$VAR = $VAR2" ]]; then
  #statements
  echo "são iguais";
fi

if [[ "$VAR = $VAR2" ]]
then
  echo "são iguais"
fi

if test "$VAR"  = "$VAR2"
 then
   
  echo "sao iguais"
fi

if [ "$VAR = $VAR2" ]
then
  echo "são iguais"
fi

[ "$VAR = $VAR2" ] || echo "sao iguais"
