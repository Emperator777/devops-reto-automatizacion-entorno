#!/bin/bash

while true; do
  echo "Menú de Docker"
  echo "1) Detener todos los contenedores"
  echo "2) Eliminar todos los contenedores"
  echo "3) Limpieza completa (system prune)"
  echo "4) Construir imágenes desde Dockerfiles (build)"
  echo "5) Levantar contenedores (up)"
  echo "0) Salir"
  read -rp "Selecciona una opción [0-5]: " opt

  case $opt in
    1)
      echo "Deteniendo contenedores…"
      contenedores=$(docker ps -q)
      if [ -z "$contenedores" ]; then
        echo "No hay contenedores en ejecución para detener."
      else
        docker stop $contenedores
      fi
      ;;
    2)
      echo "Eliminando contenedores…"
      docker rm $(docker ps -aq) 2>/dev/null || true
      ;;
    3)
      echo "Ejecutando limpieza completa…"
      docker system prune -a --volumes -f
      ;;
    4)
      echo "Construyendo imágenes..."
      docker build -t devops-reto-entorno:latest .
      ;;
    5)
      echo "Levantando contenedores..."
      docker run -d -p 8080:8080 --name reto-entorno devops-reto-entorno:latest      ;;
    0)
      echo "Saliendo."
      exit 0
      ;;
    *)
      echo "Opción inválida."
      ;;
  esac
  echo "Operación finalizada."
done
