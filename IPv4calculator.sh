#!/bin/bash
#Function1
whatisclass(){
if [ "$ip1" -le "127" ]; then
		class=$(echo '''A''')
		usedfor=$(echo '''Very large networks''')
elif [ "$ip1" -le "191" ]; then
               class=$(echo '''B''')
		usedfor=$(echo '''Medium networks''')
elif [ "$ip1" -le "223" ]; then
                class=$(echo '''C''')
               usedfor=$(echo '''Small networks''')
elif [ "$ip1" -le "239" ]; then
                class=$(echo '''D''')
               usedfor=$(echo '''Multicast''')
elif [ "$ip1" -le "255" ]; then
                class=$(echo '''E''')
               usedfor=$(echo '''Experimental''')
else echo "Wrong IP"
	echo $ip1
fi
}

#Function2
bitvalues(){
if [ "$subcal1" -le "0" ]; then
        subcal2=$(echo "255")
elif [ "$subcal1" -le "1" ]; then
	subcal2=$(echo "254")
elif [ "$subcal1" -le "2" ]; then
	subcal2=$(echo "252")
elif [ "$subcal1" -le "3" ]; then
	subcal2=$(echo "248")
elif [ "$subcal1" -le "4" ]; then
	subcal2=$(echo "240")
elif [ "$subcal1" -le "5" ]; then
	subcal2=$(echo "224")
elif [ "$subcal1" -le "6" ]; then
	subcal2=$(echo "192")
elif [ "$subcal1" -le "7" ]; then
	subcal2=$(echo "128")
elif [ "$subcal1" -le "8" ]; then
	subcal2=$(echo "0")

else echo '''Something is wrong!!!!'''
fi 
}

#Function3
totalhost(){
remainingbits=$((32 - numbits))
multiplyby=2
totalh=$((2**remainingbits))
totalhosts=$(echo "$totalh")
useablehosts=$((totalh - 2))
}


