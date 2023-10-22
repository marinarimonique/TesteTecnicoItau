#language: pt

Funcionalidade: Elegibilidade de Cliente

  @cliente_elegivel
  Esquema do Cenario: Validar a elegibilidade de cliente
    Dado que desejo validar se o cliente é elegivel
    E o campo "indicador_conta_ativa" preenchido com valor "S"
    E o campo "indicador_cliente_correntista" preenchido com valor "S"
    E o campo "codigo_tipo_produto_oferta" preenchido com "<oferta>"
    E o campo "codigo_produto_origem" preenchido com "<origem>"
    Quando realizar a requisicao na aplicacao de elegibilidade
    Entao a API ira retornar código 201 e mensagem positiva

    Exemplos:
      |oferta |origem |
      |AB 	  |1234	  |
      |CB 	  |5678	  |
      |DC 	  |7722	  |
      |AB 	  |5564	  |
      |CB 	  |2286	  |
      |DC 	  |5561	  |

  @cliente_elegivel
  Esquema do Cenario: Validar a não elegibilidade de cliente
    Dado que desejo validar se o cliente é elegivel
    E o campo "indicador_conta_ativa" preenchido com valor "<conta>"
    E o campo "indicador_cliente_correntista" preenchido com valor "<correntista>"
    E o campo "codigo_tipo_produto_oferta" preenchido com "<oferta>"
    E o campo "codigo_produto_origem" preenchido com "<origem>"
    Quando realizar a requisicao na aplicacao de elegibilidade
    Então a API ira retornar código 201 e mensagem negativa

    Exemplos:
      |conta  |correntista|oferta|origem|
      |S 	  |N 		  |AB 	 |1234	|
      |N 	  |S 		  |AB 	 |1234	|
      |S 	  |S 		  |CC 	 |1234	|
      |S 	  |S 		  |CD 	 |1234	|
      |S 	  |S 		  |AC 	 |1234	|
      |S 	  |S 		  |AB 	 |5555	|
      |S 	  |S 		  |AB 	 |7777	|
      |S 	  |S  		  |AB 	 |8888	|
      |S 	  |S 		  |AB 	 |9999	|
      |S 	  |S 		  |AB    |1010	|

  @cliente_elegivel
  Cenario: Validar a elegibilidade de cliente com mais de um contrato
    Dado que desejo validar a elegibilidade de um cliente com mais de um contrato
    Quando realizar a requisicao na aplicacao de elegibilidade
    Então a API ira retornar código 201 e mensagem positiva

  @cliente_elegivel
  Cenario: Validar a não elegibilidade de cliente com mais de um contrato
    Dado que desejo validar a não elegibilidade de um cliente com mais de um contrato
    Quando realizar a requisicao na aplicacao de elegibilidade
    Então a API ira retornar código 201 e mensagem negativa

  #Cenario nao automatizado
  Cenario: Validar requisicao com algum campo nulo
    Dado que desejo validar se o cliente é elegivel
    Quando realizar a requisicao na aplicacao de elegibilidade
    E o campo "indicador_conta_ativa" preenchido com valor "S"
    E o campo "indicador_cliente_correntista" preenchido com valor "S"
    E o campo "codigo_tipo_produto_oferta" preenchido com "AB"
    Entao a API ira retornar código 500 e mensagem de erro