# AP3-BI
Entrega de trabalho AP3 - Técnica de inteligência de negócios - O projeto consiste na elaboração dos requisitos, estrutura e montagem de um sistema BI para uma empresa fictícia

# 1	Introdução
Este documento tem por finalidade coletar, analisar e definir as principais necessidades do projeto do estudo de caso Loca Bike. O documento procura demonstrar os principais problemas atuais e o foco investigativo desejado pelo cliente.
 
# 2	Estudo de Caso

2.1	Descrição do Estudo de Caso

A Loca Bike é uma empresa de locação de bicicletas onde o cliente pode em qualquer filial locar sua bicicleta por um tempo determinado, de acordo com o tipo de necessidade do cliente. As filiais dispõem de três tipos de bicicletas, são elas:
•	Passeio - Bicicletas 18 marchas para uso geral.
•	Carga - Bicicletas marcha simples com bagageiro para transporte.
•	Dupla - Bicicletas para passeios de dois passageiros ao mesmo tempo.
Atualmente a empresa possui 10 filiais no Rio de Janeiro, 50 funcionários e planos para expansão. 

Como plano de expansão a empresa pretende implementar um sistema de monitoramento inteligente, a fim de, identificar possíveis pontos de melhoria, acompanhar de forma mais rápida os resultados obtidos a partir dos planos estratégicos desenvolvidos, bem como possíveis pontos de falha no plano. Todos os requisitos foram detalhados no Anexo 2 – Documento de Requisitos.

Como solução apesentamos um projeto de BI que consiste no estudo dos dados gerados pelos sistemas de informação utilizados pela empresa, através dele será possível acompanhar de formar rápida e inteligente indicadores para extrair informações de grande importância estratégica, a fim de, auxiliar a gestão do negócio, tudo produzido de forma automática, sem interferir nos sistemas de informação da empresa. 

# 3	Descrição do Modelo Transacional
3.1	Fonte 1 – Sistema PDV FakeSystems
O sistema é desenvolvido em C e mantem as informações em banco de dados relacional PostgreSQL. O modelo transacional está representado na Figura 1 - Modelo Transacional.

![Transacional](https://user-images.githubusercontent.com/55721262/141860666-7080c79a-b063-4a42-9691-580e270a9b61.png)

Figura 1 - Modelo Transacional
 
# 4	Proposta de Processo de BI  
Esta seção apresenta o processo de BI proposto para o projeto.

A proposta do projeto de BI é representada a partir do croqui estabelecido na Figura 2.

![Captura de tela 2021-11-15 190823](https://user-images.githubusercontent.com/55721262/141860796-1298ca1c-e35c-48f5-ae72-de803f9af322.png)

Figura 2 – Croqui do projeto
 
# 5	Modelo Multidimensional
Esta seção apresenta o modelo estrela (star schema) do estudo de caso Loca Bike.
O modelo do Data Warehouse utilizado neste projeto é o Star Schema (Modelo Estrela e está representado na Figura 03.

![Multidimensional-controle-de-versão](https://user-images.githubusercontent.com/55721262/141860816-9b51e27c-ae76-4348-b4c2-72e268016cb8.png)

Figura 3 – Modelo Mutidimensional
 
# 6	Elaboração do Data Warehouse
O Data Warehouse será a fonte integradora de informações da empresa, a tecnologia será utilizada com o intuito de servir de base para a camada de aplicação que será responsável por fornecer dados para a tomada de decisão na organização.

6.1	Definição do DW

6.1.1	Arquitetura

Global – Teremos apenas um Data Wharehouse para toda a organização.

6.1.2	Abordagem de Construção
Não se aplica.

6.1.3	Arquitetura Física
On-Primeses – A empresa dispões de servidores físicos que atendem a todo pátio dos sistemas de informação e já possui um servidor designado para hospedar a base.
 
# 7	Projeto de ETL
7.1	Descrição do Projeto de ETL

A base do sistema transacional apresenta boa estrutura de dados, além de uniformidade dos dados, por isso, o tratamento dos dados na faze de ETL possuem poucos passos a serem apresentados.

![image](https://user-images.githubusercontent.com/55721262/141861367-c8c5aecc-ffb8-45fd-81d3-a02704263ac9.png)

Figura 4 – Fluxo ETL

7.1.1	Dimensão Bicicleta
A base das bicicletas cadastradas, possuem os mesmos atributos necessário para construção da dimenção bicicleta.
Como tipo de atualização, pretende-se registrar o histórico apenas dos valores da locação das bicicletas.
 
7.1.2	Dimensão Filial
Para a dimensão filial, o atributo CNPJ é removido por não interferir no resultado da consulta.

7.1.3	Dimensão Funcionário
A dimensão funcionário precisou de um pouco mais de tratamento tendo em vista principalmente a estrutura contemplada para as tabelas funcionário e pessoa que são seraparadas e relacionadas através de generalizaçõ com especialização.

7.1.4	Tabela Fato
Para tabela fato, são aplicados dois calculos necessários para obtenção do atributo derivado Valor total.

# 8	Dashboard

8.1	Descrição da Elaboração
Para criação dos Dashboards, foi utilizada a ferramenta Power BI da Microsoft, toda o tratamento dos dados foi realizado no Pentaho Data Integration.

8.2	Telas do Dashboard
8.2.1	Financeiro:

![Tela Financeiro 00](https://user-images.githubusercontent.com/55721262/141860957-79048853-279e-4699-a9a5-02161fbd2cad.png)
Aplicando filtros:
![Tela Financeiro 01](https://user-images.githubusercontent.com/55721262/141860978-f070fe25-4053-4e09-b2ef-f62cae4d7b0e.png)
Ao clicar em qualquer indicador, automaticamente são aplicados filtros referentes ao indicador selecionado nos demais gráficos.
![Tela Financeiro 02](https://user-images.githubusercontent.com/55721262/141861002-c7c2a068-0317-4338-abfa-18e9ddf42b3e.png)

8.2.2	Operacional:

![Tela Operacional 00](https://user-images.githubusercontent.com/55721262/141861018-39426b4f-2ec5-4d76-855f-73f3d336e7a7.png)
Aplicando filtros:
![Tela Operacional 01](https://user-images.githubusercontent.com/55721262/141861058-22fb2e27-8ed0-47fd-a61b-dba0833a84ea.png)
Ao clicar em qualquer indicador, automaticamente são aplicados filtros referentes ao indicador selecionado nos demais gráficos.
![Tela Operacional 02](https://user-images.githubusercontent.com/55721262/141861069-7b4dd8d8-4ce2-4146-b55d-ccea231a07c5.png)
 
# 9	Conclusão

Através da aplicação dos conceitos e ferramentas, aprendidos em sala de aula, foi possível construir um sistema completo de BI, desde a elaboração e planejamento do projeto, desenvolvimento e entrega. Sendo possível também, manter o projeto caso fosse necessário.

# Ferramentas utilizadas:
   Power Architect
   PostgreSQL
   PDI - Pentaho Data Integration
   Power BI
   
   ![Captura de tela 2021-11-15 192533](https://user-images.githubusercontent.com/55721262/141862737-b1aa0033-9f27-4137-82b3-4db5b9f6d80f.png)

