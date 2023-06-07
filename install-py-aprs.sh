#!/bin/bash
bash -c "$(curl -fsSL https://gitlab.com/hp3icc/python-aprs-beacon/-/raw/main/install.sh)"

bash -c "$(curl -fsSL https://gitlab.com/hp3icc/python-aprs-beacon/-/raw/main/menu.sh)"

/bin/menu-py-aprs
