# To set up your remote terminal to use these commands:
# Go into Webstorm or IntelliJ or whatever IDE you use
# Log into the Production Server
# find a file called .bashrc
# Copy and paste this file underneath where it says "User specific aliases and functions"

# this will purge for the production server
# USAGE: purge <PUBLISHER/NETWORK NAME>
function purge {
  client-properties-new purge $1 default
}

function purge-d {
  pub=`basename $(pwd)`
  client-properties-new purge ${pub} default
}

# this will commit your code to the production server
# USAGE: commit <FILE-NAME>
function commit {
  cat $1 | client-properties-new import
}

# MAKE SURE YOU ARE IN THE DIRECTORY WHERE YOU WANT YOUR WIDGET FILES WHEN YOU RUN THIS COMMAND
# this will pull down a widget from production server
# it will also make a changes file called <WIDGET NAME>_changes.js
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export {
  pub=`basename $(pwd)`
  client-properties-new export ${pub} default $1 > $1.js
  touch ${1}_changes.js
}

# Same as the above function but will not create a changes file
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export-nc {
  pub=`basename $(pwd)`
  client-properties-new export ${pub} default $1 > $1.js
}

# Copies widget from one pub account to another on the production server
# USAGE: cp-copy <FROM PUB-NAME> <ORIGINAL WIDGET> <TO PUB-NAME> <NEW COPY WIDGET-NAME>

function cp-copy {
  client-properties-new copy  $1 default $2 to $3 default $4 | client-properties-new import
}
