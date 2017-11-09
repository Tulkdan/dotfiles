#!/bin/bash
ICON=/home/pedro/Pictures/Aperture-Science.png
LOCATION=/tmp/screen.png
scrot $LOCATION   #Tira um screenshot da tela atual e salva em um arquivo
convert $LOCATION -scale 10% -scale 1000% $LOCATION   #converte o tamanho da imagem e adiciona a pixelagem nela
#[[ -f $1 ]] && convert $LOCATION $ICON -gravity center -composite -matte $LOCATION
convert $LOCATION $ICON -gravity center -composite -matte $LOCATION   #Faz o merge entre a screenshot pixelada e o ícone
i3lock -i $LOCATION   #comando para trocar a imagem da tela de bloqueio
rm $LOCATION
