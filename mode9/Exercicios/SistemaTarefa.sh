#!/usr/bin/env bash
#
#
# Site:       https://haroldosales.com
# Autor:      Haroldo Sales
# Manutenção: Haroldo Sales
#
# ------------------------------------------------------------------------ #
# 
# ------------------------------------------------------------------------ #
# 
#
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS --------------------------------#
ARQUIVO_BANCO_DE_DADOS="tarefa.txt"
SEP=:
TEMP=temp.$$

VERDER="\033[32;1m"
VERMELHO="\033[31;1m"


# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existe." && exit 1  
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo sem permissao de leitura."  && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo sem permissao de escrita."  && exit 1
[ ! -x "$(which dialog)"  ] && sudo pacman -S dialog 1> /dev/null 
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
ListaUsuarios () {
   egrep -v "^#|^$" "$ARQUIVO_BANCO_DE_DADOS" | tr : ' ' > "$TEMP"
   dialog --title "Lista de Usuarios" --textbox "$TEMP" 20 40
   rm -f $TEMP

}
ValidaExistenciaTarefa () {
  grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InserTarefa () {
 local ultimo_id="$(egrep -v "^#|^$" $ARQUIVO_BANCO_DE_DADOS | sort | tail -n 1 | cut -d $SEP -f 1)"
  local proximo_id=$(($ultimo_id+1))

  local nome=$(dialog --title "Cadastro de usuario" --stdout --inputbox "Digite seu nome" 0 0)
  ValidaExistenciaUsuario "$nome" &&  {
    dialog --title "Erro Fatal" --msgbox "Usuario ja cadastrado no sistema" 6 40 
    exit 1
  }
  local email=$(dialog --title "Cadastro de usuario" --stdout  --inputbox "Digite seu email" 0 0)

  echo "$proximo_id$SEP$nome$SEP$email" >> "$ARQUIVO_BANCO_DE_DADOS"

  dialog --title "Sucesso" --msgbox "Usuario Cadastro com sucsso!" 6 40
  
}

ApagarTarefa () {
  ValidaExistenciaTarefa "$1" || return

  grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DADOS"

  echo "Excluido com sucesso"
  OrdenaLista
}

OrdenaLista () {
  sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}


# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
# ------------------------------------------------------------------------ #
