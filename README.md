# 📊 Análise da Efetividade do MED e do Bloqueio Cautelar no Pix (2022–2026)

## 📌 Sobre o Projeto

Este projeto tem como objetivo analisar a efetividade do **MED (Mecanismo Especial de Devolução)** e do **Bloqueio Cautelar**, mecanismos criados pelo Banco Central do Brasil para auxiliar na recuperação de valores transferidos via Pix em casos de fraude.

A análise foi desenvolvida utilizando dados públicos disponibilizados pelo Banco Central e tem foco em responder perguntas como:

* Quanto do valor fraudado é efetivamente recuperado?
* Quais são as principais causas da não recuperação dos recursos?
* O crescimento das fraudes acompanha o crescimento do Pix?
* O bloqueio cautelar tem sido eficiente na recuperação de valores?
* Como os indicadores evoluíram ao longo do tempo?

---

## 🎯 Objetivos da Análise

* Avaliar a eficiência do MED na recuperação de valores contestados.
* Avaliar a efetividade do bloqueio cautelar.
* Identificar os principais fatores que impedem a devolução dos recursos.
* Comparar a evolução das fraudes com o crescimento do ecossistema Pix.
* Transformar dados públicos em indicadores úteis para tomada de decisão.

---

## 📚 Fontes de Dados

### Banco Central do Brasil – Dados Abertos

Foram utilizadas duas bases públicas:

#### 1. Estatísticas de Fraudes no Pix
Contém informações sobre:
* Contestações aceitas
* Valores fraudados
* Valores recuperados integralmente
* Valores recuperados parcialmente
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

## 🧠 Desafios Técnicos Solucionados

* **Modelagem de Dados e Engenharia de Atributos:** Tratamento, limpeza e unificação de bases de dados distintas do Banco Central utilizando SQL no BigQuery.
* **Inteligência de Tempo com DAX:** Criação de medidas robustas e normalizadas, como o cálculo dinâmico da *Quantidade de Fraudes por Milhão de Transações*, isolando distorções de escala temporal.
* **UX/UI Design Avançado:** Desenvolvimento de um layout personalizado com tema escuro (*Dark Mode*), focado em storytelling analítico (divisão clara entre os fluxos do MED e do Bloqueio Cautelar) e aplicação de eixos secundários para manter a legibilidade em cenários de alta disparidade de escala (Trilhões vs. Bilhões).

---

## 📈 Principais Indicadores (KPIs)

### MED
* Valor Total Contestado
* Valor Total Recuperado
* Taxa de Recuperação por Valor
* Quantidade de Recuperações Integrais
* Quantidade de Recuperações Parciais
* Principais Causas de Não Recuperação

### Bloqueio Cautelar
* Valor Total Bloqueado
* Valor Bloqueado e Recuperado
* Taxa de Conversão do Bloqueio em Recuperação

### Ecossistema Pix
* Valor Total Transacionado
* Quantidade de Transações
* Índice de Fraudes por Milhão de Transações

---

## 🔍 Principais Insights

### Recuperação de Valores
Entre janeiro de 2022 e abril de 2026:
* Foram contestados aproximadamente **R$ 22,8 bilhões** em operações consideradas fraudulentas.
* Apenas **R$ 1,98 bilhão** foi recuperado por meio do MED.
* A taxa geral de recuperação ficou em aproximadamente **8,7%**.

---

### Principal Gargalo do MED
A principal causa da não recuperação dos recursos foi a falta de saldo nas contas de destino no momento da denúncia:

| Motivo             | Participação |
| ------------------ | -----------: |
| Saldo insuficiente |        86,2% |
| Conta encerrada    |        10,1% |
| Outros motivos     |         3,7% |

Isso sugere que o principal desafio não está necessariamente na identificação da fraude pelas instituições, mas na rapidez do processo para indisponibilizar os recursos antes que os valores sejam pulverizados.

---

### Evolução das Fraudes
Apesar do crescimento contínuo do volume transacionado via Pix, o índice de fraudes por milhão de transações apresentou tendência de queda ao longo do período analisado, indicando maturidade e eficiência das barreiras de segurança do ecossistema.

---

### Bloqueio Cautelar
* Mais de **R$ 109 bilhões** foram bloqueados cautelarmente de forma preventiva pelos bancos receptores.
* Cerca de **R$ 3,06 bilhões** foram efetivamente recuperados.
* A taxa média de conversão do bloqueio em recuperação foi de aproximadamente **2,8%**.

Os resultados indicam que, embora o bloqueio cautelar movimente volumes expressivos de recursos por segurança algorítmica, a maior parte desse montante acaba sendo liberada após a validação da legitimidade da transação.

---

## ⚠️ Limitações da Análise

* Os dados são agregados mensalmente e não permitem análises em nível individual de transação.
* Não é possível medir o tempo exato decorrido entre a fraude, a contestação e a recuperação.
* Não é possível concluir se o MED reduz a ocorrência de novas fraudes, pois o mecanismo atua de forma reativa, após a fraude ter ocorrido.
* Os dados de transações Pix não incluem operações realizadas entre contas da mesma instituição financeira.

---

## 📊 Dashboard

![Visualização do Dashboard](caminho_da_sua_imagem.png=)
[
O dashboard apresenta:
* Evolução do volume transacionado e dos valores recuperados
* Taxa de recuperação ao longo do tempo
* Principais causas de perda
* Evolução do índice de fraudes por milhão de transações
* Indicadores de bloqueio cautelar
* Comparação entre volume de fraudes e sucesso de recuperação

---

## 🚀 Possíveis Evoluções

* Análise sazonal de fraudes focada em períodos específicos (feriados nacionais, datas comerciais e final de ano).
* Construção de modelos de previsão utilizando séries temporais para projeção de tentativas de fraudes.
* Aplicação de modelos estatísticos para identificação profunda de tendências de comportamento de contas laranjas.

---

### Autora

**Helen Lopes Dias**  
Estudante de Gestão da Tecnologia da Informação com foco em Análise de Dados, SQL, Power BI e Business Intelligence.
