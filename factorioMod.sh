#!/bin/bash
FACTORIO_DIR=" ### FILL THIS IN WITH YOUR FACTORIO DIRECTORY. NO TRAILING / PLEASE. ### ";
VER="0.0.1";
MOD="$FACTORIO_DIR/mods/";
SUBF=("prototypes" "locale" "graphics");
INFO="info.json";
printf "\r\n";
printf "Checking Factorio Directory...";
if [ ! -d "$FACTORIO_DIR" ]; then
 printf "\e[31mERR\e[0m\r\n$FACTORIO_DIR NOT FOUND!\r\n";
 exit;
else
 printf "\e[32mOK!\e[0m\r\n";
fi
printf "Checking Mod Directory...";
if [ ! -d "$MOD" ]; then
 printf "\e[35mWARN\r\nDirectory does not exist, creating...\e[0m\r\n";
 mkdir "$MOD";
else
 printf "\e[32mOK!\e[0m\r\n";
fi
printf "What is the name of your mod? ";
read MODN;
MODVN="$MODN""_$VER";
MODFL="$MOD""$MODVN";
printf "Checking...";
if [ -d "$MODFL" ]; then
 printf "\e[31mERR\r\nDirectory $MODFL Exists!\e[0m\r\n";
 exit;
fi
printf "\e[32mOK!\e[0m\r\n";
mkdir "$MODFL";
cd "$MODFL";
echo "Creating control.lua...";
touch control.lua;
echo "Creating data.lua...";
touch data.lua;
echo "Creating $INFO...";
touch $INFO;
for FOLD in ${SUBF[@]}; do
 printf "Create folder $FOLD? (y/n): ";
 read ANS;
 if [ $ANS == "y" -o $ANS == "Y" ]; then
  mkdir "$FOLD";
  printf "Created folder: $FOLD\r\n";
 fi
done
J1="name";
J2="version";
J3="title";
J4="author";
J5="contact";
J6="homepage";
J7="description";
printf "\r\nWhat is the full title of the mod? ";
read A3;
printf "Author: ";
read A4;
printf "Contact info: ";
read A5;
printf "Homepage: ";
read A6;
printf "Description of mod: ";
read A7;
echo "{" >> $INFO;
printf "\t\"$J1\": \"$MODN\",\r\n" >> $INFO;
printf "\t\"$J2\": \"$VER\",\r\n" >> $INFO;
printf "\t\"$J3\": \"$A3\",\r\n" >> $INFO;
printf "\t\"$J4\": \"$A4\",\r\n" >> $INFO;
printf "\t\"$J5\": \"$A5\",\r\n" >> $INFO;
printf "\t\"$J6\": \"$A6\",\r\n" >> $INFO;
printf "\t\"$J7\": \"$A7\"\r\n" >> $INFO;
echo "}" >> $INFO;
