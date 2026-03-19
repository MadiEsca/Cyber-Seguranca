/* Código 1.1 */

#include <signal.h>
#include <stdio.h>
#include <stdlib.h>

void RelerConfiguracao(int signal)
{
  printf("Recebeu sinal %d\n", signal);
  printf("Reler arquivos de configuração ...\n");
}

int main()
{
  signal(SIGHUP, RelerConfiguracao);
  while(1); //Loop infinito
  return 0; //Apenas para evitar warnings durante a compilação
}
