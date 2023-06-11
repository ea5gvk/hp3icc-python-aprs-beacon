# Python APRS Beacon

<img src="https://gitlab.com/hp3icc/python-aprs-beacon/-/raw/main/python-aprs.jpg" width="400" height="380">


Python APRS Beacon
La solución perfecta para identificar en el mapa de aprs.fi ubicaciones fijas como sitios de transmisión, repetidores , área de eventos, etc.

Python APRS Beacon , esta creado para ser utilizado en cualquier dispositivo con Linux como hotspot , repetidores o servidores , permite crear hasta 8 Beacon distintos.

# Install
   
```
 apt update 

 apt-get install curl sudo -y
 
 bash -c "$(curl -fsSL https://gitlab.com/hp3icc/python-aprs-beacon/-/raw/main/install-py-aprs.sh)"

```
# Configuración 

Desde de su consola terminal o ssh , escriba : menu-py-aprs , y  seleccione el número de Beacon que desea habilitar, coloque su indicativo , aprspasscode y coordenadas , Python APRS Beacon permite publicar comentario beacon y estado beacon, también puede colocar aprs simbol de su preferencia .

# Coordenadas 

El formato de coordenadas es grados minutos segundos si requiere convertir sus coordenadas de formato decimal a grados minutos segundos puede utilizar el siguiente link : 

https://sig.rocha.gub.uy/sig/coordenadas/

complete con cero a la izquierda , para para que coincida coordenadas con formato , ejemplo:

 8.5.3N  =  08.05.03N

 80.3.5W  =  080.03.05W


# Iniciar beacon 

Cuando finalice de configurar sus datos, solo debe ingresar al menú 9 , para iniciar el envió de su beacon , seleccione el número de beacon a iniciar, y su Beacon se enviara a la red de APRS2 cada 20 minutos, y puede visualizarse en aprs.fi ,  si va habilitar más de un Beacon con su indicativo recuerde colocar un numero distinto de estación a cada Beacon : 

Ejemplo:

   Beacon 1 = HP0XXX-10

   Beacon 2 = HP0XXX-11


#

# Ubicación de archivos 

/opt/python-aprs/bcom1.py

Cada beacon tiene su propio archivo y se diferencia numéricamente del 1 al 8 , en caso que su sistema operativo no sea compatible con servicios systemd, puede agregar a crontab para que se inicien automáticamente cuando inicie su equipo.

Ejemplo : 

@reboot python3 /opt/python-aprs/bcom1.py

@reboot python3 /opt/python-aprs/bcom2.py


#

Python APRS Beacon , es un aporte para todos los colegas radio aficionados interezados en compartir su ubicación de estacion , sistemas y actividades en la red de aprs , sientace libre de utilizar sin ningún tipo de coste , o donación .

Éxitos en sus proyectos 

HP3ICC

Esteban Mackay 

73.

