Use EmpresasColombianas

--Consultas ejecutivas

--TOP 20 EMPRESAS POR INGRESOS

SELECT TOP (20)
    razon_social,
    ingresos_2025
FROM dbo.vw_top_empresas
ORDER BY ingresos_2025 DESC;

--Top 20 empresas por utilidad

SELECT TOP (20)
    razon_social,
    utilidad_2025
FROM dbo.vw_top_empresas
ORDER BY utilidad_2025 DESC;

--Empresas con mayor ROE

SELECT TOP (20)
    razon_social,
    roe_pct
FROM dbo.vw_rentabilidad_empresas
ORDER BY roe_pct DESC;

--Empresas con mayor ROA

SELECT TOP (20)
    razon_social,
    roa_pct
FROM dbo.vw_rentabilidad_empresas
ORDER BY roa_pct DESC;

--Top regiones

SELECT *
FROM dbo.vw_dashboard_regiones
ORDER BY ingresos_totales DESC;

--Top Departamnetos

SELECT *
FROM dbo.vw_dashboard_departamentos
ORDER BY ingresos_totales DESC;

--Top Macrosectores

SELECT *
FROM dbo.vw_dashboard_macrosector
ORDER BY ingresos_totales DESC;
