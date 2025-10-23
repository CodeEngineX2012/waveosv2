#!/bin/bash
# WaveOS V2 Live Session - Bash Version

startup() {
    clear
    echo "Wave Live Session [Version 2.0.2025]"
    echo "(c) WaveOS. All rights reserved"
}

loop() {
    while true; do
        read -p "[wave@root ~]\$ " user_input
        matched=false

        case "$user_input" in
            help)
                matched=true
                echo "Available commands:"
                echo "  help     : Show this help menu"
                echo "  wtp      : Runs the live Wave Text Processor"
                echo "  wpm      : Runs the live Wave Package Manager"
                echo "  ip add   : Show local IP address"
                echo "  ls       : List current directory"
                echo "  x_ui     : Runs the WaveOS GUI"
                echo "  clear    : Clear the screen"
                echo "  whoami   : Show current user"
                echo "  uname    : Show system name"
                echo "  exit     : Exit the Live Session"
                ;;
            wtp)
                matched=true
                ./wtp.sh
                ;;
            wpm)
                matched=true
                ./wpm.sh
                ;;
            x_ui)
                matched=true
                echo "Running lib_gui Python script..."
                python3 "/media/codeenginex/Abdul/WaveOS V2/Linux/run_gui/main.py"
                read -p "Press Enter to continue..."
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

# Run the startup and main loop
startup
loop
