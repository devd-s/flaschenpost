#!/bin/bash

# Number of log entries to generate
num_logs=300

# Predefined data for generating random log entries
http_paths=("/home" "/about" "/contact" "/products" "/services" "/login" "/register" "/healthz" "/status")
http_verbs=("GET" "POST" "PUT" "DELETE" "PATCH")
http_versions=("HTTP/1.1" "HTTP/2.0")
http_statuses=(200 201 301 400 403 404 500)
response_sizes=(27653 1289 5321 10342 2056 987 45321)
user_agents=(
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
  "Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X)"
  "curl/7.64.1"
  "PostmanRuntime/7.26.8"
  "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0"
)
upstream_clusters=("fp-pimcore-fp-pimcore-80" "fp-web-fp-web-80" "fp-api-fp-api-80")
common_ips=("125.26.238.16" "151.4.112.224" "192.168.1.3" "210.251.1.161" "104.148.121.196" "214.29.29.241" "231.224.65.41" "12.15.4.254" "183.209.14.196" "43.182.88.46")

# Function to generate a random IP address, with a chance to pick a common IP
generate_ip() {
  if [ $((RANDOM % 2)) -eq 0 ]; then
    echo "${common_ips[$RANDOM % ${#common_ips[@]}]}"
  else
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
  fi
}

# Generate log entries
for ((i=1; i<=num_logs; i++))
do
  ip_address=$(generate_ip)
  timestamp=$(date +"[%d/%b/%Y:%H:%M:%S %z]")
  http_path=${http_paths[$RANDOM % ${#http_paths[@]}]}
  http_verb=${http_verbs[$RANDOM % ${#http_verbs[@]}]}
  http_version=${http_versions[$RANDOM % ${#http_versions[@]}]}
  http_status=${http_statuses[$RANDOM % ${#http_statuses[@]}]}
  response_size=${response_sizes[$RANDOM % ${#response_sizes[@]}]}
  user_agent=${user_agents[$RANDOM % ${#user_agents[@]}]}
  request_time=$(awk -v min=0.1 -v max=15.0 'BEGIN{srand(); print min+rand()*(max-min)}')
  upstream_time=$(awk -v min=0.1 -v max=10.0 'BEGIN{srand(); print min+rand()*(max-min)}')
  upstream_cluster=${upstream_clusters[$RANDOM % ${#upstream_clusters[@]}]}
  upstream_ip=$(generate_ip)
  unique_id=$(uuidgen)

  # Print the log entry in the specified format
  echo "$ip_address - - $timestamp \"$http_verb $http_path $http_version\" $http_status $response_size \"-\" \"$user_agent\" $request_time $upstream_time [$upstream_cluster] [] $upstream_ip $response_size $request_time $http_status $unique_id"
done
