# this will purge for whichever server you are on
# USAGE: purge <PUBLISHER/NETWORK NAME>
function purge {
  client-properties-new purge $1 default
}

# this will purge the production server from the dev server
# USAGE: purge-prod <PUBLISHER/NETWORK NAME>
function purge-prod {
  ssh -A cp002 client-properties-new purge $1 default
}

# this will commit your code to the whichever server you are on
# USAGE: commit <FILE-NAME>
function commit {
  cat $1 | client-properties-new import
}

# this will commit your code to the production server from the dev server
# USAGE: commit-prod <FILE-NAME>
function commit-prod {
  cat $1 | ssh -A cp002 client-properties-new import
}

# MAKE SURE YOU ARE IN THE DIRECTORY WHERE YOU WANT YOUR WIDGET FILES WHEN YOU RUN THIS COMMAND
# this will pull down a widget from production server to the dev nerver when you are on the dev server
# it will also make a changes file called <WIDGET NAME>_changes.js
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export {
  ssh -A cp002 client-properties-new export $1 default $2 > $2.js
  touch ${2}_changes.js
}

# Same as the above function but will not create a changes file
# USAGE: cp-export <PUBLISHER/NETWORK NAME> <WIDGET/NAME>
function cp-export-nc {
  ssh -A cp002 client-properties-new export $1 default $2 > $2.js
}
