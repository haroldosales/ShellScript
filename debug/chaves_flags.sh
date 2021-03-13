#!/usr/bin/env bash
#
# listadeusuraio.sh - extrair usuario do /etc/passwd
#
# Site:       https://haroldosales.com
# Autor:      Haroldo Sales
# Manutenção: Haroldo Sales
#
# ------------------------------------------------------------------------ #
#  Este programa irá extrair usuario do /etc/passwd, havendo posibilidade de # #  Colocar em minusculo e ordem alfabetica
#
#  Exemplos:
#      $ ./listadeusuraio.sh -s -m
#      Neste exemplo ficara em maiúsculo e ordem alfabetica
# ------------------------------------------------------------------------ #
# Histórico:
#       v1.0 25/01/2021 - 15:00  - haroldo
#        - Adcionamos  -  -s -v -h
#       v1.1  25/01/2021  17:01  - Haroldo
#         -  adiconou  em um case
#         -  adiconou -    -m
#
#
#
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS --------------------------------#
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
  $(basename $0) - [OPÇÕES]

          -h - Menu de ajuda
          -v - Versão
          -s - Ordernar a saída
          -m - Colocar em maiúsculo
  "
  VERSAO="v1.0"
  CHAVE_ORDENA=0
  CHAVE_MAISCULO=0

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
set -x
while test -n "$1"
do
  case "$1" in
     -h) echo "$MENSAGEM_USO"    && exit 0           ;;
     -v) echo "$VERSAO"          && exit 0           ;;
     -s) CHAVE_ORDENA=1                              ;;
     -m) CHAVE_MAISCULO=1                            ;;
      *) echo "Opção Invalida,  valie -h" && exit 1  ;;
  esac
  shift
done

[ $CHAVE_ORDENA   -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAISCULO -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"

set -x
# ------------------------------------------------------------------------ #
