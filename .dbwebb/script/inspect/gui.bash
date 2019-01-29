#!/usr/bin/env bash

# Include ./functions.bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# shellcheck source=.
source "$DIR/../functions.bash"

# Source the config file if it exists
DBWEBB_GUI_CONFIG_FILE="$HOME/.dbwebb/gui_config.bash"
# shellcheck source=$HOME/.dbwebb.gui_config.bash
[[ -f $DBWEBB_GUI_CONFIG_FILE ]] && source "$DBWEBB_GUI_CONFIG_FILE"



# Preconditions
hash dialog 2>/dev/null \
    || die "You need to install 'dialog'."



# Settings
# shellcheck source=./../../../.dbwebb.course
source "$DIR/../../../.dbwebb.course"
COURSE="$DBW_COURSE"
BACKTITLE="dbwebb/$COURSE"
TITLE="Work with kmoms"
REDOVISA_HTTP_PREFIX="http://www.student.bth.se"

# OS specific default settings
BROWSER="firefox"
TO_CLIPBOARD="xclip -selection c"
OS_TERMINAL=""

if [[ "$OSTYPE" == "linux-gnu" ]]; then   # Linux, use defaults
    OS_TERMINAL="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then   # Mac OSX
    OS_TERMINAL="macOS"
    TO_CLIPBOARD="iconv -t macroman | pbcopy"
    BROWSER="open /Applications/Firefox.app"
elif [[ "$OSTYPE" == "cygwin" ]]; then    # Cygwin
    OS_TERMINAL="linux"
    BROWSER="'/cygdrive/c/Program Files (X86)/Google/Chrome/chrome.exe'"
elif [[ "$OSTYPE" == "msys" ]]; then
    :
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
fi

# Use defaults or overwrite from configuration/environment settings
BROWSER=${DBWEBB_BROWSER:-$BROWSER}
TO_CLIPBOARD=${DBWEBB_TO_CLIPBOARD:-$TO_CLIPBOARD}
TEACHER_SIGNATURE=${DBWEBB_TEACHER_SIGNATURE:-"// XXX"}


# Useful defaults which are used within the application
dockerContainer="mysql"



