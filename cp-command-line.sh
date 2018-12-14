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
