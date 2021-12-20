#!/bin/sh

echo "FirebaseCrashlytics upload symbols"

ARCHIVE=$1
UPLOADSCRIPT="${PROJECT_DIR%/*/*}/Libraries/Vendor/Firebase/upload-symbols"
GOOGLECONFIG="${PROJECT_DIR}/Resources/Secrets/Firebase/GoogleService-Info.plist"

if [ -d $ARCHIVE ]; then
    find "$ARCHIVE/dSYMs" -name "*.dSYM" | xargs -I \{\} $UPLOADSCRIPT -gsp $GOOGLECONFIG -p ios \{\}
    echo "Upload complete!"
else
    echo "Archive does not exist!"
fi
