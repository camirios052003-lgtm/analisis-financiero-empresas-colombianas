import pandas as pd

def extract_data(file_path):
    """
    Lee el archivo Excel desde la capa Bronze.
    """

    df = pd.read_excel(
        file_path,
        engine="openpyxl"
    )

    return df