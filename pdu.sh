#!/bin/bash
#Script para maniular las salidas de la PDU

parametros=(0 1 2 3 4 5 6 7 8 -h -a -n -f)
echo $parametros

if [ $* != parametros ];
  then
	echo ""
	echo "Usar este comando de la siguiente forma"
	echo "./pdu <0/1> <-a/-n x/-f x o y/-h>"
	echo "Si ejecutas ./pdu -h verás opciones"
	echo ""
  fi

if [ $1 = -h ];
  then
	echo "Opciones"
	echo "-a Enciende/Apaga todas las salidas"
	echo "-n x Enciende/Apaga salida x"
	echo "-f x y Enciende/Apaga desde la salida x hasta la y"
	echo "-h -muestra las opciones"
fi

if [ $1 = 1 ]
then
	case $2 in
		-a)
		   { printf "practica\ncos\n1\n9\n2\nyes\n\n\033\034\n"; } | telnet pdujupiter.disca.upv.es
		   ;;
		-n)
		   { printf "practica\ncos\n1\n$1\n2\nyes\n\n\033\034\n"; } | telnet pdujupiter.disca.upv.es
		   ;;
		-f)
		   varia1 = $5
		   varia2 = $6
		   until [ $varia1 -seq $varia2 ]
			do
			{ printf "practica\ncos\n1\n$varia1\n2\nyes\n\n\033\034\n"; } | telnet pdujupiter.disca.upv.es
			let varia=$varia1 +1
    		   done
 		    ;;
	esac
fi

if [ $1 = 0 ]
then
	case $2 in
		-a)
		   { printf "practica\ncos\n1\n9\n1\nyes\n\n\033\034\n"; } | telnet pdujupiter.disca.upv.es
		   ;;
		-n)
		   { printf "practica\ncos\n1\n$1\n1\nyes\n\n\033\034\n"; } | telnet pdujupiter.disca.upv.es
		   ;;
		-f)
		   varia1 = $5
		   varia2 = $6
		   until [ $varia1 -seq $varia2 ]
			do
			{ printf "practica\ncos\n1\n$varia1\n1\nyes\n\n\033\034\n"; } | telnet pdujupiter.disca.upv.es
			let varia=$varia1 +1
    		   done
 		    ;;
	esac
fi





			
			





