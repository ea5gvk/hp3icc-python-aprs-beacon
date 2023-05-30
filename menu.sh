sudo cat > /bin/menu-py-aprs <<- "EOF"
#!/bin/bash
while : ; do
choix=$(whiptail --title "Raspbian Proyect HP3ICC Menu Python-APRS" --menu "Suba o Baje con las flechas del teclado y seleccione el numero de opcion:" 23 56 13 \
1 " Editar Beacon-1 " \
2 " Editar Beacon-2 " \
3 " Editar Beacon-3 " \
4 " Editar Beacon-4 " \
5 " Editar Beacon-5 " \
6 " Editar Beacon-6 " \
7 " Editar Beacon-7 " \
8 " Editar Beacon-8 " \
9 " Start & Restart Beacon " \
10 " Stop Beacon " \
11 " Menu Principal " 3>&1 1>&2 2>&3)
exitstatus=$?
#on recupere ce choix
#exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $choix
else
    echo "You chose cancel."; break;
fi
# case : action en fonction du choix
case $choix in
1)
sudo nano /opt/python-aprs/bcom1.py ;;
2)
sudo nano /opt/python-aprs/bcom2.py ;;
3)
sudo nano /opt/python-aprs/bcom3.py ;;
4)
sudo nano /opt/python-aprs/bcom4.py ;;
5)
sudo nano /opt/python-aprs/bcom5.py ;;
6)
sudo nano /opt/python-aprs/bcom6.py ;;
7)
sudo nano /opt/python-aprs/bcom7.py ;;
8)
sudo nano /opt/python-aprs/bcom8.py ;;
9)
            choix_servicio=$(whiptail --title "Iniciar Beacon" --menu "Seleccione el Beacon a iniciar:" 15 40 8 \
            1 "APRS Beacon-1" \
            2 "APRS Beacon-2" \
            3 "APRS Beacon-3" \
            4 "APRS Beacon-4" \
            5 "APRS Beacon-5" \
            6 "APRS Beacon-6" \
            7 "APRS Beacon-7" \
            8 "APRS Beacon-8" \
             3>&1 1>&2 2>&3)
            exitstatus_servicio=$?

            if [ $exitstatus_servicio = 0 ]; then
                echo "Iniciar servicio: $choix_servicio"
                # Agrega aquiÂ­ la logica para iniciar el servicio correspondiente (usando el valor de $choix_servicio)
               sudo systemctl stop py-aprsb$choix_servicio.service && sudo systemctl start py-aprsb$choix_servicio.service &&  sudo systemctl enable py-aprsb$choix_servicio.service
            else
                echo "Volver al menu principal."
            fi
            ;;
10)
            choix_servicio=$(whiptail --title "Detener Beacom" --menu "Seleccione el Beacon a detener:" 15 40 8 \
            1 "APRS Beacon-1" \
            2 "APRS Beacon-2" \
            3 "APRS Beacon-3" \
            4 "APRS Beacon-4" \
            5 "APRS Beacon-5" \
            6 "APRS Beacon-6" \
            7 "APRS Beacon-7" \
            8 "APRS Beacon-8" \
             3>&1 1>&2 2>&3)
            exitstatus_servicio=$?

            if [ $exitstatus_servicio = 0 ]; then
                echo "Detener servicio: $choix_servicio"
                # Agrega aqui la logica para iniciar el servicio correspondiente (usando el valor de $choix_servicio)
               sudo systemctl stop py-aprsb$choix_servicio.service &&  sudo systemctl disable py-aprsb$choix_servicio.service
            else
                echo "Volver al menu principal."
            fi
            ;;
11)
break;
esac
done
exit 0

EOF
######
chmod +x /bin/menu*
