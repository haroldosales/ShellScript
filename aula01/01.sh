#!/usr/bin/env bash

# aula de variaveis
#
# Aula de variaveis
#  sempre colocar no primeira linha T/usr/bin/env bash --> ele procura aonde esta o bash, se tornando portatil
#/

NOME="Haroldo
sales"

NUMERO_1=24
NUMERO_2=34

TOTAL=$(($NUMERO_1+$NUMERO_2))
echo "$TOTAL"  ;


SAIDA_CAT=$(cat /etc/passwd | grep haroldo)

echo $SAIDA_CAT


## variaveis Reservadas

echo "----------------------------------------"

 echo "Parametro:1 $1"
 echo "Parametro:2 $2"

 echo "Todos Parametro $*"

echo "Quantos Parametros $#"

echo "Saida do último Comando $?"

echo "PID: $$"

echo $0
