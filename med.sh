#!/bin/bash

clear
echo ">>>>>>>> Welcome to UITS Medicine Store <<<<<<<<<<"
echo ""

declare -A medicines=(
    [1]="Napa 120mg 15"
    [2]="Fexo 120mg 60" 
    [3]="Zimax 500mg 180"
    [4]="Moxibac 500mg 200"
    [5]="Terbifin 250mg 50"
    [6]="Napa_Extra 500mg 25"
    [7]="Seclo 20mg 8"
    [8]="Montair 10mg 25"
    [9]="Nexum 20mg 10"
    [10]="Paracetamol 500mg 2"
)

# Arrays to store cart items
declare -a cart_medicines
declare -a cart_quantities
declare -a cart_prices

total_bill=0
order_more="y"

display_medicines() {
    echo " Medicine List:"
    echo "----------------------------------------------------"
    printf "%-3s %-15s %-12s %-10s\n" "No." "Medicine Name" "Strength" "Price"
    echo "----------------------------------------------------"
    for i in {1..10}; do
        IFS=' ' read -r name strength price <<< "${medicines[$i]}"
        printf "%-3d %-15s %-12s %-10s\n" "$i" "$name" "$strength" "$price taka"
    done
    echo "----------------------------------------------------"
    echo ""
}

add_to_cart() {
    local choice=$1
    local name strength price
    
    IFS=' ' read -r name strength price <<< "${medicines[$choice]}"
    
    echo "How many packs of $name $strength do you want?"
    read quantity
    
    if [[ ! $quantity =~ ^[0-9]+$ ]] || [ $quantity -le 0 ]; then
        echo "Invalid quantity! Please enter a positive number."
        return
    fi
    
    local item_total=$((quantity * price))
    

    cart_medicines+=("$name")
    cart_quantities+=("$quantity")
    cart_prices+=("$item_total")
    
    total_bill=$((total_bill + item_total))
    
    echo ""
    echo "✓ Added $quantity packs of $name to your cart."
    echo "  Item total: $item_total taka"
    echo ""
}


display_cart() {
    if [ ${#cart_medicines[@]} -eq 0 ]; then
        echo "Your cart is empty!"
        return
    fi
    
    echo "Your Shopping Cart:"
    echo "----------------------------------------------------"
    printf "%-15s %-8s %-10s %-10s\n" "Medicine" "Qty" "Price" "Total"
    echo "----------------------------------------------------"
    
    for i in "${!cart_medicines[@]}"; do
        printf "%-15s %-8s %-10s %-10s\n" \
            "${cart_medicines[$i]}" \
            "${cart_quantities[$i]}" \
            "${cart_prices[$i]}" \
            "${cart_prices[$i]}"
    done
    
    echo "----------------------------------------------------"
    printf "%-15s %-8s %-10s %-10s\n" "TOTAL" "" "" "$total_bill taka"
    echo ""
}


generate_receipt() {
    clear
    echo ">>>>>>>> UITS Medicine Store - Receipt <<<<<<<<<<"
    echo "Date: $(date)"
    echo "----------------------------------------------------"
    
    if [ ${#cart_medicines[@]} -eq 0 ]; then
        echo "No items purchased."
        return
    fi
    
    display_cart
}


while [ "$order_more" = "y" ] || [ "$order_more" = "Y" ]; do
    display_medicines
    
    echo "Which Medicine Do You Want? (1-10, or 0 to finish)"
    read -p "Enter your choice: " choice
    
    if [ "$choice" -eq 0 ]; then
        break
    fi
    
    if [[ ! $choice =~ ^[1-9]$|^10$ ]]; then
        echo "Invalid choice! Please enter a number between 1-10."
        echo ""
        continue
    fi
    
    add_to_cart "$choice"
    
    echo "Do you want to add another medicine? (y/n)"
    read order_more
    

    clear
    echo ">>>>>>>> Welcome to UITS Medicine Store <<<<<<<<<<"
    echo ""
done

generate_receipt

echo "Thanks for Your Order!"
echo ""
echo "Your Total bill: $total_bill taka"
echo "Please Pay the bill and collect your medicine from the counter"
echo "Thanks for Visiting UITS Medicine Store"
echo ""
