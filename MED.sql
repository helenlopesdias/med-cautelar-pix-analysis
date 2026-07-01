-- Análise de Eficiência do MED (Mecanismo Especial de Devolução)
SELECT  
  PARSE_DATE('%Y%m', CAST(AnoMes AS STRING)) AS data_referencia,
  ValorPixcontestadosaceitos,
  ValorPixdevolvidosintegralmente,
  ValorPixdevolvidosparcialmente, 

  ROUND(
    (ValorPixdevolvidosintegralmente + ValorPixdevolvidosparcialmente
    ) * 100.0 / NULLIF(ValorPixcontestadosaceitos, 0), 2) AS TaxaRescuperacaoPercentual
FROM 
  `clear-aurora-469314-a0.EstatisticasDoPix.fraude-pix`
