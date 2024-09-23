1. This problem can be done using bash script, one liner from terminal or python or golang script.
2. In First line shebang is mentioned which tells the kernel which interpreter should be used to run commands in the file
3. In 4th line -z is used to check that length of string at position first i.e. $1 is not zero.
4. If script is ran without any argument it will exit the script.
5. In line 12 first I am using awk command to extract string from first column (i.e. host which is making request) of the file then piping the output of awk command to sort the ip addresses
6. grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' This regular expression (grep -Eo) filters for valid IP addresses. It ensures that only lines with a pattern resembling an IP address (four groups of 1-3 digits separated by dots) are included.
-o This option tells grep to output only the matching part of the line. It shows the only portion of the line that matches the regular expression is shown.
-E: This tells grep to use Extended Regular Expressions (ERE).

7. in numerical order and then using uniq command to with -c argument to count the occurrences of the IP as uniq command counts consecutive duplicate lines as it doesn't detect automatically and all duplicate lines unless they are adjacent or next to each other and then using again sort command to sort numerically and this is an assumption to get the host with max requests as that is not mentioned in the task, then reversing the order to get the most frequent IP addresses to appear at the top for which i have used -nr argument with sort command.

8. Since the log file provided does not contain enough different ips , so I am generating one for my own to show a valid use case when different hosts hit using log_generator.sh which is creating the access.logs file and also sharing the screenshot.

9. Also I am sharing the same thing in Python for your reference and attaching the screenshots for the same. In python re.compile(r'^(\d{1,3}\.){3}\d{1,3}$') to match valid IPv4 addresses to avoid non ip values.