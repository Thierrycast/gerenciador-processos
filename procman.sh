listar_processos() {
  echo -e "PID\tUSUÁRIO\tCPU%\tMEM%\tTEMPO\tESTADO\tCOMANDO"
  echo "-------------------------------------------------------------"
  ps -eo pid,lstart,user,%cpu,%mem,etime,stat,cmd --sort=-%cpu | tail -n 15

}

pausar_processo() {
  read -p "Digite o PID do processo: " pid

    if ps -p "$pid" > /dev/null; then
      kill -SIGSTOP "$pid"
      echo "Processo pausado com sucesso."
    else
      echo "Processo nao encontrado."
    fi
}

continuar_processo() {
  read -p "Digite o PID do processo: " pid

    if ps -p "$pid" > /dev/null; then
      kill -SIGCONT "$pid"
      echo "Processo continuado com sucesso."
    else
      echo "Processo nao encontrado."
    fi
}

matar_processo() {
  read -p "Digite o PID do processo: " pid

    if ps -p "$pid" > /dev/null; then
      kill -SIGKILL "$pid"
      echo "Processo matado com sucesso."
    else
      echo "Processo nao encontrado."
    fi
}


while true; do
  echo ""
  echo "===== GERENCIADOR DE PROCESSOS ====="
  echo ""
  echo "1 - Listar todos os processos"
  echo "2 - Pausar um processo"
  echo "3 - Continuar processo"
  echo "4 - matar processo"
  echo "5 - Sair"
  echo ""
  echo "===================================="
  echo ""
  read -p "Escolha uma opção: " opcao

  case $opcao in
    1) listar_processos ;;
    2) pausar_processo ;;
    3) continuar_processo ;;
    4) matar_processo ;;
    5) echo "saindo..."; break ;;
    *) echo "Opção inválida" ;;
  esac
done