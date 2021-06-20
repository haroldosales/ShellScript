#!/usr/bin/env bash

[ ! -e  "$arquivos_de_Configuracao" ] &&  "ERRO. arquivos nao existe" && exit 1
[ ! -e  "$arquivos_de_Configuracao" ] &&  "ERRO. sem acesso de leitura" && exit 1

while read -r linha
do
[ "$(echo $linha | cut -c1)"  = "#" ] &&  continue #comentando a nova proxima
[ ! "$linha" ] &&  continue # se for linha em branco proximo


done  < "$arquivos_de_Configuracao"
