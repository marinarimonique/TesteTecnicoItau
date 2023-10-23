#language: pt

Funcionalidade: Validador de senha

    Como Product Analytics
    Gostaria de ter um validador de senha
    Para não permitir que nossos clientes cadastrem senhas inválida

    Quais questionamentos podem ser feitos para entender o pedido realizado?

        - Em qual jornada essa senha será solicitada?
        - Quais regras técnicas validarão a senha?
            -> Número mínimo de dígitos?
            -> Necessidade de caracteres especiais?
            -> Apenas números/apenas letras/necessidade de número e letra;
        - Quais regras de segurança precisam ser validadas?
            -> Permissão de número sequencial? Data de aniversário?
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