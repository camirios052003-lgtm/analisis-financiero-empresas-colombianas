import pandas as pd
import re


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


def transform_data(df):
    """
    Ejecuta todas las transformaciones.
    """

    df = clean_column_names(df)
    df = remove_duplicate_columns(df)
    df = clean_text_columns(df)

    return df