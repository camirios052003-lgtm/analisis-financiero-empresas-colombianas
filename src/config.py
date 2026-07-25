from pathlib import Path

# Ruta raíz del proyecto
PROJECT_ROOT = Path(__file__).resolve().parent.parent

# Carpetas de datos
BRONZE = PROJECT_ROOT / "data" / "Bronze"
SILVER = PROJECT_ROOT / "data" / "Silver"
GOLD = PROJECT_ROOT / "data" / "Gold"

# Archivo de entrada
INPUT_FILE = BRONZE / "Base_10000_empresas_2026.xlsx"

# Archivo de salida
OUTPUT_FILE = SILVER / "empresas_colombia_limpio.csv"