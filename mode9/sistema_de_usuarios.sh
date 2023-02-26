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
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"
SEP=:
TEMP=temp.$$

VERDER="\033[32;1m"
VERMELHO="\033[31;1m"


# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existe." && exit 1  
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo sem permissao de leitura."  && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo sem permissao de escrita."  && exit 1

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

MostrarUsuarioNaTela () {
    local id="$(echo $1 | cut -d $SEP -f 1)"
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    local email="$(echo $1 | cut -d $SEP -f 3)"

    echo -e "${VERDER}ID: ${VERMELHO}$id"
    echo -e "${VERDER}Nome: ${VERMELHO}$nome"
    echo -e "${VERDER}E-mail: ${VERMELHO}$email"

}

ListaUsuarios () {
  while read -r linha
  do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue 
    [ ! "$linha" ] && continue 

    MostrarUsuarioNaTela $linha
    
  done < "$ARQUIVO_BANCO_DE_DADOS"
}

ValidaExistenciaUsuario () {
  grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InserUsuario () {
  local nome="$(echo $1 | cut -d $SEP -f 1)"

  if ValidaExistenciaUsuario "$nome"
  then 
   echo "ERRO. Usuario ja existente"
  else
   echo "$*" >> "$ARQUIVO_BANCO_DE_DADOS"
   echo "Usuario cadastro com sucesso"
  fi
  OrdenaLista
}

ApagarUsuario () {
  ValidaExistenciaUsuario "$1" || return

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
