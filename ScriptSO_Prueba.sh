!#/bin/bash 
clear

function menuPrincipal(){
 echo "1- Buscar usuario"
 echo "2- Buscar grupo"
 echo "3- Modificar home de usuario"
 echo "4- Modificar GID de grupo"
 echo "5- Salir"
} # Fin de la funcion del menu principal (Muestra todas las opciones principales)

function submenu1(){
 echo "1- Buscar usuario"
 echo "2- Atras"
} # Fin de la funcion primer submenu 1 (Muestra las opciones si presionamos 1 del menu principal)

function submenu2(){
echo "1- Buscar grupo"
echo "2- Atras"
} # Fin de la funcion primer submenu 2 (Muestra las opciones si presionamos 2 del menu principal)

function buscarUsuario(){
 clear
 echo "Ingrese el nombre del usuario:"
 read nomusuario
 if  grep -qi "^$nomusuario:" /etc/passwd 
 then
  clear
  finger $nomusuario
  retroseder
 else
  echo "El usuario no existe"
  sleep 5
  clear
  exit
 fi
} # Fin de la funcion buscar usuario

function buscarGrupo(){
clear 
echo "Ingrese nombre del grupo"
 read nomgrupo
verificarG= `ypcat group | grep "^$GRUPO"`
if [! $verificarG ]
then
echo "El grupo existe"
else
echo "El grupo no existe"
sleep 4
clear
exit
fi

}

function retroseder(){
volverMenu=0
     while [ $volverMenu -ne 2 ]
     do
      case $volverMenu in
        1) buscarUsuario
        ;;
        *)     echo "1- Buscar usuario"
        echo "2- Salir"
        ;;
      esac
      read volverMenu
     done
clear
 exit
} # Funcion retroseder luego que se consulto el usuario en el submenu1 para que no quede colgado el usuario.
opcion=0
while [ $opcion -ne 5 ] 
do
case $opcion in
  1) selectOpcion=0
     while [ $selectOpcion -ne 2 ]
     do
     case $selectOpcion in 
      1) buscarUsuario
      ;;
      *) clear 
    submenu1
      ;;
     esac
      read selectOpcion
     done
     ;; # Fin del primer caso
 
 2) selectOpcion2=0
     while [ $selectOpcion2 -ne 2 ]
     do
     case $selectOpcion2 in 
      1) buscarGrupo
      ;;
      *) clear 
    submenu2
      ;;
     esac
      read selectOpcion2
     done
     ;; # Fin del segundo caso
  
 3) echo "Opcion3"
     ;;
 
 4) echo "Opcion4"
     ;;
 
 *) menuPrincipal
     ;;
esac
read opcion
done

#Aclaro esta no es la version final me faltas cosas todavia att: Andrés Lemos
