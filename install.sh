#!/bin/bash
#
# (Above line comes out when placing in Xcode scheme)
#
# with snippets from the NWTestFlightUploader script
#

# Do some existence checks for the build settings that this script depends on:
#if [ "$CODE_SIGN_IDENTITY" = "" -o "$WRAPPER_NAME" = "" -o "$ARCHIVE_DSYMS_PATH" = "" -o "$ARCHIVE_PRODUCTS_PATH" = "" -o "$DWARF_DSYM_FILE_NAME" = "" -o "$INSTALL_PATH" = "" ]; then
#	osascript -e "tell application \"Xcode\"" -e "display dialog \"It looks like we're missing build settings.\n\nYou can fix this by editing your scheme's Run Script action and selecting the appropriate target from the 'Provide build settings from...' drop down menu.\" buttons {\"OK\"} default button \"OK\" with icon stop" -e "end tell"
#	exit 1
#fi

# Build paths from build settings environment vars:
APP="$ARCHIVE_PRODUCTS_PATH/$INSTALL_PATH/$WRAPPER_NAME"
QUICKLOOK_PATH="${HOME}/Library/QuickLook"
FULL_INSTALL_PATH="${QUICKLOOK_PATH}/jsonlook.qlgenerator/"

LOG="/tmp/jsonlookInstall.log"
/bin/rm -f $LOG
echo "Starting jsonlook Install Process" > $LOG
#if [ "$SHOW_DEBUG_CONSOLE" = "YES" ]; then
/usr/bin/open -a /Applications/Utilities/Console.app $LOG
#fi #SHOW_DEBUG_CONSOLE

/bin/mkdir -p $QUICKLOOK_PATH >> $LOG 2>&1
/bin/rm -r $FULL_INSTALL_PATH >> $LOG 2>&1

mv "$APP" ${QUICKLOOK_PATH} >> $LOG 2>&1
/usr/bin/qlmanage -r >> $LOG 2>&1
