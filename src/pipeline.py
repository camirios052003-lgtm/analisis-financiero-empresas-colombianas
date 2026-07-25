from src.config import INPUT_FILE, OUTPUT_FILE
from src.extract import extract_data
from src.validate import validate_data
from src.transform import transform_data
from src.load import load_data


def run_pipeline():
    """
    Ejecuta el proceso ETL completo.
    """

    print("=" * 60)
    print("INICIANDO PROCESO ETL")
    print("=" * 60)

    # Extracción
    df = extract_data(INPUT_FILE)

    # Validación
    validate_data(df)

    # Transformación
    df = transform_data(df)

    # Carga
    load_data(df, OUTPUT_FILE)

    print("=" * 60)
    print("PROCESO ETL FINALIZADO")
    print("=" * 60)


if __name__ == "__main__":
    run_pipeline()