#!/bin/bash
ICON=/home/tulkdan/Pictures/zerg-color.png
LOCATION=/tmp/screen.png


scrot $LOCATION   #Tira um screenshot da tela atual e salva em um arquivo

# Converte o tamanho da imagem e adiciona a um modo de paint nela
convert $LOCATION -paint 2 $LOCATION
#[[ -f $1 ]] && convert $LOCATION $ICON -gravity center -composite -matte $LOCATION

#Faz o merge entre a screenshot e o ícone
convert $LOCATION $ICON -gravity center -composite -matte $LOCATION


i3lock -i $LOCATION


rm $LOCATION
