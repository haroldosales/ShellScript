#!/usr/bin/env bash

arquivos_de_Configuracao="configuracao.cf"
mensagme="Mensagem de Teste"
usar_maisculas=
usar_cores=
vermelhor="\033[31;1m"


[ "$USAR_MAISCULAS" = "1"   ]    && MENSAGEM="$(echo -e $MENSAGEM |  tr [a-z] [A-Z] )"
[ "$USAR_CORES"     = "1"     ]  && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo -e    "$mensagem"
