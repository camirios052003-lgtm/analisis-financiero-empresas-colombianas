def load_data(df, output_path):
    """
    Guarda el dataset limpio en formato CSV.
    """

    df.to_csv(
        output_path,
        index=False,
        encoding="utf-8-sig"
    )

    print("Archivo guardado correctamente.")