use EmpresasColombianas;

--Creación de indices sobre la tabla de hechos

CREATE NONCLUSTERED INDEX IX_fact_empresa
ON dbo.fact_indicadores_financieros(id_empresa);
GO

CREATE NONCLUSTERED INDEX IX_fact_region
ON dbo.fact_indicadores_financieros(id_region);
GO

CREATE NONCLUSTERED INDEX IX_fact_departamento
ON dbo.fact_indicadores_financieros(id_departamento);
GO

CREATE NONCLUSTERED INDEX IX_fact_macrosector
ON dbo.fact_indicadores_financieros(id_macrosector);
GO

--Indices para consultas financieras

CREATE NONCLUSTERED INDEX IX_fact_ingresos
ON dbo.fact_indicadores_financieros(ingresos_2025 DESC);
GO

CREATE NONCLUSTERED INDEX IX_fact_utilidad
ON dbo.fact_indicadores_financieros(utilidad_2025 DESC);
GO

CREATE NONCLUSTERED INDEX IX_fact_roe
ON dbo.fact_indicadores_financieros(roe_pct DESC);
GO

CREATE NONCLUSTERED INDEX IX_fact_roa
ON dbo.fact_indicadores_financieros(roa_pct DESC);
GO

