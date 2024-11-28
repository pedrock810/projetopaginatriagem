# Projeto Página Triagem

- [Versão em Português](#versão-em-português)
- [English Version](#english-version)

## Versão em Português

Este projeto é um aplicativo desenvolvido com Flutter que serve como um sistema de triagem de pacientes em um hospital, integrando funcionalidades de login, cadastro e exibição de notícias. A estrutura é modular e utiliza boas práticas de desenvolvimento, incluindo a separação de responsabilidades através de classes e widgets bem definidos. O projeto se comunica com um banco de dados para autenticação de usuários e carregamento de conteúdos dinâmicos.

## Estrutura de Páginas e Funcionalidades

### LoginPage

A página de login é a porta de entrada para o sistema. Ela valida os dados inseridos pelo usuário, como e-mail e senha, utilizando uma conexão com o banco de dados.

1. Campos para e-mail e senha com validação básica.
2. Botão de login que verifica as credenciais do usuário.
3. Feedback visual em caso de erro (ex.: mensagem de e-mail ou senha incorretos).
4. Opção para criar uma nova conta que redireciona o usuário para a página de cadastro.

- TextEditingController para gerenciar os inputs de texto.
- Integração com a classe DatabaseConnection para verificação de login.
- Uso da classe Gestor para personalizar textos e estilos.

### PageOne

Essa página exibe uma lista de notícias obtidas de um servidor ou banco de dados. É uma interface voltada para o consumo de informações dinâmicas, com uma interface simples e responsiva.

1. Exibe uma lista de notícias com título, imagem e descrição.
2. A lista de notícias é carregada de forma assíncrona utilizando a classe Servidor.
3. Atualização automática da interface ao receber os dados.

- FutureBuilder (implementado de forma manual com Future e setState) para atualizar a UI dinamicamente.
- Uso de ListTile e Card para apresentar as notícias de forma organizada.
- Integração com a classe Gestor para gerenciamento de temas e definições de layout.

### Classes Auxiliares

- Gestor: Uma classe centralizada que gerencia temas, textos dinâmicos e definições estilísticas para as páginas. Ela permite que o aplicativo seja facilmente configurado para diferentes temas ou idiomas.
- Servidor: Responsável por buscar dados de um servidor externo (ex.: lista de notícias). Abstrai a lógica de comunicação para manter as páginas limpas e focadas na interface.
- DatabaseConnection: Gerencia a conexão com o banco de dados para operações de login e verificação de credenciais. É usada principalmente pela LoginPage.
- User: Armazena as informações do usuário logado, permitindo que sejam acessadas globalmente após o login.

## Algumas Capturas de Tela



## English Version

This project is an application developed with Flutter that serves as a patient triage system in a hospital, integrating login, registration and news display functionalities. The structure is modular and uses good development practices, including the separation of responsibilities through well-defined classes and widgets. The project communicates with a database for user authentication and loading dynamic content.

## Page Structure and Features

### LoginPage

The login page is the gateway to the system. It validates the user's input, such as email and password, using a connection to the database.

1. Input fields for email and password with basic validation.
2. Login button that checks user credentials.
3. Visual feedback for errors (e.g., incorrect email or password message).
4. Option to create a new account, redirecting the user to the registration page.

- TextEditingController to manage text inputs.
- Integration with the DatabaseConnection class for login verification.
- Use of the Gestor class for text and style customization.

### PageOne

This page displays a list of news articles fetched from a server or database. It is a user-friendly interface focused on consuming dynamic information.

1. Displays a list of news items, including title, image, and description.
2. News list is loaded asynchronously using the Servidor class.
3. Automatic UI update upon data reception.
   
- Manual implementation of FutureBuilder logic with Future and setState for dynamic UI updates.
- Use of ListTile and Card widgets to present the news in an organized way.
- Integration with the Gestor class for theme and layout management.

### Supporting Classes

- Gestor: A central class managing themes, dynamic text, and stylistic definitions for the pages. It allows easy customization of the app for different themes or languages.
- Servidor: Handles fetching data from an external server (e.g., news articles). Abstracts communication logic to keep pages focused on UI elements.
- DatabaseConnection: Manages database connections for login and credential verification. Primarily used by the LoginPage.
- User: Stores logged-in user information, allowing global access after login.

## Some PrintScreen
