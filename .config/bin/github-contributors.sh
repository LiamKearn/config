#!/bin/sh
set -e

# Function to URL-encode a string (works with dash)
urlencode() {
  # Input via stdin or as argument
  [ "$#" -eq 1 ] && set -- "$1" || set -- "$(cat)"
  s="$1"
  out=""
  i=1
  while [ $i -le "${#s}" ]; do
    c=$(printf '%s' "$s" | cut -c $i)
    case "$c" in
      [a-zA-Z0-9.~_-]) out="$out$c" ;;
      *) hex=$(printf '%%%02X' "'$c"); out="$out$hex" ;;
    esac
    i=$((i + 1))
  done
  printf '%s\n' "$out"
}

if [ -z "$1" ]; then
  echo "Usage: $0 <GitHub blob URL>"
  exit 1
fi

url="$1"

# Strip protocol
clean_url=$(echo "$url" | sed 's|^[^:]*://||')

# Extract owner, repo, and path
owner=$(echo "$clean_url" | cut -d/ -f2)
repo=$(echo "$clean_url" | cut -d/ -f3)
path=$(echo "$clean_url" | cut -d/ -f6-)

# URL encode the path
encoded_path=$(echo "$path" | urlencode)

# Query GitHub API
curl -s "https://api.github.com/repos/$owner/$repo/commits?path=$encoded_path&per_page=100" \
  | jq -r '.[].commit.author | "\(.name) <\(.email)>"' \
  | sort -u

