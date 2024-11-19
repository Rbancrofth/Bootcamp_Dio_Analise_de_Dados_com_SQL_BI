## Oficina

Criar um esquema conceitual para o contexto de oficina com base na narrativa fornecida

#### Narrativa

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica. 
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas.
 - Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
 -  A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
 -  O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços.
 -  A mesma equipe avalia e executa os serviços.
 -  Os mecânicos possuem código, nome, endereço e especialidade
 -  Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

#### Relacionamentos identificados

 - Cliente-Veículo: Um cliente possui muitos veículos, mas cada veículo pertence a um único cliente (1:N).
 - Veículo-OS: Um veículo pode ter muitas ordens de serviço, mas cada ordem de serviço está associada a um único veículo (1:N).
 - Equipe-Mecânico: Uma equipe pode ter muitos mecânicos e um mecânico pode pertencer a muitas equipes (M:N).
 - Equipe-OS: Uma ordem de serviço é atribuída a uma única equipe, mas uma equipe pode realizar muitas ordens de serviço (1:N).
 - OS-Item de Serviço: Uma ordem de serviço pode ter muitos serviços associados (1:N).
 - OS-Item de Peça: Uma ordem de serviço pode ter muitas peças associadas (1:N).

#### Fluxo: 

- Entrada do Cliente: Cliente registra o Veículo.
- Criação da OS: Veículo é avaliado e uma OS é criada com os serviços e peças necessárias.
- Consulta de Valores: Tabela de mão de obra e preços de peças são utilizados para calcular o custo total.
- Autorização: O Cliente autoriza a execução da OS.
- Execução: A equipe de Mecânicos realiza os serviços.
- Conferência e Conclusão: OS é finalizada com status atualizado.

  ![oficina](https://github.com/user-attachments/assets/d833f7c8-898b-4c5b-8f4e-6ee642810397)

