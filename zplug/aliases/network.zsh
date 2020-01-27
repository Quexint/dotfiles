# Get External IP / local IPs
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias lsport='sudo lsof -i -P -n | grep LISTEN'
# arp-scan
# nmap

