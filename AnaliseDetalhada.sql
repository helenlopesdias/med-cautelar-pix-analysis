WITH base AS(

SELECT 
  PARSE_DATE('%Y%m', CAST(AnoMes AS STRING)) AS Data_Referencia,
  QtdePixcontestados,
  Qtdecontestacoesaceitas AS QtdFraudes,
 
  QuantidadedevolvidaintegralmentepormeiodoMED AS QtdRecIntegralmente,
  QuantidadedevolvidaparcialmentepormeiodoMED AS QtdRecParcialmente,
 
  ValorPixcontestadosaceitos AS ValorFraudado,

  ValorPixdevolvidosintegralmente AS ValorRecIntegralmente,
  ValorPixdevolvidosparcialmente AS ValorRecParcialmente,
  
  ValorPixnaodevolvidossaldoinsuficiente AS ValorNaoRecSaldoInsuf,
  Valornaodevolvidoscontaencerrada AS ValorNaoRecContaEncer,
  ValorPixnaodevolvidosmotivosdiversos AS ValorNaoRecMotivosDiv,
 
  ValorPixbloqueadoscautelarmenteedevolvidos AS ValorBloqDevolvido,
  ValorPixbloqueadoscautelarmenteeliberados AS ValorBloqLiberado,

-- Valor Total Recuperado:
  (ValorPixdevolvidosintegralmente +
  ValorPixdevolvidosparcialmente)  AS ValorTotalRec,

-- Valor Total Não Recuperado: 
    (Valornaodevolvidoscontaencerrada +
    ValorPixnaodevolvidosmotivosdiversos +
    ValorPixnaodevolvidossaldoinsuficiente +
    ValorPixresidualnaodevolvido
    ) AS ValorTotalNaoRec,

-- Valor Total Bloqueado:
  (ValorPixbloqueadoscautelarmenteeliberados + ValorPixbloqueadoscautelarmenteedevolvidos) AS ValorTotalBloq

FROM 
  `clear-aurora-469314-a0.EstatisticasDoPix.fraude-pix`

  )

SELECT
  *,
-- Taxa de Recuperção por Valor:
  ROUND(
    base.ValorTotalRec / NULLIF(base.ValorFraudado, 0), 4) AS TaxaValorRec,

-- Taxa de Não Recuperação por Valor:
  ROUND(
    ValorTotalNaoRec / NULLIF(ValorFraudado, 0),4) AS TaxaValorNaoRec,
  
-- Taxa Recuperação Integral Parcialmente):
  ROUND(
    (base.QtdRecIntegralmente) / NULLIF(base.QtdFraudes, 0), 4) AS TaxaQtdRecIntegral,

-- Taxa Recuperação Integral Parcialmente:
  ROUND(
    (base.QtdRecParcialmente) / NULLIF(base.QtdFraudes, 0), 4) AS TaxaQtdRecParcial,

-- Participação do Bloqueio Cautelar:
  ROUND(
    base.ValorBloqDevolvido / NULLIF(base.ValorFraudado, 0), 4) AS ParticipacaoBloqCautelar,

-- Taxa dos Bloqueios Devolvidos:
  ROUND(
    (base.ValorBloqDevolvido) / NULLIF(base.ValorTotalBloq, 0), 4) AS TaxaValorBloqDevolvido,

-- Taxa dos Bloqueios Liberado:
  ROUND(
    (base.ValorBloqLiberado) /NULLIF(base.ValorTotalBloq, 0),4) AS TaxaValorBloqLiberado

FROM 
  base
ORDER BY 
  base.Data_Referencia