#
#
#
gui-firstpage()
{
    local message

    read -r -d "" message << EOD
README
================================================

This is a graphical gui for working with inspect.
You can inspect a students kmom, you can do potatoe and you can download (overwrites me/) and inspect locally - with or without using docker.

Make sure you have a initiated and updated course repo with development utilities installed.
 dbwebb update
 dbwebb init-me # Will be overwritten on download
 make install # For local inspects

You need to start and stop docker before using docker within a docker container.

From the root of the cours repo, start the container, if needed. You can also use the docker menu.
 docker-compose up -d [$dockerContainer]
 docker-compose start [$dockerContainer]
 docker-compose stop
 docker-compose run [$dockerContainer] bash

The output from inspect is written to a file, keep it open in your editor (and use package language-ansi-styles to get colors):
 inspect.output

Review the admin menu for customizing and creating a configuration file where you can store customized settings.
 $DBWEBB_GUI_CONFIG_FILE

Basic feedback text is created from files in txt/kmom??.txt, you can add your own teacher signature like this (or through the configuration file):
 export DBWEBB_TEACHER_SIGNATURE="//Mikael (mos@bth.se)"

/Mikael
EOD
    
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --msgbox "$message" \
        24 80 \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-show-configuration()
{
    local message

    read -r -d "" message << EOD
SETTINGS
================================================

These are your current settings that are currently used.

 BROWSER="$BROWSER"
 OS_TERMINAL="$OS_TERMINAL"
 TEACHER_SIGNATURE="$TEACHER_SIGNATURE"
 TO_CLIPBOARD="$TO_CLIPBOARD"

All these are set with default values (within the script) and you can override them by setting the following environment variabels, preferably using the configuration file.

 DBWEBB_BROWSER="$DBWEBB_BROWSER"
 DBWEBB_TEACHER_SIGNATURE="$DBWEBB_TEACHER_SIGNATURE"
 DBWEBB_TO_CLIPBOARD="$DBWEBB_TO_CLIPBOARD"

These are default settings for opening the browser.
 windows (cygwin): export BROWSER="...."
 macOs:            export BROWSER="open /Applications/Firefox.app"
 linux:            export BROWSER="firefox"

These are the default settings for using the clipboard when the feedback text is available through ctrl-v/cmd-v.
 windows (cygwin): export TO_CLIPBOARD="...."
 macOs:            export TO_CLIPBOARD="iconv -t macroman | pbcopy"
 linux:            export TO_CLIPBOARD="xclip -selection c"

/Mikael
EOD
    
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --msgbox "$message" \
        24 80 \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-main-menu()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --menu "Main menu" \
        24 80 \
        20 \
        "1" "Inspect kmom (download, docker)" \
        "2" "Inspect kmom (docker)" \
        "3" "Inspect kmom (download, local)" \
        "4" "Inspect kmom (local)" \
        "" "---" \
        "d" "Download student me/" \
        "w" "Open student me/redovisa in browser" \
        "p" "Potatoe student" \
        "" "---" \
        "a" "Admin menu" \
        "t" "Database menu" \
        "o" "Docker menu" \
        "r" "Readme" \
        "q" "Quit" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-admin-menu()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --menu "Main » Admin menu" \
        24 80 \
        20 \
        "c" "Create a default configuration file ~/.dbwebb/gui_config.bash" \
        "s" "Show configuration settings" \
        "b" "Back" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-database-menu()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --menu "Main » Database menu" \
        24 80 \
        20 \
        "u" "Create users dbwebb:password and user:pass into docker mysql" \
        "l" "Load standard kmom database dump into docker mysql" \
        "1" "Load student skolan/reset_part1.bash into docker mysql" \
        "2" "Load student skolan/reset_part2.bash into docker mysql" \
        "3" "Load student skolan/reset_part3.bash into docker mysql" \
        "b" "Back" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-docker-menu()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --menu "Main » Docker menu" \
        24 80 \
        20 \
        "u" "Docker up -d [$dockerContainer]" \
        "r" "Docker run [$dockerContainer] bash" \
        "s" "Docker start [$dockerContainer]" \
        "t" "Docker stop" \
        "b" "Back" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-read-kmom()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --default-item "$kmom" \
        --menu "Select kmom" \
        24 80 \
        20 \
        "kmom01" "kmom01" \
        "kmom02" "kmom02" \
        "kmom03" "kmom03" \
        "kmom04" "kmom04" \
        "kmom05" "kmom05" \
        "kmom06" "kmom06" \
        "kmom10" "kmom10" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-read-acronym()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --inputbox "Select student acronym" \
        24 80 \
        "$1" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
gui-read-docker-container()
{
    dialog \
        --backtitle "$BACKTITLE" \
        --title "$TITLE" \
        --inputbox "Select docker container" \
        24 80 \
        "$1" \
        3>&1 1>&2 2>&3 3>&-
}



#
#
#
main-admin-menu()
{
    local output

    while true; do
        output=$( gui-admin-menu )
        case $output in
            c)
                createConfigFile
                pressEnterToContinue
                ;;
            s)
                gui-show-configuration
                ;;
            b|"")
                return
                ;;
        esac
    done
}



#
#
#
main-database-menu()
{
    local output

    while true; do
        output=$( gui-database-menu )
        case $output in
            u)
                echo "example/sql/create-user-dbwebb.sql" 
                cat example/sql/create-user-dbwebb.sql | make docker-run container="mysql-client" what="mysql -hmysql -uroot -ppassword"
                echo "example/sql/create-user-user.sql"
                cat example/sql/create-user-user.sql | make docker-run container="mysql-client" what="mysql -hmysql -udbwebb -ppassword"
                echo "example/sql/check-users.sql"
                cat example/sql/check-users.sql | make docker-run container="mysql-client" what="mysql -hmysql -uuser -ppass --table"
                pressEnterToContinue
                ;;
            l)
                kmom=$( gui-read-kmom $kmom )
                [[ -z $kmom ]] && continue

                for file in $DIR/kmom.d/$kmom/dump_*.sql; do
                    echo "$file"
                    cat "$file" | make docker-run container="mysql-client" what="mysql -hmysql -udbwebb -ppassword"
                done
                pressEnterToContinue
                ;;
            1)
                make docker-run container="mysql-client" what="bash me/skolan/reset_part1.bash"
                pressEnterToContinue
                ;;
            2)
                make docker-run container="mysql-client" what="bash me/skolan/reset_part2.bash"
                pressEnterToContinue
                ;;
            3)
                make docker-run container="mysql-client" what="bash me/skolan/reset_part3.bash"
                pressEnterToContinue
                ;;
            b|"")
                return
                ;;
        esac
    done
}



