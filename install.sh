#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	whiptail --title "Python APRS Beacon" --msgbox "Debe ejecutar este script como usuario ROOT" 0 50
	exit 0
fi
apps=("python3" "sed")
for app in "${apps[@]}"
do
    # Verificar apps
    if ! dpkg -s "$app" >/dev/null 2>&1; then
        # app no instalada
        sudo apt-get install -y "$app"
    else
        # app ya instalada
        echo "$app ya instalada"
    fi
done
if [ -d "/opt/python-aprs" ]
then
   rm -r /opt/python-aprs
fi
   mkdir /opt/python-aprs


sudo cat > /lib/systemd/system/py-aprsb1.service <<- "EOF"
[Unit]
Description=Python APRS BEACOM1
After=network.target

[Service]
ExecStart=/usr/bin/python3 /opt/python-aprs/bcom1.py
WorkingDirectory=/opt/python-aprs/
Restart=on-failure

[Install]
WantedBy=multi-user.target



EOF
#
sudo cat > /opt/python-aprs/bcom1.py <<- "EOF"
import socket
import time

callsign = "HP0XX-10"     # Callsign
password = "12345"           # aprspasscode (12345)
latitude = "0831.27N"        # DDMM.mmN   (0831.27N)
longitude = "08021.59W"      # DDDMM.mmW (08021.59W)
comment = "Python APRS BEACON-1"  # coment beacon
simbol_primary = "/"       # simbol id
simbol_secundary = "r"     # simbol code
serverHost = "rotate.aprs2.net" # aprs server url
serverPort = 14580            # aprs server port
every = 20                    # time minute every send beacon





##############################################################################
address = f"{callsign}>APHPIB,TCPIP:"
login = f"user {callsign} pass {password} vers emq-TE1 Python APRS Beacon 1.3"
text = "Python APRS Beacon by HP3ICC"
packet = f"{address}!{latitude}{simbol_primary}{longitude}{simbol_secundary}{comment}"
packet2 = f"{address}>{text}"
print(packet)
print(len(comment))

while True:
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.connect((serverHost, serverPort))
        sock.send(f"{login}\n".encode())
        sock.send(f"{packet}\n".encode())
        sock.send(f"{packet2}\n".encode())
        sock.close()
    except Exception as e:
        print(f"Error al enviar el paquete: {e}")

    time.sleep(every * 60)

EOF
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb2.service
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb3.service
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb4.service
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb5.service
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb6.service
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb7.service
cp /lib/systemd/system/py-aprsb1.service /lib/systemd/system/py-aprsb8.service

cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom2.py
cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom3.py
cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom4.py
cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom5.py
cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom6.py
cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom7.py
cp /opt/python-aprs/bcom1.py /opt/python-aprs/bcom8.py

sudo sed -i "s/BEACOM1/BEACOM2/g"  /lib/systemd/system/py-aprsb2.service
sudo sed -i "s/BEACOM1/BEACOM3/g"  /lib/systemd/system/py-aprsb3.service
sudo sed -i "s/BEACOM1/BEACOM4/g"  /lib/systemd/system/py-aprsb4.service
sudo sed -i "s/BEACOM1/BEACOM5/g"  /lib/systemd/system/py-aprsb5.service
sudo sed -i "s/BEACOM1/BEACOM6/g"  /lib/systemd/system/py-aprsb6.service
sudo sed -i "s/BEACOM1/BEACOM7/g"  /lib/systemd/system/py-aprsb7.service
sudo sed -i "s/BEACOM1/BEACOM8/g"  /lib/systemd/system/py-aprsb8.service

sudo sed -i "s/bcom1/bcom2/g"  /lib/systemd/system/py-aprsb2.service
sudo sed -i "s/bcom1/bcom3/g"  /lib/systemd/system/py-aprsb3.service
sudo sed -i "s/bcom1/bcom4/g"  /lib/systemd/system/py-aprsb4.service
sudo sed -i "s/bcom1/bcom5/g"  /lib/systemd/system/py-aprsb5.service
sudo sed -i "s/bcom1/bcom6/g"  /lib/systemd/system/py-aprsb6.service
sudo sed -i "s/bcom1/bcom7/g"  /lib/systemd/system/py-aprsb7.service
sudo sed -i "s/bcom1/bcom8/g"  /lib/systemd/system/py-aprsb8.service

sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-1/g"   /opt/python-aprs/bcom1.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-2/g"   /opt/python-aprs/bcom2.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-3/g"   /opt/python-aprs/bcom3.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-4/g"   /opt/python-aprs/bcom4.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-5/g"   /opt/python-aprs/bcom5.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-6/g"   /opt/python-aprs/bcom6.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-7/g"   /opt/python-aprs/bcom7.py
sudo sed -i "s/Python APRS BEACON-1/Python APRS BEACON-8/g"   /opt/python-aprs/bcom8.py

sudo chmod 644 /lib/systemd/system/py-aprsb1.service
sudo chmod 644 /lib/systemd/system/py-aprsb2.service
sudo chmod 644 /lib/systemd/system/py-aprsb3.service
sudo chmod 644 /lib/systemd/system/py-aprsb4.service
sudo chmod 644 /lib/systemd/system/py-aprsb5.service
sudo chmod 644 /lib/systemd/system/py-aprsb6.service
sudo chmod 644 /lib/systemd/system/py-aprsb7.service
sudo chmod 644 /lib/systemd/system/py-aprsb8.service

systemctl daemon-reload
chmod +x /opt/python-aprs/*
