# 📊 Análisis Financiero de Empresas Colombianas

## 📌 Descripción del proyecto

Este proyecto desarrolla una solución completa de analítica de datos sobre información financiera de **10.000 empresas colombianas**, implementando un flujo ETL, un Data Warehouse bajo esquema estrella y un dashboard interactivo en Power BI para apoyar el análisis financiero y la toma de decisiones.

El proyecto abarca todo el ciclo de vida de los datos:

- Extracción de datos
- Limpieza y transformación
- Auditoría de calidad
- Normalización de catálogos
- Carga al Data Warehouse
- Modelado dimensional
- Visualización interactiva

---

# 🎯 Objetivos

- Construir un proceso ETL reutilizable en Python.
- Garantizar la calidad de la información mediante auditorías automáticas.
- Implementar un Data Warehouse en SQL Server utilizando un modelo estrella.
- Diseñar vistas analíticas optimizadas para Power BI.
- Desarrollar un dashboard ejecutivo para el análisis financiero de empresas colombianas.

---

# 🛠 Tecnologías utilizadas

| Tecnología | Uso |
|------------|-----|
| Python | ETL y auditoría de datos |
| Pandas | Transformación de datos |
| SQL Server | Data Warehouse |
| SQL | Modelo estrella y vistas analíticas |
| Power BI | Dashboard interactivo |
| Git | Control de versiones |
| GitHub | Portafolio del proyecto |

---

# 🏗 Arquitectura del proyecto

![alt text](image.png)
---

# 📂 Estructura del proyecto

```
analisis-financiero-empresas-colombianas/
│
├── data/
│   ├── bronze/ Base_10000_empresas_2026.xlsx
│   ├── silver/ empresas_colombia_limpio.csv
│   └── gold/ empresas_colombia_gold_Final.csv
│
├── notebooks/  
│   ├── 01_Data_Profiling.ipynb
│   ├── 02_ETL.ipynb
│   ├── 03_EDA.ipynb
│   ├── 04_Gold.ipynb
│   ├── 05_Data_Quality_Audit.ipynb
│   └── 06_SQL_Server_Load.ipynb
|
├── src/
│   ├── extract.py
│   ├── transform.py
│   ├── load.py
│   ├── catalogs.py
│   ├── config.py
│   ├── pipeline.py
│   └── validate.py
│
├── sql/
│   ├── 1_modelo_estrella.sql
│   ├── 2_vistas_analiticas.sql
│   ├── 3_optimizacion_datawarehouse.sql
│   ├── 4_validaciones.sql
│   └── 05_consultas_analiticas.sql
│
├── dashboard/
│   ├── Empresas_Colombianas.pbix
│   └── Figures
│
├── documentation/
│   ├── Business_Rules
│   ├── data_dictionary
│   └── Project_Charter
│
├── README.md
└── requirements.txt
```

---

# ⚙️ Proceso ETL

## Extracción

- Lectura del archivo Excel original.
- Validación inicial de la estructura del dataset.

## Transformación

- Limpieza de columnas.
- Conversión de nombres a snake_case.
- Eliminación de duplicados.
- Homologación de departamentos.
- Homologación de ciudades.
- Normalización de texto.
- Cálculo de indicadores financieros.

## Carga

Los datos transformados son cargados en SQL Server mediante un modelo estrella compuesto por:

- Dim Empresa
- Dim Región
- Dim Departamento
- Dim Macrosector
- Tabla Fact Financiera

---

# 📊 Indicadores financieros calculados

- Crecimiento de ingresos (%)
- Margen de utilidad (%)
- Endeudamiento (%)
- ROA (%)
- ROE (%)

---

# 🗄 Modelo Estrella

El Data Warehouse está compuesto por:

### Dimensiones

- Empresa
- Región
- Departamento
- Macrosector

### Tabla de hechos

Fact_Finanzas

Contiene:

- Ingresos
- Utilidad
- Activos
- Pasivos
- Patrimonio
- ROA
- ROE
- Margen
- Endeudamiento

---

# 📈 Dashboard Power BI

El dashboard está compuesto por cinco páginas:

### Página 1

Dashboard Ejecutivo

![alt text](image.png)

---

### Página 2

Análisis Geográfico

![alt text](image-1.png)

---

### Página 3

Análisis de Rentabilidad

![alt text](image.png)

---

### Página 4

Análisis Financiero

![alt text](image-1.png)

---

### Página 5

Análisis Detallado de Empresas

![alt text](image.png)

---

# 🚀 Principales funcionalidades

✔ ETL automatizado

✔ Auditoría de calidad

✔ Normalización de catálogos

✔ Modelo estrella

✔ Vistas analíticas

✔ Dashboard interactivo

✔ Segmentación dinámica

✔ KPIs financieros

---

# 📊 Principales resultados

- Procesamiento de 10.000 empresas.
- Construcción de un Data Warehouse optimizado.
- Dashboard ejecutivo con cinco páginas de análisis.
- Indicadores financieros calculados automáticamente.
- Modelo preparado para futuras ampliaciones.

---

# Autor

**Laura Camila Rios**

Proyecto desarrollado como portafolio de Analítica de Datos y Business Intelligence.

LinkedIn: *https://www.linkedin.com/in/laura-camila-rios-parra-02958b382/*

GitHub: *https://github.com/camirios052003-lgtm*