#Function4
bitcalcu(){
if [ "$numbits" -le "8" ]; then
#                subnet=$(echo '''255.0.0.0''')
			subcal1=$((8 - numbits))
                        bitvalues $subcal1      #call function2 to get the value of subcal2 variable
			blocksize=$((256 - subcal2))
		sub1=$(echo "$subcal2")
		sub2=$(echo "0")
		sub3=$(echo "0")
		sub4=$(echo "0")
			IFS=. read -r i1 i2 i3 i4 <<< "$userinputip"
                	IFS=. read -r m1 m2 m3 m4 <<< "$sub1.$sub2.$sub3.$sub4"
                	printf "%d.%d.%d.%d\n" "$((i1 & m1))" "$((i2 & m2))" "$((i3 & m3))" "$((i4 & m4))" >> $tempfile
			network="$(tail -n 1 $tempfile)"
			IFS=. read newsub1 newsub2 newsub3 newsub4 <<< "$network"
		validip1=$(echo "$newsub1")
		validip2=$(echo "$newsub2")
		validip3=$(echo "$newsub3")
		validip4=$((newsub4 + 1))
		bcast1=$((validip1 + blocksize - 1))
		bcast2=$(echo "255")
		bcast3=$(echo "255")
		bcast4=$(echo "255")
		last1=$bcast1
                last2=$bcast2
                last3=$bcast3
                last4=$((bcast4 - 1))
elif [ "$numbits" -le "16" ]; then
#		subnet=$(echo '''255.255.0.0''')
                sub1=$(echo "255")
			subcal1=$((16 - numbits))
                        bitvalues $subcal1      #call function2 to get the value of subcal2 variable
			blocksize=$((256 - subcal2))
                sub2=$(echo "$subcal2")
                sub3=$(echo "0")
                sub4=$(echo "0")
			IFS=. read -r i1 i2 i3 i4 <<< "$userinputip"
                        IFS=. read -r m1 m2 m3 m4 <<< "$sub1.$sub2.$sub3.$sub4"
                        printf "%d.%d.%d.%d\n" "$((i1 & m1))" "$((i2 & m2))" "$((i3 & m3))" "$((i4 & m4))" >> $tempfile
			network="$(tail -n 1 $tempfile)"
			IFS=. read newsub1 newsub2 newsub3 newsub4 <<< "$network"
		validip1=$(echo "$newsub1")
		validip2=$(echo "$newsub2")
		validip3=$(echo "$newsub3")
		validip4=$((newsub4 + 1))
		bcast1=$(echo "$validip1")
                bcast2=$((validip2 + blocksize - 1))
                bcast3=$(echo "255")
                bcast4=$(echo "255")
		last1=$bcast1
                last2=$bcast2
                last3=$bcast3
                last4=$((bcast4 - 1))
elif [ "$numbits" -le "24" ]; then
#                subnet=$(echo '''255.255.255.0''')
                sub1=$(echo "255")
                sub2=$(echo "255")
			subcal1=$((24 - numbits))
                        bitvalues $subcal1      #call function2 to get the value of subcal2 variable
			blocksize=$((256 - subcal2))
                sub3=$(echo "$subcal2")
                sub4=$(echo "0")
			IFS=. read -r i1 i2 i3 i4 <<< "$userinputip"
                        IFS=. read -r m1 m2 m3 m4 <<< "$sub1.$sub2.$sub3.$sub4"
                        printf "%d.%d.%d.%d\n" "$((i1 & m1))" "$((i2 & m2))" "$((i3 & m3))" "$((i4 & m4))" >> $tempfile
			network="$(tail -n 1 $tempfile)"
			IFS=. read newsub1 newsub2 newsub3 newsub4 <<< "$network"
		validip1=$(echo "$newsub1")
		validip2=$(echo "$newsub2")
		validip3=$(echo "$newsub3")
		validip4=$((newsub4 + 1))
		bcast1=$(echo "$validip1")
                bcast2=$(echo "$validip2")
                bcast3=$((validip3 + blocksize - 1))
                bcast4=$(echo "255")
		last1=$bcast1
                last2=$bcast2
                last3=$bcast3
                last4=$((bcast4 - 1))
elif [ "$numbits" -le "32" ]; then
#                subnet=$(echo '''255.255.255.255''')
                sub1=$(echo "255")
                sub2=$(echo "255")
                sub3=$(echo "255")
			subcal1=$((32 - numbits))
			bitvalues $subcal1	#call function2 to get the value of subcal2 variable
			blocksize=$((256 - subcal2))
		sub4=$(echo "$subcal2")
			IFS=. read -r i1 i2 i3 i4 <<< "$userinputip"
                        IFS=. read -r m1 m2 m3 m4 <<< "$sub1.$sub2.$sub3.$sub4"
                        printf "%d.%d.%d.%d\n" "$((i1 & m1))" "$((i2 & m2))" "$((i3 & m3))" "$((i4 & m4))" >> $tempfile
			network="$(tail -n 1 $tempfile)"
			IFS=. read newsub1 newsub2 newsub3 newsub4 <<< "$network"
		validip1=$(echo "$newsub1")
		validip2=$(echo "$newsub2")
		validip3=$(echo "$newsub3")
		validip4=$((newsub4 + 1))
		bcast1=$(echo "$validip1")
                bcast2=$(echo "$validip2")
                bcast3=$(echo "$validip3")
                bcast4=$((validip4 + blocksize - 1))
		last1=$bcast1
                last2=$bcast2
                last3=$bcast3
                last4=$((bcast4 - 1))
else echo "Invalid Bits"
fi
}
echo '''
  _____   _____            _  _        _____           _        
 |_   _| |  __ \          | || |      / ____|         | |       
   | |   | |__) | __   __ | || |_    | |        __ _  | |   ___ 
   | |   |  ___/  \ \ / / |__   _|   | |       / _` | | |  / __|
  _| |_  | |       \ V /     | |     | |____  | (_| | | | | (__ 
 |_____| |_|        \_/      |_|      \_____|  \__,_| |_|  \___|(V1)
                                                                
                                                 By Amrit Pal Singh
					 (singh.amrit2211@gmail.com)               
'''
echo "Please enter the IP address in XXX.XXX.XXX.XXX format(press enter):"
read userinputip
tempfile=/tmp/ipv4calc_tmp.txt
touch $tempfile
echo "Please wait IP is Validating"
if [[ "$userinputip" =~ ^(([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5])\.([01]{,1}[0-9]{1,2}|2[0-4][0-9]|25[0-5]))$ ]]; then
  echo "IP Validation Sucessfull"
  echo "Please Enter How many bits are ON(Between 1-32):"
  read numbits
  if [ "$numbits" -le 32 ]; then
#  	echo "$numbits Entered"
	IFS=. read ip1 ip2 ip3 ip4 <<< "$userinputip"
	whatisclass $ip1	#call function1
	echo "#################################################################"
	echo "IP=$userinputip"
	echo "Number of ON bits=$numbits"
	echo "Class(According to Provided IP)=$class"
	echo "Used For=$usedfor"
	bitcalcu $numbits	#call function4
	echo "Subnet Mask=$sub1.$sub2.$sub3.$sub4"
	echo "Block Size=$blocksize"
	echo "Network=$network"
	echo "First Valid IP=$validip1.$validip2.$validip3.$validip4"
	echo "Last Valid IP=$last1.$last2.$last3.$last4"
	echo "Broadcast Address=$bcast1.$bcast2.$bcast3.$bcast4"
	totalhost $numbits
	echo "Total Number of Hosts=$totalhosts"
	echo "Number of Usable Hosts=$useablehosts"
#	cat $tempfile
  else 
         echo "Invalid bits Entered, It Should be between 1-32"
  fi      
else
  echo "Invalid IP"
fi
rm $tempfile
exit
