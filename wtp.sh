#!/bin/bash
# WaveOS V2 Text Processor - Bash Version

startup() {
    clear
    echo "Wave Live Session [Version 2.0.2025]"
    echo "(c) WaveOS. All rights reserved"
}

loop() {
    while true; do
        read -p "[wave@wave ~]\$ " user_input
        matched=false

        case "$user_input" in
            help)
                matched=true
                echo "Available commands:"
                echo "  help                 : Show this help menu"
                echo "  xmpff                : Run a different version of WaveOS V2"
                echo "  xmpff --session -a -run : Run xmpff session"
                echo "  wtp --runx           : Run WTP server"
                echo "  wtp --run --wpm2     : Run Wave Package Manager"
                echo "  ip add               : Show local IP address"
                echo "  ls                   : List current directory"
                echo "  clear                : Clear the screen"
                echo "  whoami               : Show current user"
                echo "  uname                : Show system name"
                echo "  exit                 : Exit the Live Session"
                ;;
            "xmpff"|"xmpff --session -a -run")
                matched=true
                ./xmpff/xmpff.sh
                ;;
            "wtp --runx")
                matched=true
                ./wpmx/server.sh
                ;;
            "wtp --run --wpm2")
                matched=true
                ./wpm.sh
                ;;
            "ip add")
                matched=true
                echo "Fetching local IP address..."
                hostname -I
                ;;
            whoami)
                matched=true
                echo "$USER"
                ;;
            clear)
                matched=true
                clear
                ;;
            ls)
                matched=true
                ls
                ;;
            uname)
                matched=true
                uname -a
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
