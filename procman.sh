# === Cores ===
NC='\033[0m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'

LOG_FILE="procman.log"

registrar_log() {
  local acao="$1"
  local pid="$2"
  local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo "$timestamp - AÇÃO: $acao - PID: $pid" >> "$LOG_FILE"
}

pausa_para_voltar() {
  echo ""
  echo ""
  read -p "Pressione Enter para voltar ao menu..."
}

listar_processos() {
  echo -e "${BOLD}${CYAN}PID\tUSUÁRIO\tNOME\t\tCPU%\tMEM%\tTEMPO\tESTADO\tCOMANDO${NC}"
  echo -e "${CYAN}--------------------------------------------------------------------------${NC}"
  ps -eo pid,user,comm,%cpu,%mem,etime,stat,cmd | tail -n +2
  registrar_log "LISTAGEM" "-"
  pausa_para_voltar
}

pausar_processo() {
  read -p "Digite o PID do processo: " pid

  if ps -p "$pid" > /dev/null; then
    kill -SIGSTOP "$pid"
    clear
    echo -e "${GREEN}Processo com PID ${YELLOW}$pid${GREEN} pausado com sucesso${NC}"
    registrar_log "PAUSA" "$pid"
    pausa_para_voltar
  else
  clear
    echo -e "${RED}Processo com PID ${YELLOW}$pid${RED} não encontrado.${NC}"
    pausa_para_voltar
  fi
}

continuar_processo() {
  read -p "Digite o PID do processo: " pid

  if ps -p "$pid" > /dev/null; then
    kill -SIGCONT "$pid"
    clear
    echo -e "${GREEN}Processo com PID ${YELLOW}$pid${GREEN} continuado com sucesso${NC}"
    registrar_log "CONTINUAR" "$pid"
    pausa_para_voltar
  else
    clear
    echo -e "${RED}Processo com PID ${YELLOW}$pid${RED} não encontrado.${NC}"
    pausa_para_voltar
  fi
}

matar_processo() {
  read -p "Digite o PID do processo: " pid

  if ps -p "$pid" > /dev/null; then
    kill -SIGKILL "$pid"
    clear
    echo -e "${GREEN}Processo com PID ${YELLOW}$pid${GREEN} matado com sucesso.${NC}"
    registrar_log "MATAR" "$pid"
    pausa_para_voltar
  else
    clear
    echo -e "${RED}Processo com PID ${YELLOW}$pid${RED} não encontrado.${NC}"
    pausa_para_voltar
  fi
}

confirmar_saida() {
  clear
  read -p "Tem certeza que deseja sair? (s/n): " confirmar
  case $confirmar in
    [sS])
      echo -e "${MAGENTA}Saindo...${NC}"
      registrar_log "ENCERRAMENTO DO GERENCIADOR" "-"
      exit 0
      ;;
    [nN])
      echo -e "${YELLOW}Saída cancelada.${NC}"
      sleep 1
      ;;
    *)
      echo -e "${RED}Opção inválida. Retornando ao menu.${NC}"
      sleep 1
      ;;
  esac
}


registrar_log "INICIO DO GERENCIADOR" "-"
while true; do
  clear
  echo ""
  echo -e "${BOLD}${BLUE}===== GERENCIADOR DE PROCESSOS =====${NC}"
  echo ""
  echo -e "${YELLOW}1 - Listar todos os processos${NC}"
  echo -e "${YELLOW}2 - Pausar um processo${NC}"
  echo -e "${YELLOW}3 - Continuar processo${NC}"
  echo -e "${YELLOW}4 - Matar processo${NC}"
  echo -e "${YELLOW}5 - Sair${NC}"
  echo ""
  echo -e "${BLUE}====================================${NC}"
  echo ""
  read -p "Escolha uma opção: " opcao

  case $opcao in
    1) listar_processos ;;
    2) pausar_processo ;;
    3) continuar_processo ;;
    4) matar_processo ;;
    5) confirmar_saida;;

    *) echo -e "${RED}Opção inválida.${NC}" ;;
  esac
done