#
#
#
main-docker-menu()
{
    local output

    while true; do
        output=$( gui-docker-menu )
        case $output in
            u)
                dockerContainer=$( gui-read-docker-container "$dockerContainer" )
                make docker-up container="$dockerContainer"
                pressEnterToContinue
                ;;
            r)
                dockerContainer=$( gui-read-docker-container "$dockerContainer" )
                make docker-run container="$dockerContainer" what="bash"
                pressEnterToContinue
                ;;
            s)
                dockerContainer=$( gui-read-docker-container "$dockerContainer" )
                make docker-start container="$dockerContainer"
                pressEnterToContinue
                ;;
            t)
                make docker-stop
                pressEnterToContinue
                ;;
            b|"")
                return
                ;;
        esac
    done
}



#
# Main function
#
main()
{
    local output
    local acronym=

    gui-firstpage
    gui-show-configuration
    while true; do
        output=$( gui-main-menu )
        case $output in
            a)
                main-admin-menu
                ;;
            t)
                main-database-menu
                ;;
            o)
                main-docker-menu
                ;;
            4)
                acronym=$( gui-read-acronym $acronym )
                [[ -z $acronym ]] && continue

                kmom=$( gui-read-kmom $kmom )
                [[ -z $kmom ]] && continue

                dbwebb --yes inspect $COURSE $kmom $acronym | tee inspect.output
                pressEnterToContinue
                ;;
            3)
                acronym=$( gui-read-acronym $acronym )
                [[ -z $acronym ]] && continue

                kmom=$( gui-read-kmom $kmom )
                [[ -z $kmom ]] && continue

                dbwebb --force --yes download me $acronym
                make inspect options="--yes" what="$kmom" | tee inspect.output
                pressEnterToContinue
                ;;
            2)
                acronym=$( gui-read-acronym $acronym )
                [[ -z $acronym ]] && continue

                kmom=$( gui-read-kmom $kmom )
                [[ -z $kmom ]] && continue

                # Open me in browser
                $BROWSER "$REDOVISA_HTTP_PREFIX/~$acronym/dbwebb-kurser/$COURSE/me/redovisa"

                # Do inspect
                make docker-run container="course-$COURSE" what="make inspect what=$kmom options='--yes'" | tee inspect.output

                # Echo feedbacktext and add to clipboard
                output=$( eval echo "\"$( cat "$DIR/text/$kmom.txt" )"\" )
                printf "%s" "$output" | tee -a inspect.output
                printf "%s" "$output" | eval $TO_CLIPBOARD

                # Run extra testscripts
                make docker-run container="course-cli" what="bash .dbwebb/script/inspect/kmom.d/run.bash $kmom" | tee -a inspect.output

                pressEnterToContinue
                ;;
            1)
                acronym=$( gui-read-acronym $acronym )
                [[ -z $acronym ]] && continue

                kmom=$( gui-read-kmom $kmom )
                [[ -z $kmom ]] && continue

                # Open me in browser
                $BROWSER "$REDOVISA_HTTP_PREFIX/~$acronym/dbwebb-kurser/$COURSE/me/redovisa"

                # Download, or potatoe and the download again
                if ! dbwebb --force --yes download me $acronym; then
                    potatoe $acronym
                    if ! dbwebb --force --yes download me $acronym; then
                        pressEnterToContinue;
                        continue
                    fi
                fi

                # Do inspect
                make docker-run container="course-$COURSE" what="make inspect what=$kmom options='--yes'" | tee inspect.output

                # Echo feedbacktext and add to clipboard
                output=$( eval echo "\"$( cat "$DIR/text/$kmom.txt" )"\" )
                printf "%s" "$output" | tee -a inspect.output
                printf "%s" "$output" | eval $TO_CLIPBOARD

                # Run extra testscripts
                make docker-run container="course-cli" what="bash .dbwebb/script/inspect/kmom.d/run.bash $kmom" | tee -a inspect.output

                pressEnterToContinue
                ;;
            d)
                acronym=$( gui-read-acronym $acronym )
                [[ -z $acronym ]] && continue

                dbwebb --force --yes download me $acronym
                pressEnterToContinue
                ;;
            w)
                acronym=$( gui-read-acronym $acronym )
                [[ -z $acronym ]] && continue

                $BROWSER "$REDOVISA_HTTP_PREFIX/~$acronym/dbwebb-kurser/$COURSE/me/redovisa"
                pressEnterToContinue
                ;;
            p)
                potatoe $acronym
                pressEnterToContinue
                ;;
            r)
                gui-firstpage
                ;;
            # r)
            #     acronym=$( gui-read-acronym $acronym )
            #     $DIR/run_and_verify_exam.bash $acronym && acronym=
            #     pressEnterToContinue
            #     ;;
            q)
                exit 0
                ;;
        esac
    done
}
main
