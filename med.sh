#! /bin/bash
clear
echo ">>>>>>>>Welcome to UITS Medicine Store <<<<<<<<<<"
echo " "

echo " Medicine List:"

echo "----Medicine Name ----Strength----Price----"
echo "1)   Napa                 120mg    15 taka "
echo "2)   Fexo                 120mg    60 taka "
echo "3)   Zimax                500mg    180 taka "
echo "4)   Moxibac              500mg    200 taka "
echo "5)   Terbifin             250mg    50 taka "
echo "6)   Napa Extra           500mg    25 taka "
echo "7)   Seclo                20mg     8 taka "
echo "8)   Montair              10mg     25 taka "
echo "9)   Nexum                20mg     10 taka "
echo "10)  Paracetamol          500mg    2 taka "
echo " "

echo "Which Medicine Do You Want? (1-10) "
echo " "
read choice

if ((choice == 1))
then
    echo "How many packs of napa 120mg do you want?"
    read napa_q
    price=`expr $napa_q \* 15`

elif ((choice == 2))
then
    echo "How many packs of fexo 120mg do you want?"
    read fexo_q
    price=`expr $fexo_q \* 60`

elif ((choice == 3))
then
    echo "How many packs of Zimax 500mg (Antibiotic) do you want?"
    read zim_q
    price=`expr $zim_q \* 180`

elif ((choice == 4))
then
    echo "How many packs of Moxibac 500mg (Antibiotic) do you want?"
    read mox_q
    price=`expr $mox_q \* 200`

elif ((choice == 5))
then
    echo "How many packs of Terbifin 250mg do you want?"
    read terb_q
    price=`expr $terb_q \* 50`

elif ((choice == 6))
then
    echo "How many packs of Napa Extra 500mg do you want?"
    read napaex_q
    price=`expr $napaex_q \* 25`

elif ((choice == 7))
then
    echo "How many packs of Seclo 20mg do you want?"
    read seclo_q
    price=`expr $seclo_q \* 8`

elif ((choice == 8))
then
    echo "How many packs of Montair 10mg do you want?"
    read montair_q
    price=`expr $montair_q \* 25`

elif ((choice == 9))
then
    echo "How many packs of Nexum 20mg do you want?"
    read nexum_q
    price=`expr $nexum_q \* 10`

elif ((choice == 10))
then
    echo "How many packs of Paracetamol 500mg do you want?"
    read para_q
    price=`expr $para_q \* 2`

else
    echo "Invalid choice!"
    price=0
fi

echo "Thanks for Your Order"
echo " "

echo "Your Total bill: $price taka"
echo "Please Pay the bill and collect your medicine from the counter"
echo "Thanks for Visiting UITS Medicine Store"
