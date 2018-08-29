#!/bin/bash

# Name of the package.
NAME="HikariObfuscatorInstaller"

# Once installed the identifier is used as the filename for a receipt files in /var/db/receipts/.
IDENTIFIER="com.naville.hikari.installer"

# Package version number.
VERSION=`date +%Y.%m.%d`

# The location to copy the contents of files.
INSTALL_LOCATION="/Library/Developer/Toolchains/"


# Remove any unwanted .DS_Store files.
find files/ -name '*.DS_Store' -type f -delete

# Set full read, write, execute permissions for owner and just read and execute permissions for group and other.
/bin/chmod -R 755 files

# Remove any extended attributes (ACEs).
/usr/bin/xattr -rc files

# Build package.
/usr/bin/pkgbuild \
    --root files/ \
    --install-location "$INSTALL_LOCATION" \
    --scripts scripts/ \
    --identifier "$IDENTIFIER" \
    --version "$VERSION" \
    "compiled/$NAME-$VERSION.pkg"
