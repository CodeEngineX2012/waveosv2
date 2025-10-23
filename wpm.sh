#!/bin/bash
# Wave Package Manager - Bash Version

startup() {
    clear
    echo "Wave Live Session [Version 2.0.2025]"
    echo "(c) WaveOS. All rights reserved"
    echo "Wave Package Manager"
}

loop() {
    while true; do
        read -p "[wave@wpm ~]\$ " user_input
        matched=false

        case "$user_input" in
            help)
                matched=true
                echo "Available commands:"
                echo "  help                 : Show this help menu"
                echo "  ls                   : List current directory"
                echo "  clear                : Clear the screen"
                echo "  exit                 : Exit the wpm Live Session"
                ;;
            clear)
                matched=true
                clear
                ;;
            "wpm --run --wtp2")
                matched=true
                ./wtp.sh
                ;;
            "wpm --run lib_gui")
                matched=true
                echo "Running lib_gui Python script..."
                python3 "/home/username/Desktop/WaveOS V2/run_gui/main.py"
                read -p "Press Enter to continue..."
                ;;
            "wpm --get -p --gui")
                matched=true
                echo "Installing gui and lib_gui..."
                sleep 5
                echo "GUI and lib_gui installed successfully"
                ;;
            ls)
                matched=true
                ls
                ;;
            exit)
                exit 0
                ;;
        esac

        if [ "$matched" = false ]; then
            echo "Command Not Found"
        fi
    done
}

# Run startup and loop
startup
loop
