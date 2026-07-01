SELECT  
  PARSE_DATE('%Y%m', CAST(AnoMes AS STRING)) AS data_referencia,
  ValorPixcontestadosaceitos,
  -- Quanto foi recuperado?
  (ValorPixdevolvidosintegralmente  + ValorPixdevolvidosparcialmente) AS ValorRecuperado,

  ValorPixnaodevolvidossaldoinsuficiente,
  Valornaodevolvidoscontaencerrada,
  ValorPixnaodevolvidosmotivosdiversos,

  -- Qual é a taxa de recuperação do MED?
  ROUND(
    (ValorPixdevolvidosintegralmente + ValorPixdevolvidosparcialmente
    )  / NULLIF(ValorPixcontestadosaceitos, 0), 4) AS TaxaRescuperacaoPercentual,

-- Taxa de perda por saldo insuficiente
    ROUND(
      ValorPixnaodevolvidossaldoinsuficiente
      / ValorPixcontestadosaceitos, 4
    ) AS TaxaPerdaSaldoInsuficiente,

    ROUND(
      ValorPixnaodevolvidosmotivosdiversos
      / ValorPixcontestadosaceitos, 4
    ) AS TaxaPerdaMotivoDiv,

    ROUND(
      Valornaodevolvidoscontaencerrada
    )
FROM 
  `clear-aurora-469314-a0.EstatisticasDoPix.fraude-pix`
ORDER BY 
  data_referencia
