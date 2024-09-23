#!/usr/bin/env python3

import sys
import re

def process_log_file(filename):

    """
    Processes a log file, counts occurrences of IP addresses and prints them in descending order of occurrence.
    """
    ip_counter = {}

     # Regular expression pattern to match valid IPv4 addresses
    ip_pattern = re.compile(r'^(\d{1,3}\.){3}\d{1,3}$')

    try:
        #opening the file with read permissions
        with open(filename, 'r') as file:
            for line in file:
                # using rstrip to strip \n and split the output getting the value at first index
                stripped_ip = (line.rstrip()).split()[0]
                # dict.get(key, default): The method returns the value for key if it exists in the dictionary. If the key does not exist, it returns the default value (which is 0 in this case) and it is more concise 
                # and avoids the double lookup, making it slightly more efficient.
                 # Check if the stripped IP is a valid IPv4 address
                if ip_pattern.match(stripped_ip):
                    ip_counter[stripped_ip] = ip_counter.get(stripped_ip, 0) + 1
                # Here it is double lookup and is slightly less efficient than a solution that only looks up key only once.Mentioning just for an option
                # if stripped_ip not in ip_counter: 
                #     ip_counter[stripped_ip] = 1
                # else:
                #     ip_counter[stripped_ip] += 1
        
        # Sort by the count in descending order
        sorted_descending = sorted(ip_counter.items(), key=lambda x:x[1], reverse=True)
        # Print the results
        for ip, count in sorted_descending:
            print(f"{count} {ip}")

    except FileNotFoundError as fnf_error:
        print(f"Error: {fnf_error}")
    except Exception as e:
        print(f"An error occurred: {str(e)}")


if __name__ == "__main__":
        
    if len(sys.argv) != 2:
        print("Usage: ./process_logs.py <Please mention the logfile name>")
    else:
        logfile = sys.argv[1]
        process_log_file(logfile)



