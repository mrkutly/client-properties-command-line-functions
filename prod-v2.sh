# To set up your remote terminal to use these commands:
# Go into Webstorm or IntelliJ or whatever IDE you use
# Log into the Dev Server
# find a file called .bashrc
# Copy and paste this file underneath where it says "User specific aliases and functions"

# this will purge for the dev server
# USAGE: purge <PUB NAME>
#  OR
# if you are in a folder that has the same name as the pub name: purge

function purge {
  if [ ! -z $1 ]
  then
    client-properties-new purge $1 default
  else
    pub=`basename $(pwd)`
    client-properties-new purge ${pub} default
  fi
}

# this will commit your code to the dev server
# USAGE: commit <FILE-NAME>
function commit {
  cat $1 | client-properties-new import
}

# MAKE SURE YOU ARE IN THE DIRECTORY WHERE YOU WANT YOUR WIDGET FILES WHEN YOU RUN THIS COMMAND
# this will pull down a widget from production server to the dev server
# it will also make a changes file called <WIDGET NAME>_changes.js
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export {
  if [ ! -z $2 ]
  then
    client-properties-new export $1 default $2 > $2.js
    touch ${2}_changes.js
  else
    pub=`basename $(pwd)`
    client-properties-new export ${pub} default $1 > $1.js
    touch ${1}_changes.js
  fi
}

# Same as the above function but will not create a changes file
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export-nc {
  if [ ! -z $2 ]
  then
    client-properties-new export $1 default $2 > $2.js
  else
    pub=`basename $(pwd)`
    client-properties-new export ${pub} default $1 > $1.js
  fi
}

# Copies widget from one pub account to another on the production server from the dev server
# USAGE: cp-copy <FROM PUB-NAME> <ORIGINAL WIDGET> <TO PUB-NAME> <NEW COPY WIDGET-NAME>
function cp-copy {
  client-properties-new copy  $1 default $2 to $3 default $4 | client-properties-new import
}
