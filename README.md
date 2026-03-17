[![Consultar a DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MauricioCastro16/procesador-datos-escultores)

# Procesador de Datos de Escultores

[![Pascal](https://img.shields.io/badge/Pascal-7.0-red.svg)](https://www.freepascal.org/)

Sistema de procesamiento de archivos secuenciales diseñado para analizar y transformar datos de escultores. Implementa algoritmos de filtrado por país y material, con generación automática de estadísticas y reportes por consola.

## Características Principales

- Lectura y procesamiento secuencial de archivos de texto plano
- Transformación de vocales a dígitos en segmentos de año específicos
- Filtrado dinámico por país (Argentina, Chile, Perú) y material (Madera, Piedra, Metal)
- Conteo de escultores con idioma inglés y características específicas
- Generación de reportes estadísticos con porcentajes por país

## Stack Tecnológico

| Categoría | Tecnología |
|-----------|------------|
| Backend | Pascal |
| Almacenamiento | Archivos de texto plano |

## Arquitectura / Flujo

El sistema implementa un procesamiento carácter por carácter mediante archivos tipados `file of char`. Utiliza un bucle principal que lee secuencialmente hasta encontrar el delimitador `$`, aplicando transformaciones en línea y acumulando contadores mediante banderas booleanas para el filtrado condicional.

## Instalación y Uso

```bash
# Clonar el repositorio
git clone https://github.com/MauricioCastro16/procesador-datos-escultores.git
cd procesador-datos-escultores

# Compilar con Free Pascal
fpc Escultores.pas

# Ejecutar el programa
./Escultores.exe
```

El programa solicitará interactivamente el material y país de filtrado, procesará `entrada.txt` y generará `salida.txt` con las estadísticas correspondientes en consola.
