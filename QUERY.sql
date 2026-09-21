WITH base AS(
SELECT
  PARSE_DATE('%Y%m', CAST(AnoMes AS STRING)) AS Data_Referencia, 
 
  Qtdecontestacoesaceitas AS QtdFraudes,
  QuantidadedevolvidaintegralmentepormeiodoMED AS QtdRecIntegralmente,
  QuantidadedevolvidaparcialmentepormeiodoMED AS QtdRecParcialmente,
  QtdePixbloqueadoscautelarmenteeliberados AS QtdBloqLiberado,
  QtdePixbloqueadoscautelarmenteedevolvidos AS QtdBloqRec,

  ValorPixcontestadosaceitos / 100 AS ValorFraudado,
  
  ValorPixdevolvidosintegralmente / 100 AS ValorRecIntegralmente,
  ValorPixdevolvidosparcialmente / 100 AS ValorRecParcialmente,
  (ValorPixdevolvidosintegralmente + ValorPixdevolvidosparcialmente) / 100 AS ValorTotalRec,

  ValorPixnaodevolvidossaldoinsuficiente / 100 AS ValorNaoRecSaldoInsuf, 
  Valornaodevolvidoscontaencerrada / 100 ValorNaoRecContaEncerrada,
  ValorPixnaodevolvidosmotivosdiversos / 100 ValorNaoRecMotivosDiversos,
  ValorPixresidualnaodevolvido / 100 ValorResidualNaoRec,
  
  ValorPixbloqueadoscautelarmenteedevolvidos / 100 AS ValorBloqRec,
  ValorPixbloqueadoscautelarmenteeliberados / 100 AS ValorBloqLiberado,

FROM `clear-aurora-469314-a0.EstatisticasDoPix.fraude-pix`
)

SELECT
  *,
  ROUND(
    ValorTotalRec / NULLIF(base.ValorFraudado, 0), 4) AS TaxaValorRec

FROM
  base
ORDER BY 
  base.Data_Referencia
