

https://github.com/user-attachments/assets/346910be-e530-4e22-999e-418b14dfd8d3

# Análise da Efetividade do MED e do Bloqueio Cautelar no Pix (2022–2026)
---
<p align="center">
  <img src="https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/BigQuery-4285F4?style=for-the-badge&logo=googlebigquery&logoColor=white" />
  <img src="https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" />
</p>

---


## Sobre o Projeto

Este projeto tem como objetivo analisar a efetividade do **MED (Mecanismo Especial de Devolução)** e do **Bloqueio Cautelar**, mecanismos criados pelo Banco Central do Brasil para auxiliar na recuperação de valores transferidos via Pix em casos de fraude.

A análise foi desenvolvida utilizando dados públicos disponibilizados pelo Banco Central e tem foco em responder perguntas como:
* Quanto do valor fraudado é efetivamente recuperado?
* Quais são as principais causas da não recuperação dos recursos?
* O crescimento das fraudes acompanha o crescimento do Pix?
* O bloqueio cautelar tem sido eficiente na recuperação de valores?
* Como os indicadores evoluíram ao longo do tempo?

---

## Objetivos da Análise

* Avaliar a eficiência do MED na recuperação de valores contestados.
* Avaliar a efetividade do bloqueio cautelar.
* Identificar os principais fatores que impedem a devolução dos recursos.
* Comparar a evolução das fraudes com o crescimento do ecossistema Pix.
* Transformar dados públicos em indicadores úteis para tomada de decisão.

---

## Fontes de Dados

### Banco Central do Brasil – Dados Abertos

Foram utilizadas duas bases públicas:

#### 1. Estatísticas de Fraudes no Pix
Contém informações sobre:
* Contestações aceitas
* Valores fraudados
* Valores não recuperados
* Bloqueios cautelares
* Motivos de não devolução

#### 2. Estatísticas de Transações Pix
Contém informações sobre:
* Quantidade de transações
* Valor financeiro movimentado

⚠️ **Importante:** Os dados de transações Pix disponibilizados pelo Banco Central representam apenas operações que transitam entre instituições financeiras diferentes. Transferências realizadas entre contas da mesma instituição financeira não passam pela infraestrutura central do Banco Central e, portanto, não estão incluídas nessa base. Esse ponto deve ser considerado na interpretação dos indicadores relacionados ao volume total do Pix.

---

## 🛠️ Tecnologias Utilizadas

* **SQL** (Google BigQuery)
* **Power BI**
* **DAX**
* Dados Abertos do Banco Central do Brasil

---

## Desafios Técnicos Solucionados

* **Modelagem de Dados e Engenharia de Atributos:** Tratamento, limpeza e unificação de bases de dados distintas do Banco Central utilizando SQL no BigQuery.
* **Inteligência de Tempo com DAX:** Criação de medidas robustas e normalizadas, como o cálculo dinâmico da *Quantidade de Fraudes por Milhão de Transações*, isolando distorções de escala temporal.
* **UX/UI Design Avançado:** Desenvolvimento de um layout personalizado com tema escuro (*Dark Mode*), focado em storytelling analítico (divisão clara entre os fluxos do MED e do Bloqueio Cautelar) e aplicação de eixos secundários para manter a legibilidade em cenários de alta disparidade de escala (Trilhões vs. Bilhões).

---

## Principais Insights

### Recuperação de Valores
Entre janeiro de 2022 e abril de 2026:
* Foram contestados aproximadamente **R$ 22,8 bilhões** em operações consideradas fraudulentas.
* Apenas **R$ 1,98 bilhão** foi recuperado por meio do MED.
* A taxa geral de recuperação ficou em aproximadamente **8,7%**.

---

### Principal Gargalo do MED
A principal causa da não recuperação dos recursos foi a falta de saldo nas contas de destino no momento da denúncia:

| Motivo | Participação |
| :--- | ---: |
| Saldo insuficiente | 86,2% |
| Conta encerrada | 10,1% |
| Outros motivos | 3,7% |

Isso sugere que o principal desafio não está necessariamente na identificação da fraude pelas instituições, mas na rapidez do processo para indisponibilizar os recursos antes que os valores sejam pulverizados.

---

### Bloqueio Cautelar
* Mais de **R$ 109 bilhões** foram bloqueados cautelarmente de forma preventiva pelos bancos receptores.
* Cerca de **R$ 3,06 bilhões** foram efetivamente recuperados.
* A taxa média de conversão do bloqueio em recuperação foi de aproximadamente **2,8%**.

Os resultados indicam que a quantidade de bloqueios liberados vem diminuindo enquanto a quantidade de valor bloqueado devolvido ao remetente vem aumentando. Isso indica que o bloqueio cautelar se mostra eficiente na prevenção de fraudes.

---

## ⚠️ Limitações da Análise

* Os dados são agregados mensalmente e não permitem análises em nível individual de transação.
* Não é possível medir o tempo exato decorrido entre a fraude, a contestação e a recuperação.
* Não é possível concluir se o MED reduz a ocorrência de novas fraudes, pois o mecanismo atua de forma reativa, após a fraude ter ocorrido.
* Os dados de transações Pix NÃO incluem operações realizadas entre contas da mesma instituição financeira.

---

## Dashboard

O painel visual exibido no topo da página apresenta de forma consolidada:
* Evolução do volume transacionado e dos valores recuperados
* Taxa de recuperação ao longo do tempo
* Principais causas de perda do MED
* Evolução da quantidade de bloqueios cautelares (liberados vs. recuperados)
* Indicadores gerais de bloqueio cautelar
* Comparação entre o volume de fraudes e o sucesso de recuperação de ativos

---

<a href="https://github.com/helenlopesdias/med-cautelar-pix-analysis/raw/refs/heads/main/med-cautelar-pix-analysis.pbix">
  <img width="1061" alt="Dashboard Análise MED e Bloqueio Cautelar Pix" src="https://github.com/user-attachments/assets/1bc2aaf7-069c-4614-83e7-e9ad20978053">
</a>

<p align="center">
  <strong>*Para visualizar e interagir com o dashboard, CLIQUE na imagem e para fazer o download do arquivo e abra-o no Power BI Desktop.*</strong>
</p>


