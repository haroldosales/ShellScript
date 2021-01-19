#!/usr/bin/env bash
#Um laço que conte de 0 a 10
#    A cada iteração, verifique se o número é divisível por 2
#    Se ele for divisível por 2, escreva uma mensagem na tela confirmando isso

for (( i = 0; i < 10; i++ )); do
  #statements
  if [[ $i%2 -eq 0 ]]; then
    #statements
    echo "é divisivel $i"
  fi


done
