# DevOps - Reto de Automatización de Entorno

Este repositorio contiene:  
- Una aplicación Node.js de ejemplo con 3 rutas HTTP.  
- Contenerización con Docker.  
- Un script interactivo para gestión y limpieza de tu entorno Docker.


## Requisitos

- Docker (versión ≥ 20)  
- Bash (para ejecutar scripts)

## 1. Ejecución local (sin Docker)

Entra en la carpeta `app/`, instala dependencias y lanza la aplicación:

    cd app
    npm install
    npm start

Abre tu navegador en **http://localhost:8080**

## 2. Contenerización

### 2.1 Construir la imagen

Desde la raíz del proyecto, ejecuta:

    docker build -t devops-reto-entorno:latest .

### 2.2 Ejecutar el contenedor

    docker run -d \
      -p 8080:8080 \
      --name reto-entorno \
      devops-reto-entorno:latest

Accede a **http://localhost:8080**

### 2.3 Detener y eliminar el contenedor

    docker stop reto-entorno && docker rm reto-entorno

## 3. Script interactivo de gestión Docker

Se ha incluido un script con menú para facilitar la gestión y limpieza de tu entorno Docker.  

1. **Ruta**: `cleanup.sh`  
2. **Permisos**: asegúrate de hacerlo ejecutable:

       chmod +x scripts/cleanup.sh

3. **Ejecución**:

       ./cleanup.sh

4. **Opciones disponibles**:

   1) Detener todos los contenedores  
   2) Eliminar todos los contenedores  
   3) Limpieza completa (docker system prune)  
   4) Construir la imagen Docker (docker build)  
   5) Levantar el contenedor (docker run)  
   0) Salir

Selecciona la opción deseada y pulsa **Enter**.

## 4. Ejemplos de uso del script

- **Construir y levantar**:  
  Ejecuta el script, elige la opción 4 (build) y después la 5 (up).

- **Limpieza completa**:  
  Ejecuta el script y elige la opción 3.
 
