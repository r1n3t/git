#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Ошибка: Не указан путь к файлу!"
    echo "Использование: $0 <путь_к_файлу>"
    exit 1
fi

FILE_PATH="$1"

if [ ! -f "$FILE_PATH" ]; then
    echo "Ошибка: Файл '$FILE_PATH' не найден!"
    exit 1
fi

if [ ! -s "$FILE_PATH" ]; then
    echo "Ошибка: Файл '$FILE_PATH' пустой!"
    exit 1
fi

total_sum=0

while IFS=' ' read -r date day product price count; do
    if [ -n "$price" ] && [ -n "$count" ]; then
        total_sum=$(echo "$total_sum + $price * $count" | bc)
    fi
done < $FILE_PATH

echo "Общая сумма продаж: $total_sum"