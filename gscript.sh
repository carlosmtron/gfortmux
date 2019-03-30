# Script para instalar gfortran en Termux de Android.
# Utiliza los repositorios gcc_termux de its-pointless,
# disponibles en http://github.com/its-poinless/gcc_termux
# Autor del Script: Carlos M. Silva
# Para utilizar este script se necesita correr en Termux
# los siguientes comandos:
#	$ pkg install wget
#	$ wget http://github.com/carlosmtron/gfortmux/gscript.sh
#	$ bash gscript.sh

# Instalación de paquetes necesarios: coreutils, gnupg, wget
apt-get update
apt-get  --assume-yes upgrade 
apt-get  --assume-yes install coreutils gnupg wget 
# Creación del directorio sources.list.d donde se almacenará la dirección del repositorio
mkdir $PREFIX/etc/apt/sources.list.d
# Escribiendo la dirección del repositorio its-pointless
echo "deb https://its-pointless.github.io/files/ termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
# Descarga de la llave de seguridad desde https://its-pointless.github.io/pointless.gpg 
wget https://its-pointless.github.io/pointless.gpg
# Agregamos la llave
apt-key add pointless.gpg
# Actualizamos el listado de paquetes
apt update

# Instalación del compilador gcc-8 (gfortran es parte del mismo), librerías de fortran.
pkg install gcc-8
apt-get --assume-yes  install libgfortran5
# Configuración de CLANG para que funcione con gfortran-8
setupclang-gfort-8
