# 🧠 Gerenciador de Processos - Bash

Um projeto simples em Shell Script para gerenciar processos no Linux, desenvolvido como parte de um desafio técnico.

## 🚀 Funcionalidades

- Listagem de processos em execução com:
  - PID
  - Usuário
  - Consumo de CPU
  - Memória
  - Tempo de execução
  - Estado
  - Comando
- Pausar um processo (SIGSTOP)
- Continuar um processo pausado (SIGCONT)
- Matar um processo (SIGKILL)
- Registro de todas as ações em um arquivo de log (`procman.log`)

## ▶️ Como executar

1. Clone o repositório:
   ```bash
   git clone git@github.com:Thierrycast/gerenciador-processos.git
   cd gerenciador-processos
   ```

2. Dê permissão de execução ao script:
   ```bash
   chmod +x procman.sh
   ```

3. Execute o script:
   ```bash
   ./procman.sh
   ```

