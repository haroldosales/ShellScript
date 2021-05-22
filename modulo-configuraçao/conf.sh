#!/usr/bin/env bash

# ------------------VARIAVEIS-----------------------------------#
ARQUIVOS_CONF="configuracao.cf"
USAR_CORES=
USAR_MAISCULAS=
MENSAGEM="ola show"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"


# ------------------------TESTE---------------------------------#
[ ! -r "$ARQUIVOS_CONF" ] && echo "sem confirmaçao" && exit 1

# --------------------------------------------------------------#


# -------------------FUNÇÕES------------------------------------#
DefinirParametros () {
		local parametro="$(echo $1  | cut -d = -f 1)"
		local valor="$(echo $1 | cut -d = -f 2 )"

		case "$parametro" in
			USAR_CORES)      USAR_CORES="$valor"      ;;
			USAR_MAISCULAS)  USAR_MAISCULAS="$valor"  ;;
		esac
	}


# ---------------------------------------------------------------#

# ------------------------EXECUÇÃO-------------------------------#

while read -r linha
do
   [ "$(echo $linha | cut -c1)" = "#" ]  && continue
   [ ! "$linha"  ] && continue
DefinirParametros "$linha"
done < "$ARQUIVOS_CONF"

[ "$USAR_MAISCULAS" = "1"   ]    && MENSAGEM="$(echo -e $MENSAGEM |  tr [a-z] [A-Z] )"
[ "$USAR_CORES"     = "1"     ]  && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"


echo "$MENSAGEM"

# ---------------------------------------------------------------#
