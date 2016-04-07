#!/bin/bash
FACTORIO_DIR=$(readlink -f " ### PATH TO FACTORIO ###");
VER="0.0.1";
MOD=$(readlink -f "$FACTORIO_DIR""/mods/");
SUBF=("prototypes" "locale" "graphics");
INFO="info.json";
RED="\033[1;31m";
GRN="\033[1;32m";
YLW="\033[1;33m";
CLR="\033[0m";
printf "\r\n";
printf "Checking Factorio Directory...";
if [ ! -d "$FACTORIO_DIR" ]; then
 printf "${RED}ERR${CLR}\r\n$FACTORIO_DIR NOT FOUND!\r\n";
 exit;
else
 printf "${GRN}OK!${CLR}\r\n";
fi
printf "Checking Mod Directory...";
if [ ! -d "$MOD" ]; then
 printf "${YLW}WARN\r\nDirectory does not exist, creating...${CLR}\r\n";
 mkdir -p "$MOD";
else
 printf "${GRN}OK!${CLR}\r\n";
fi
printf "What is the name of your mod? ";
read MODN;
MODVN="$MODN""_$VER";
MODFL="$MOD/$MODVN";
printf "Checking...";
if [ -d "$MODFL" ]; then
 printf "${RED}ERR\r\nDirectory $MODFL Exists!${CLR}\r\n";
 exit;
fi
printf "${GRN}OK!${CLR}\r\n";
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
echo "{" > $INFO;
echo "\"$J1\": \"$MODN\"," >> $INFO;
echo "\"$J2\": \"$VER\"," >> $INFO;
echo "\"$J3\": \"$A3\"," >> $INFO;
echo "\"$J4\": \"$A4\"," >> $INFO;
echo "\"$J5\": \"$A5\"," >> $INFO;
echo "\"$J6\": \"$A6\"," >> $INFO;
echo "\"$J7\": \"$A7\"" >> $INFO;
echo "}" >> $INFO;
