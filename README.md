# festpay_pocket_app

Projeto de prova de conceito para a FestPay realizado em Flutter, com o objetivo de criar um aplicativo de carrinho de compras.

## Tecnologias utilizadas

1 - **dotenv**: Para praticar segurança e não expor as apis do projeto;

2 - **Clean Architecture**: Aplicada de forma a facilitar o crescimento e manutenção do app;

3 - **Gestão de estados com BLOC (obrigatório)**: Tecnologia mais utilizada no mercado para gerenciamento de estados;

4 - **Modular**: Utilizei o Modular para praticar sua configuração inicial, injeção de dependências e a navegação;

5 - **Dio**: Para consumir as REST Api's;

6 - **FVM**: Para controle de versão do Flutter;

7 - **IDE utilizada**: VsCode;

8 - **Emulador utilizado**: XCode;


## Estrutura das pastas

Segue abaixo resumo das pastas criadas por mim e sua estrutura

1 - **FESTPAY_POCKET_APP**: Pasta raiz do projeto:

- 1.1 - **assets**: contém todos os assets estáticos uilizados no projeto

    - 1.1.1 - **assets/images**: contém as imagens utilizadas no projeto, retiradas diretamente do figma e em tamanhos variados 1x, 2x, 3x;

    - 1.1.2 - **assets/icons**: contém os ícones utilizados no projeto, retirados do figma em tamanhos variados 1x, 2x, 3x;

- 1.2 - **lib**: pasta que contém toda a aplicação em Flutter;

    - 1.2.1 **main.dart**: arquivo que executa a aplicação;

    - 1.2.2 **lib/app**: pasta que contem todo código da aplicação;

- 1.3 - **.env**: arquivo que contém a api a ser consumida;

## Arquitetura do projeto

O projeto foi implementado utilizando o padrão da Clean Architecture e também foi aplicada Modularização no qual é possível criar pequenos projetos referentes a determinadas funcionalidades do sistema.
 

1 - **app**: pasta que contem todo código da aplicação;

- 1.1 **app/config**: Pasta que contém toda configuração geral para inicialização do projeto

    - 1.1.1 **app/config/app_initialization**: Contém toda lógica e funções chamadas na execução do projeto, direto no arquivo main.dart;

    - 1.1.2 **app/config/themes**: Contém toda a configuração de temas, cores e fontes para sempre consumir do mesmo lugar, facilitando manutenção do projeto;

- 1.2 **app/core**: Pasta que contém dados, funções, classes e widgets que poderão ser compartilhados por todos os futuros módulos;

    - 1.2.1 **app/core/services**: Contém interfaces gerais de serviço como httpClient e networkChecker e suas implementações, que serão utilizados em todo o escopo do projeto;

    - 1.2.2 **app/core/utils**: Pasta onde foram armazenados componentes e classes úteis para todo o sistema como formatadores de texto, constantes, etc.

    - 1.2.3 **app/core/widgets**: Pasta onde foram colocados widgets que seriam utilizados em todo o escopo do projeto.

- 1.3 **app/modules**: Pasta que contém todos os módulos criados para o projeto, como era uma aplicação simples foi criado apenas um, o ProductsModule.

## Módulos do Projeto

A ideia da modularização é fracionar o projeto em pequenos outros, portanto, cada pasta de módulo deverá conter sua própria arquitetura, a aplicada no ProductModule foi a Clean Architecture com a seguinte configuração:

1 - **ProductModule**: 

- 1.1 **data**: Camada responsável pela comunicação com as fontes de dados remotas ou locais

    - 1.1.1 **datasources**: Local onde estão contidas a interface e todas as funções de comunicação à fonte externa de dados.

    - 1.1.2 **models**: Pasta que contém as classes que recebem os dados externos e fazem suas transformações para as classes do sistema;

    - 1.1.3 **repositories**: Contém a implementação dos repositórios, que fazem a comunicação externa com a camada de regra de negócio;

- 1.2 **domain**: Camada responsável por armazenar a regra de negócio e fazer a comunicação entre os datasources e o layout

    - 1.2.1 **entities**: Pasta que contém as classes modeladas para serem consumidas e utilizadas dentro do sistema, principalmente nas telas;

    - 1.2.2 **repositories**: Contém as classes abastratas (interfaces) dos repositories, que são implementados na camada de data;

    - 1.2.3 **usecases**: Pasta que contém os usecases, camadas de comunicação direta com as camadas de layout;
        
- 1.3 **presentation**: Camada de layouts e estados da aplicação;

    - 1.3.1 **blocs**: Pasta que contém todos os arquivos de gerenciamento de estados do módulos;

    - 1.3.2 **pages**: Pasta com o layout das páginas da aplicação;

    - 1.3.3 **widgets**: Pasta que contém componentes menores de layout das páginas;

## Como configurar

Este projeto é foi desenvolvido em Flutter e utilizando fvm. A versão do Flutter utilizada foi a 3.29.2.

Para rodar esse projeto deve-se utilizar essa versão, para isso pode-se baixar ela diretamente do site do framework, ou utilizando o FVM

## Baixando pelo site

Segue abaixo a documentação de como instalar o Flutter em cada sistema operacional:

1 - macOS: https://docs.flutter.dev/get-started/install/macos/mobile-ios

2 - windows: https://docs.flutter.dev/get-started/install/windows/mobile

3 - linux: https://docs.flutter.dev/get-started/install/linux/android

## Utilizando o fvm

Segue a documentação para instalação do fvm: https://fvm.app/documentation/getting-started/installation

Após sua instalação basta usar o comando fvm use 3.29.2 no terminal dentro da pasta do projeto e será aplicada essa versão do Flutter.

Obs.: Caso tenha algum problema tente limpar o cache com fvm flutter clean, e recuperar as dependências com o fvm flutter pub get.

## Links

Para o caso de não conseguir rodar o projeto segue vídeos da aplicação rodando localmente para melhor avaliação se necessário:

1 - Vídeo da aplicação rodando localmente no cenário de sucesso na compra: https://drive.google.com/file/d/1tiU1qZowlH63O_yY6MbQ3ojOn7U5PVkG/view;

2 - Vídeo da aplicação rodando localmente no cenário de erro na compra: https://drive.google.com/file/d/1CutENDscG5jNohlNv6ef6ZznI-pY4lTq/view?usp=sharing
