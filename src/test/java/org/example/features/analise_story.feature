#language: pt

Funcionalidade: Validador de senha

    Como Product Analytics
    Gostaria de ter um validador de senha
    Para não permitir que nossos clientes cadastrem senhas inválida

    Quais questionamentos podem ser feitos para entender o pedido realizado?

        - Validador de senha de qual funcionalidade? (login, transacional)
        - Regras: Senha númerica ou alfanumérica? (Se for alfanumérica, será obrigatorio letra maiuscula
        e caractere especial?)
        - Quais sao os tipos de senhas inválidas? (ex.: se for numerica, nao aceitar numeros iguais/sequenciais
        se for alfanumerica: nao aceitar caractere de pontuacao)
        - Limite de caracteres?
        - Já existem protótipos das telas?

    Visando uma melhoria no processo, para que num futuro sua modelagem seja mais eficaz,
    quais sugestões podem ser feitas para melhoria da escrita?

        A história precisa ter critérios de aceite e mais enriquecimentos de detalhes para estar no refinamento de backlog
        Acrescentar a finalidade seria interessante, pois os questionamentos seriam mais objetivos.

        Exemplo 1:

            Como Product Analytics
            Gostaria de ter um validador de senha TRANSACIONAL
            Para não permitir que nossos clientes cadastrem senhas inválidas

            Critérios de Aceite

            Dado que o cliente está na tela de senha transacional
            Quando digitar a senha
            E tocar em confirmar
            Entao deve visualizar a tela "Confirme sua senha"

            Dado que o cliente está na tela de senha transacional
            Quando digitar a senha inválida
            E tocar em confirmar
            Entao deve visualizar mensagem de senha invalida
            E botao "Tente novamente"

        Exemplo 2:

            Como Product Analytics
            Gostaria de ter um validador de senha de LOGIN
            Para não permitir que nossos clientes cadastrem senhas inválidas

            Critérios de Aceite

            Dado que o cliente está na tela de login
            Quando digitar a senha
            E tocar em confirmar
            Entao deve visualizar a dashboard

            Dado que o cliente está na tela de login
            Quando digitar a senha inválida
            E tocar em confirmar
            Entao deve visualizar mensagem de senha invalida
            E botao "Tente novamente"