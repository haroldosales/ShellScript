# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS --------------------------------#
CHAVE_DEBUG=0
NIVEL_DEBUG=0

verde="\033[32;1m"
preto="\033[30;1m"


# ------------------------------------------------------------------------ #



Debugar () {
  [ $1 -le $NIVEL_DEBUG ] && echo -e "${2}Debug $* ------"
}
#--------------------- FUNÇÕES ----------------------------------------- #

SOMA () {
    local teste=1

  for (( i = 1; i < 10; i++ )); do
    Debugar 1 "${verde}"  "Entre  i no for com o valor: $i"
        teste=$(($teste+$i))
        Debugar 2 "${preto}" "Depois da soma: $teste"
  done
  echo $teste
}
# ------------------------------------------------------------------------ #

case "$1" in
  -d) [ $2 ] && NIVEL_DEBUG=$2 ;;
   *) Soma                     ;;
esac
# ------------------------------- EXECUÇÃO ----------------------------------------- #
SOMA
# ------------------------------------------------------------------------ #
