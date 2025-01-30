# 🌟 Star Schema - Modelo de Dados Professor 🌟

Desafio proposto do curso de Power BI do Bootcamp da Dio ministrado pela Juliana Mascarenhas

## Objetivo:

Criar o diagrama dimensional – star schema – com base no diagrama relacional disponibilizado.

## Foco:

### Professor – objeto de análise

Vocês irão montar o esquema em estrela com o foco na análise dos dados dos professores. Sendo assim, a tabela fato deve refletir diversos dados sobre professor, cursos ministrados, departamento ao qual faz parte.... Por aí vocês já têm uma ideia do que deve compor a tabela fato do modelo em questão.

Obs.: Não é necessário refletir dados sobre os alunos!

## O que deve ser feito?

Deverá ser criada a tabela Fato que contêm o contexto analisado. Da mesma forma, é necessária a criação das tabelas dimensão que serão compostas pelos detalhes relacionados ao contexto.

Por fim, mas não menos importante, adicione uma tabela dimensão de datas. Para compensar a falta de dados de datas do modelo relacional, suponha que você tem acesso aos dados e crie os campos necessários para modelagem.

Ex: data de oferta das disciplinas, data de oferta dos cursos, entre outros. O formato, ou melhor, a granularidade, não está fixada. Podem ser utilizados diferentes formatos que correspondem a diferentes níveis de granularidade.

## Base

![image](https://github.com/user-attachments/assets/a65433c9-0d20-412a-9156-7ab223048f2b)


## 📊 Visão Geral do Modelo - Star Schema Professor

### Tabela Fato: Fato_Professor 👩‍🏫
Essa tabela centralizará os dados das aulas ministradas pelos professores.

#### Chaves Estrangeiras (FKs):

- **idProfessor (Dimensão Professor)**
- **idCurso (Dimensão Curso)**
- **idDepartamento (Dimensão Departamento)**
- **idDisciplina (Dimensão Disciplina)**
- **idData (Dimensão Tempo)**

#### Métricas (Fatos):

- **Quantidade de disciplinas ministradas**
- **Quantidade de cursos associados**
- **Número de alunos matriculados**

### Tabelas Dimensão 📰

#### Dimensão Professor (Dim_Professor)👩‍🏫
- **idProfessor (PK)**
- **Nome**
- **Departamento**

#### Dimensão Curso (Dim_Curso)🎓
- **idCurso (PK)**
- **Nome do Curso**
- **Departamento**
  
#### Dimensão Departamento (Dim_Departamento)🏢
- **idDepartamento (PK)**
- **Nome do Departamento**
- **Campus**
  
#### Dimensão Disciplina (Dim_Disciplina)📘
- **idDisciplina (PK)**
- **Nome da Disciplina**
- **Professor Responsável**
  
#### Dimensão Data (Dim_Data) ⌚
- **idData (PK)**
- **Ano**
- **Semestre**
- **Mês**


![prifessor](https://github.com/user-attachments/assets/febcc47a-30ff-4645-b615-7a068cb3f4d5)

