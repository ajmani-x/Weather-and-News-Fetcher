#!/bin/bash

show_weather() {
    read -p "Enter city name: " CITY
    echo "Fetching weather for $CITY ..."

    RESPONSE=$(curl -s "https://wttr.in/$CITY?format=j1")

    if [ -z "$RESPONSE" ]; then
        echo "Error fetching data! Check internet."
        return
    fi

    TEMP=$(echo "$RESPONSE" | jq -r '.current_condition[0].temp_C')
    CONDITION=$(echo "$RESPONSE" | jq -r '.current_condition[0].weatherDesc[0].value')
    [ -z "$TEMP" ] && TEMP="N/A"
    [ -z "$CONDITION" ] && CONDITION="N/A"

    echo "=============================="
    echo "City: $CITY"
    echo "Temperature: ${TEMP}°C"
    echo "Condition: $CONDITION"
    echo "=============================="
}


show_news() {


    KEY="c922210c08c672df3ce7b3464c014145"

    PAGE=$(( RANDOM % 10 + 1 ))

    echo ""
    echo "Fetching latest random news..."
    echo ""

    NEWS=$(curl -s "https://gnews.io/api/v4/top-headlines?lang=en&country=in&max=5&page=$PAGE&apikey=$KEY")

    if [ -z "$NEWS" ]; then
        echo "Error fetching news!"
        return
    fi

    echo "========= LATEST RANDOM NEWS ========="
    echo "$NEWS" | jq -r '.articles[].title'
    echo "======================================"
}


while true; do
    echo ""
    echo "===== WEATHER & NEWS MENU ====="
    echo "1. Show Weather"
    echo "2. Show News"
    echo "3. Exit"
    echo "==============================="
    read -p "Enter your choice: " CH

    case $CH in
        1) show_weather ;;
        2) show_news ;;
        3) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid choice!" ;;
    esac
done