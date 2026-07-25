def validate_data(df):
    """
    Ejecuta validaciones básicas sobre el dataset.
    """

    print("=" * 60)
    print("VALIDACIÓN DE DATOS")
    print("=" * 60)

    # Dimensiones
    print(f"Registros: {df.shape[0]}")
    print(f"Columnas: {df.shape[1]}")

    # Valores nulos
    print("\nValores nulos por columna:")
    print(df.isnull().sum())

    # Registros duplicados
    print("\nRegistros duplicados:")
    print(df.duplicated().sum())

    # NIT duplicados
    if "NIT" in df.columns:
        print("\nNIT duplicados:")
        print(df["NIT"].duplicated().sum())

    # Tipos de datos
    print("\nTipos de datos:")
    print(df.dtypes)