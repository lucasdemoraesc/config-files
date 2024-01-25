#!/bin/bash

# Obtém o esquema de cores atual
current_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$current_scheme" = "'prefer-dark'" ]; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi

