import pandas as pd
import re
from src.catalogs import DEPARTAMENTOS, CIUDADES

def clean_column_names(df):
    """
    Convierte los nombres de las columnas a snake_case.
    """
    columnas = []

    for col in df.columns:
        col = col.lower()
        col = col.replace(" ", "_")
        col = col.replace("(", "")
        col = col.replace(")", "")
        col = col.replace(".", "")
        col = col.replace("-", "_")
        col = col.replace("%", "porcentaje")
        col = col.replace("*", "")
        col = re.sub(r"__+", "_", col)

        columnas.append(col)

    df.columns = columnas

    return df


def remove_duplicate_columns(df):
    """
    Elimina columnas duplicadas.
    """
    df = df.loc[:, ~df.columns.duplicated()]
    return df


def clean_text_columns(df):
    """
    Elimina espacios al inicio y final de las columnas de texto.
    """
    object_columns = df.select_dtypes(include="object").columns

    for col in object_columns:
        df[col] = df[col].astype(str).str.strip()

    return df

def normalize_catalogs(df):
    """
    Normaliza los catálogos de texto para el Data Warehouse.
    """

    # Columnas que deben quedar en mayúsculas
    columnas = [
        "región",
        "departamento_domicilio",
        "ciudad_domicilio",
        "macrosector"
    ]

    for col in columnas:

        if col in df.columns:

            df[col] = (
                df[col]
                .astype(str)
                .str.upper()
                .str.strip()
                .str.replace(r"\s+", " ", regex=True)
            )

    # Homologación de departamentos
    if "departamento_domicilio" in df.columns:
        df["departamento_domicilio"] = (
            df["departamento_domicilio"]
            .replace(DEPARTAMENTOS)
        )

    # Homologación de ciudades
    if "ciudad_domicilio" in df.columns:
        df["ciudad_domicilio"] = (
            df["ciudad_domicilio"]
            .replace(CIUDADES)
        )

    return df

def transform_data(df):
    """
    Ejecuta todas las transformaciones.
    """

    df = clean_column_names(df)
    df = remove_duplicate_columns(df)
    df = clean_text_columns(df)
    df = normalize_catalogs(df)

    return df

