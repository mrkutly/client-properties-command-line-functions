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
  client-properties-new export $1 default $2 > $2.js
  touch ${2}_changes.js
}

# Same as the above function but will not create a changes file
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export-nc {
  client-properties-new export $1 default $2 > $2.js
}
