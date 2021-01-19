#!/usr/bin/env bash

echo "mod For1"

for (( i = 0; i < 10; i++ )); do
  #statements()
  echo $i
done

echo "---- mod For 2(seq)"

for i in $(seq 10)
do
  echo $i
done

echo "for 3 (array)"
Frutas=(
  "Laranja"
  "Ameixa"
  "Abacaxi"
  "Melancia"
  "Jambo"
  )

for i in "${Frutas[@]}"; do
  echo $i
done

echo " WHILE"
contador=0
while [[ $contador -lt ${#Frutas[@]} ]]; do
  #statements
  echo $contador
  contador=$(($contador+1))
done
