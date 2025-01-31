# 🚀 Dashboard de E-commerce com Power BI Utilizando Fórmulas DAX

Este projeto faz parte do desafio do curso "Modelando um Dashboard de E-commerce com Power BI Utilizando Fórmulas DAX, utilizando um arquivo excel fornecido pela tutora Juliana Mascarenhas e o usando no Power BI para realizar as analises e o star schema.

### 🟢 Estrutura do Star Schema

**Tabela Fato**  
   A tabela fato no arquivo é a `F_Vendas`, que armazena os dados que são:
   - Unidades vendidas;
   - Preço de venda;
   - Desconto;
   - Lucro;
   - Segmento;
   - Data.

**Tabelas Dimensão:**

- **D_Calendario**: Criada com a função DAX `CALENDAR()`, facilita análises temporais com uma estrutura organizada de datas.
- **D_Categoria**: Define informações sobre o país, segmento e categoria de produto.
- **D_Descontos**: Agrupa informações específicas sobre as faixas de desconto aplicadas.
- **D_Detalhes**: Contém detalhes financeiros e temporais, como lucro, unidades vendidas e mês.
- **D_Produtos**: Dados sobre produtos, como ID, nome e métricas de vendas (médias, medianas, máximos e mínimos).
- **D_Produtos_Detalhes**: Informações detalhadas dos produtos, como faixas de desconto e preço de fabricação.


### 🟣 Transformação com Power Query

- **D_Calendario**: Usando `CALENDAR()`, geramos uma tabela organizada por datas para análises precisas de períodos.
- **Renomeando Colunas**: Nomes intuitivos trazem clareza e organização ao nosso modelo.
- **Exclusão de Colunas**: Mantemos apenas as colunas relevantes para um esquema limpo e eficiente.
- **Índices Otimizados**: Criação de índices nas colunas-chave para consultas rápidas.
- **Colunas Condicionais**: Adicionamos uma coluna condicional para segmentar produtos com base em regras definidas, revelando novos insights.

![image](https://github.com/user-attachments/assets/6cc80611-5da7-4b11-9701-4df75452b182)

### 🟡 Agrupamento e Agregação

![image](https://github.com/user-attachments/assets/4630805d-6124-4fb1-84b3-c81543ec3970)

- **Agregação Avançada**: Foi utilizado o Power Query para criar somas, médias e medianas para fornecer uma visão consolidada dos dados.
- **Agrupamento de Produtos**: Calculamos estatísticas como média, mediana, máximo e mínimo de vendas para cada produto, enriquecendo a análise.


## 📈 Visualização do Star Schema ⭐

![image](https://github.com/user-attachments/assets/e1b06314-5a06-4923-ab05-5350043170d6)
