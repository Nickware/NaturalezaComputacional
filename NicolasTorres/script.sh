#!/bin/bash
#Author		: N.Torres
#Date		: 26/10/2017
#Version	: 0.0.5 
#echo "Limpiando carpeta de archivos anteriores"
for i in *.gnu *.gif; 
	do	rm $i
			echo "Borrando archivos anteriores "
	done
#********************Bloque Uno: Inicializacion*********************#
echo "Inicia..."
echo "Programa grafica funciones matematicas"
echo "-------------Warning------------------"
echo "Este programa utiliza sintaxis gnuplot"
#rm [*.gnu, *.gif]
read -p "Ingrese la primera funcion: " funcion01
read -p "Ingrese la segunda funcion: " funcion02
read -p "Nombre de la grafica : " titulo
read -p "Titulo de la etiqueta de la ordenada : " ordenada
read -p "Titulo de la etiqueta de la abscisa : " abscisa
read -p "Tipo de imagen: " tipo
#read -p "Nombre de la imagen a guardar (entre comillas): " imagen
#********************Bloque Dos: Calculo***************************#
#echo "plot" $funcion01"(x)" "w l," $funcion02"(x)" "w p" >> script.gnu
echo 'set title' '"'$titulo'"' >> script.gnu
echo 'set ylabel' '"'$ordenada'"' >> script.gnu
echo 'set xlabel' '"'$abscisa'"' >> script.gnu
if [ $tipo = gif ]
then
#	
read -p "Ingrese el numero de intervalos(frames): " ni
	echo "ni="$ni >> script.gnu
	#echo 'reset' >> script.gnu
	echo 'set terminal gif animate' >> script.gnu
	echo 'set output' '"imagen'.$tipo'"' >> script.gnu
	echo 'dt=2*pi/ni' >> script.gnu
	echo 'set xrange [0:4*dt]' >> script.gnu
	echo 'i=0' >> script.gnu
	echo 'load' '"animate.gnu"' >> script.gnu
	echo 'set output' >> script.gnu
	echo "plot" $funcion01'(x+i*dt) w l title sprintf(''"t=%i"'',i),'$funcion02' (x+i*dt) w p title sprintf(''"t=%i"'',i)' >> animate.gnu
	echo 'i=i+1' >> animate.gnu
	echo 'if (i < ni) reread' >> animate.gnu
else
#	
	echo 'set terminal' $tipo >> script.gnu
	echo 'set output' '"imagen'.$tipo'"' >> script.gnu
fi
##******************Bloque Tres: Salida  **************************#
