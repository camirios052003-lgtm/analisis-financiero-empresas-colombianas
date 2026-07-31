use EmpresasColombianas;

-- Vista Finanzas

CREATE OR ALTER VIEW dbo.vw_finanzas_empresa
AS
SELECT

    e.id_empresa,
    e.nit,
    e.razon_social,

    r.region,

    d.departamento,

    m.macrosector,

    f.ingresos_2025,
    f.utilidad_2025,
    f.activos_2025,
    f.pasivos_2025,
    f.patrimonio_2025,

    f.crecimiento_ingresos_pct,
    f.margen_utilidad_pct,
    f.endeudamiento_pct,
    f.roa_pct,
    f.roe_pct

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_empresa e
ON f.id_empresa=e.id_empresa

INNER JOIN dbo.dim_region r
ON f.id_region=r.id_region

INNER JOIN dbo.dim_departamento d
ON f.id_departamento=d.id_departamento

INNER JOIN dbo.dim_macrosector m
ON f.id_macrosector=m.id_macrosector;
GO

SELECT TOP 20 *
FROM dbo.vw_finanzas_empresa;

-- Vista KPIs Ejecutivos

CREATE OR ALTER VIEW dbo.vw_kpis_generales
AS

SELECT

COUNT(*) AS total_empresas,

SUM(ingresos_2025) AS ingresos_totales,

SUM(utilidad_2025) AS utilidad_total,

AVG(roa_pct) AS roa_promedio,

AVG(roe_pct) AS roe_promedio,

AVG(margen_utilidad_pct) AS margen_promedio,

AVG(endeudamiento_pct) AS endeudamiento_promedio

FROM dbo.fact_indicadores_financieros;
GO


-- Dashboard por región

CREATE OR ALTER VIEW dbo.vw_dashboard_regiones
AS

SELECT

r.region,

COUNT(*) AS total_empresas,

SUM(f.ingresos_2025) AS ingresos_totales,

SUM(f.utilidad_2025) AS utilidad_total,

SUM(f.activos_2025) AS activos_totales,

SUM(f.pasivos_2025) AS pasivos_totales,

AVG(f.roa_pct) AS roa_promedio,

AVG(f.roe_pct) AS roe_promedio,

AVG(f.margen_utilidad_pct) AS margen_promedio,

AVG(f.endeudamiento_pct) AS endeudamiento_promedio

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_region r

ON f.id_region=r.id_region

GROUP BY

r.region;
GO


--Dashboard por departamento

CREATE OR ALTER VIEW dbo.vw_dashboard_departamentos
AS

SELECT

d.departamento,

COUNT(*) AS total_empresas,

SUM(f.ingresos_2025) AS ingresos_totales,

SUM(f.utilidad_2025) AS utilidad_total,

AVG(f.roa_pct) AS roa_promedio,

AVG(f.roe_pct) AS roe_promedio,

AVG(f.margen_utilidad_pct) AS margen_promedio,

AVG(f.endeudamiento_pct) AS endeudamiento_promedio

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_departamento d

ON f.id_departamento=d.id_departamento

GROUP BY

d.departamento;
GO

--Dashboar por macrosector

CREATE OR ALTER VIEW dbo.vw_dashboard_macrosector
AS

SELECT

m.macrosector,

COUNT(*) AS total_empresas,

SUM(f.ingresos_2025) AS ingresos_totales,

SUM(f.utilidad_2025) AS utilidad_total,

SUM(f.activos_2025) AS activos_totales,

AVG(f.roa_pct) AS roa_promedio,

AVG(f.roe_pct) AS roe_promedio,

AVG(f.margen_utilidad_pct) AS margen_promedio,

AVG(f.endeudamiento_pct) AS endeudamiento_promedio

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_macrosector m

ON f.id_macrosector=m.id_macrosector

GROUP BY

m.macrosector;
GO

--Ranking de empresas

CREATE OR ALTER VIEW dbo.vw_top_empresas
AS

SELECT

RANK() OVER(ORDER BY f.ingresos_2025 DESC) AS ranking,

e.razon_social,

r.region,

d.departamento,

m.macrosector,

f.ingresos_2025,

f.utilidad_2025,

f.roa_pct,

f.roe_pct,

f.margen_utilidad_pct

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_empresa e

ON f.id_empresa=e.id_empresa

INNER JOIN dbo.dim_region r

ON f.id_region=r.id_region

INNER JOIN dbo.dim_departamento d

ON f.id_departamento=d.id_departamento

INNER JOIN dbo.dim_macrosector m

ON f.id_macrosector=m.id_macrosector;
GO

--Rentabilidad

CREATE OR ALTER VIEW dbo.vw_rentabilidad_empresas
AS

SELECT

e.razon_social,

m.macrosector,

f.roa_pct,

f.roe_pct,

f.margen_utilidad_pct,

f.ingresos_2025,

f.utilidad_2025

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_empresa e

ON f.id_empresa=e.id_empresa

INNER JOIN dbo.dim_macrosector m

ON f.id_macrosector=m.id_macrosector;
GO


--Endeudamiento

CREATE OR ALTER VIEW dbo.vw_endeudamiento_empresas
AS

SELECT

e.razon_social,

d.departamento,

m.macrosector,

f.pasivos_2025,

f.activos_2025,

f.patrimonio_2025,

f.endeudamiento_pct

FROM dbo.fact_indicadores_financieros f

INNER JOIN dbo.dim_empresa e

ON f.id_empresa=e.id_empresa

INNER JOIN dbo.dim_departamento d

ON f.id_departamento=d.id_departamento

INNER JOIN dbo.dim_macrosector m

ON f.id_macrosector=m.id_macrosector;
GO


SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
ORDER BY TABLE_NAME;