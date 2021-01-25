#!/usr/bin/env bash

VAR=""
VAR2="a"

if [[ "$VAR" = "$VAR2" ]]; then
  echo "São iguais."
fi

if [[ "$VAR" = "$VAR2" ]]
then
  echo "São iguais."
fi

if test "$VAR" = "$VAR2"
then
  echo "São iguais."
fi

if [ "$VAR" = "$VAR2" ]
then
  echo "São iguais."
fi

[ "$VAR" = "$VAR2" ] || echo "São iguais."
