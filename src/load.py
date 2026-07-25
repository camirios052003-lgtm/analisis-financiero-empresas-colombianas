from pathlib import Path


def load_data(df, output_path):
    """
    Guarda el DataFrame en formato CSV.
    """

    # Crear la carpeta si no existe
    Path(output_path).parent.mkdir(parents=True, exist_ok=True)

    # Guardar archivo
    df.to_csv(
        output_path,
        index=False,
        encoding="utf-8-sig"
    )

    print("=" * 60)
    print("DATOS GUARDADOS CORRECTAMENTE")
    print("=" * 60)
    print(output_path)