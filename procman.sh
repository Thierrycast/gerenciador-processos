listar_processos() {
  echo -e "PID\tUSUÁRIO\tCPU%\tMEM%\tTEMPO\tESTADO\tCOMANDO"
  echo "-------------------------------------------------------------"
  ps -eo pid,user,%cpu,%mem,etime,stat,cmd --sort=-%cpu | head -n 15
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
    2) echo "pausando um processo" ;;
    3) echo "continuando um processo" ;;
    4) echo "matar um processo" ;;
    5) echo "saindo..."; break ;;
    *) echo "Opção inválida" ;;
  esac
done