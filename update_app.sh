#!/bin/bash
# this script will update the exec path of your desktop files with the new one for the application.
# just pass in the full file name (example r2modman-3.1.4.AppImage)

name=$(cut -d '-' -f 1 <<<$1)
sed -i "4s/.*/Exec=\\/home\\/bloopers\\/Applications\\/${1}/" /home/bloopers/.local/share/applications/$name.desktop
echo $name has been updated
