# Relatório Interativo: Funcionários x Departamentos

## **Processo de Limpeza e Transformação dos Dados**

O banco de dados utilizado passou por uma profunda limpeza e transformação no Power BI para garantir a consistência e qualidade dos dados, incluindo:

### 1. **Tabela `Employee`**
- **Colunas removidas:** `BDate`, `Address`, `F-Name`, `Minit`, `Lname` (informações irrelevantes foram descartadas).
- **Nome Completo:** Mesclagem de colunas para criar a coluna `Nome Completo`, simplificando a exibição.
- **Remoção de duplicatas:** Garantimos que não houvesse registros de funcionários com nomes duplicados.
- **Salário:** Padronização do campo `Salary` em formato decimal fixo.
- **Gerentes:** Funcionários foram associados aos seus gerentes; valores nulos em `Super_ssn` foram substituídos pela palavra "Gerente".

### 2. **Mesclagem**

#### 2.1.  `Department`
- A tabela de funcionários foi mesclada com a tabela `Department`, mantendo apenas o nome do departamento, facilitando a análise.

#### 2.2.  `Dept_Locations`
- Mesclamos os dados com a tabela `Dept_Locations`, deixando apenas a localização do departamento visível, para maior clareza sobre onde cada setor está localizado.

#### 2.3. `Project`
- Por fim, os dados foram mesclados com a tabela de projetos, unificando informações de localização, horas trabalhadas e associação de funcionários a projetos. Registros com horas zeradas foram removidos, resultando em uma análise mais precisa.

<br>

## **O que você vai encontrar no Dashboard?**

![image](https://github.com/user-attachments/assets/d580ef56-b08d-4643-99c7-d8acf935109a)

Nosso dashboard foi desenhado para oferecer uma experiência intuitiva e rica em detalhes. Aqui estão os principais insights:

- **Média Salarial:** R$35,13 mil, proporcionando uma visão clara da remuneração dos colaboradores.
- **Contagem de Funcionários:** A empresa conta atualmente com 8 funcionários.
- **Funcionários por Departamento:** Um gráfico de radar interativo mostra a distribuição dos funcionários por departamentos, como:
  - Research (27)
  - Administration (12)
  - Headquarters (1)

<br>
