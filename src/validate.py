def validate_data(df):
    """
    Ejecuta validaciones básicas sobre el dataset.
    """

    print("=" * 60)
    print("VALIDACIÓN DE DATOS")
    print("=" * 60)

    print(f"Registros: {len(df)}")
    print(f"Columnas: {len(df.columns)}")

    print("\nValores nulos:")
    print(df.isnull().sum())

    print("\nDuplicados:")
    print(df.duplicated().sum())