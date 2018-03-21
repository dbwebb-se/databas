#!/usr/bin/env bash

# Include ./functions.bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/functions.bash"



#
# Download a students exam and generate a response suitable for an email.
#
export STUD
STUD=$( input "Akronym att ladda ned?" "$1" )

[ -d exam ] || mkdir exam

rm -rf me \
    rm -rf exam/$STUD* \
    && dbwebb init-me \
    && yes | dbwebb -f download exam $STUD \
    && rm -rf $STUD \
    && mv me exam/$STUD \
    && eval echo "\"$( cat $DIR/ack_exam_header.html )"\" > exam/$STUD.html \
    && tree -D -s exam/$STUD/kmom10/exam >> exam/$STUD.html \
    && eval echo "\"$( cat $DIR/ack_exam_footer.html )"\" >> exam/$STUD.html \
    && md5sum exam/$STUD.html >> exam/$STUD.html \
    && cp exam/$STUD.html exam/latest.html \
    && cat exam/latest.html
    
#"\"$(cat FILE)\""
