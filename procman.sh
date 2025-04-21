# === Cores ===
NC='\033[0m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'

listar_processos() {
  echo -e "${BOLD}${CYAN}PID\tUSUÁRIO\tCPU%\tMEM%\tTEMPO\tESTADO\tCOMANDO${NC}"
  echo -e "${CYAN}-------------------------------------------------------------${NC}"
  ps -eo pid,lstart,user,%cpu,%mem,etime,stat,cmd --sort=-%cpu | tail -n 15
}

pausar_processo() {
  read -p "Digite o PID do processo: " pid

  if ps -p "$pid" > /dev/null; then
    kill -SIGSTOP "$pid"
    echo -e "${GREEN}Processo pausado com sucesso.${NC}"
  else
    echo -e "${RED}Processo não encontrado.${NC}"
  fi
}

continuar_processo() {
  read -p "Digite o PID do processo: " pid

  if ps -p "$pid" > /dev/null; then
    kill -SIGCONT "$pid"
    echo -e "${GREEN}Processo continuado com sucesso.${NC}"
  else
    echo -e "${RED}Processo não encontrado.${NC}"
  fi
}

matar_processo() {
  read -p "Digite o PID do processo: " pid

  if ps -p "$pid" > /dev/null; then
    kill -SIGKILL "$pid"
    echo -e "${GREEN}Processo matado com sucesso.${NC}"
  else
    echo -e "${RED}Processo não encontrado.${NC}"
  fi
}

while true; do
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
    5) echo -e "${MAGENTA}Saindo...${NC}"; break ;;
    *) echo -e "${RED}Opção inválida.${NC}" ;;
  esac
done
