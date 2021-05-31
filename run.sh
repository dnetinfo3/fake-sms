#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'

function banner(){
   echo -e ${CNC}"##########################################################"                                                    
   echo -e ${RED} "          FAKE-SMS SENDER                               #"
   echo -e ${CG}"            https://facebook.com/unknownclay             #"
   echo -e ${CP}"            Coded By:  Machine1337	                 #"
   echo -e ${RED}" WARNING: USE THIS SCRIPT ONLY FOR EDUCATIONAL PURPOSE   #"
   echo -e ${RED}"          I WILL NOT BE RESPONSIBLE FOR ANY KIND OF SHIT #"
   echo -e ${CPO}"##########################################################"
   
}

clear
banner
sleep 1
echo -e ${CP}" ...........Checking Internet Connectivity.........."
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo "No Internet Connection"
  exit 1
  else
  echo "Internet is present"
  
fi
function printmsg(){
echo  -e ${RED}" Exiting FAKE-SMS SENDER... "
sleep 1
echo -e ${ORANGE}" See You Next Time............."
exit
}

function instruction(){

echo -e ${YELLOW}"1. Your Country Code Must Be without "+"\n"
echo -e ${BLUE}"2. Country Code Example: 92\n"
echo -e ${ORANGE}"3. Your Phone Number Must be Start Without 0\n"
echo -e ${CNC}"4. Full Usage: 923443210111\n"
echo -e ${RED}" ..........NOTE: Only One Text Message Is Allowed Per Day..........."
}

function SENDSMS() {
    echo ""
   echo -e ${ORANGE}"Enter Phone Number with County Code like (923441212012)\n"
   echo -e -n ${CP}"Enter Phone Number With Country Code: "
   
   read num
   
   echo "  "
   echo -e -n ${BLUE}"Enter Your Message: "
   
   read msg


   SMSVERIFY=$(curl -# -X POST https://textbelt.com/text --data-urlencode phone="$num" --data-urlencode message="$msg" -d key=textbelt)
   
   if grep -q true <<<"$SMSVERIFY"
   
   then
      
      echo "  "
      echo -e ${CNC}" .....SUCCESS "
      echo "  "
      echo -e ${CNC}" ---------------------------------------------- "
      echo "$SMSVERIFY"
      echo -e ${CNC}" ---------------------------------------------- "
      echo "  "
      printmsg
   else
      
      echo "  "
      echo -e ${RED}" FAIL "
      echo "  "
      echo -e ${CNC}" ---------------------------------------------- "
      echo "$SMSVERIFY"
      echo -e ${CNC}" ---------------------------------------------- "
      echo " "
      printmsg
   fi
}
function STATUSCHECK(){
echo -e -n ${ORANGE}"Enter Text ID (e.g 123456): "
read ID
STATUSCONFIRM=$(curl -# https://textbelt.com/status/"$ID")
echo -e ${PINK}" Final Response (JSON): "
   echo " "
   echo -e ${PINK}" ---------------------------------------------- $NC"
   echo "$STATUSCONFIRM"
   echo -e ${PINK}"------------------------------------------------- $NC"
}
menu(){
clear
banner
echo -e " \n${NC}[${CG}"1"${NC}]${CNC} SEE USAGE "
echo -e "${NC}[${CG}"2"${NC}]${CNC} Send Fake SMS"
echo -e "${NC}[${CG}"3"${NC}]${CNC} CHECK SMS STATUS "
echo -e "${NC}[${CG}"4"${NC}]${CNC} EXIT "
echo -n -e ${RED}"\n[+] Select: "
read play
   if [ $play -eq 1 ]; then
          instruction
   elif [ $play -eq 2 ]; then
          SENDSMS
   elif [ $play -eq 3 ]; then
          STATUSCHECK
   elif [ $play -eq 4 ]; then
          exit
         
      fi
}
menu
