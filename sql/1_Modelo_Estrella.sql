create database EmpresasColombianas;
use EmpresasColombianas;

SELECT @@SERVERNAME AS NombreServidor;

SELECT SERVERPROPERTY('ServerName') AS ServerName,
       SERVERPROPERTY('InstanceName') AS InstanceName,
       SERVERPROPERTY('MachineName') AS MachineName;


--CREACIÓN DE TABLAS DE DIMENCIONES

CREATE TABLE dbo.dim_empresa
(
    id_empresa INT IDENTITY(1,1) PRIMARY KEY,

    nit BIGINT NOT NULL,

    razon_social NVARCHAR(250) NOT NULL
);

ALTER TABLE dbo.dim_empresa
ADD CONSTRAINT UQ_dim_empresa_nit
UNIQUE (nit);
GO


CREATE TABLE dbo.dim_region
(
    id_region INT IDENTITY(1,1) PRIMARY KEY,

    region NVARCHAR(100) NOT NULL
);

ALTER TABLE dbo.dim_region
ADD CONSTRAINT UQ_dim_region
UNIQUE(region);
GO



CREATE TABLE dbo.dim_departamento
(
    id_departamento INT IDENTITY(1,1) PRIMARY KEY,

    departamento NVARCHAR(150) NOT NULL
);

ALTER TABLE dbo.dim_departamento
ADD CONSTRAINT UQ_dim_departamento
UNIQUE(departamento);
GO



CREATE TABLE dbo.dim_macrosector
(
    id_macrosector INT IDENTITY(1,1) PRIMARY KEY,

    macrosector NVARCHAR(150) NOT NULL
);

ALTER TABLE dbo.dim_macrosector
ADD CONSTRAINT UQ_dim_macrosector
UNIQUE(macrosector);
GO



CREATE TABLE dbo.fact_indicadores_financieros
(
    id_fact INT IDENTITY(1,1) PRIMARY KEY,

    id_empresa INT NOT NULL,
    id_region INT NOT NULL,
    id_departamento INT NOT NULL,
    id_macrosector INT NOT NULL,

    ingresos_2025 DECIMAL(18,2),
    utilidad_2025 DECIMAL(18,2),
    activos_2025 DECIMAL(18,2),
    pasivos_2025 DECIMAL(18,2),
    patrimonio_2025 DECIMAL(18,2),

    crecimiento_ingresos_pct DECIMAL(18,6),
    margen_utilidad_pct DECIMAL(18,6),
    endeudamiento_pct DECIMAL(18,6),
    roa_pct DECIMAL(18,6),
    roe_pct DECIMAL(18,6),

    CONSTRAINT FK_fact_empresa
        FOREIGN KEY(id_empresa)
        REFERENCES dbo.dim_empresa(id_empresa),

    CONSTRAINT FK_fact_region
        FOREIGN KEY(id_region)
        REFERENCES dbo.dim_region(id_region),

    CONSTRAINT FK_fact_departamento
        FOREIGN KEY(id_departamento)
        REFERENCES dbo.dim_departamento(id_departamento),

    CONSTRAINT FK_fact_macrosector
        FOREIGN KEY(id_macrosector)
        REFERENCES dbo.dim_macrosector(id_macrosector)
);
GO

---- VERIFICACIÓN DE CARGA

SELECT COUNT(*) AS Empresas
FROM dim_empresa;

SELECT COUNT(*) AS Regiones
FROM dim_region;

SELECT COUNT(*) AS Departamentos
FROM dim_departamento;

SELECT COUNT(*) AS Macrosectores
FROM dim_macrosector;

--VERIFICACIÓN DE ALGUNOS REGISTROS

SELECT TOP (10) *
FROM dim_empresa;

SELECT TOP (10) *
FROM dim_region;

SELECT TOP (10) *
FROM dim_departamento;

SELECT TOP (10) *
FROM dim_macrosector;

SELECT COUNT(*) AS TotalRegistros
FROM dbo.fact_indicadores_financieros;

TRUNCATE TABLE dbo.fact_indicadores_financieros;

sp_help 'dbo.fact_indicadores_financieros';

SELECT COUNT(*)
FROM dbo.fact_indicadores_financieros;


SELECT TOP (20)
    e.razon_social,
    r.region,
    d.departamento,
    m.macrosector,
    f.ingresos_2025,
    f.utilidad_2025,
    f.roe_pct
FROM dbo.fact_indicadores_financieros f
INNER JOIN dbo.dim_empresa e
    ON f.id_empresa = e.id_empresa
INNER JOIN dbo.dim_region r
    ON f.id_region = r.id_region
INNER JOIN dbo.dim_departamento d
    ON f.id_departamento = d.id_departamento
INNER JOIN dbo.dim_macrosector m
    ON f.id_macrosector = m.id_macrosector;

-------------------------------------------------------------------------------------------------
--VALIDACIÓN DEL DATAWAREHOUSE

SELECT COUNT(*) as Empresa FROM dbo.dim_empresa;

SELECT COUNT(*) as Región FROM dbo.dim_region;

SELECT COUNT(*) as Departamento FROM dbo.dim_departamento;

SELECT COUNT(*) as Macrosector FROM dbo.dim_macrosector;

SELECT COUNT(*) as Indicadores FROM dbo.fact_indicadores_financieros;

-- Verificación de duplicados

SELECT
id_empresa,
COUNT(*)
FROM dbo.dim_empresa
GROUP BY id_empresa
HAVING COUNT(*)>1;

--Nulos

SELECT

SUM(CASE WHEN ingresos_2025 IS NULL THEN 1 ELSE 0 END),

SUM(CASE WHEN utilidad_2025 IS NULL THEN 1 ELSE 0 END),

SUM(CASE WHEN activos_2025 IS NULL THEN 1 ELSE 0 END)

FROM dbo.fact_indicadores_financieros;


