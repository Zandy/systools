#! /bin/bash
:<<EOF
By Zandy
EOF

oldhn=debian7-base
newhn=debian7-data
cf=$(grep -rn $oldhn /etc/|awk -F':' '{print $1}')
for f in $cf; do
        if [ -e $f ]; then
                echo $f
		sed -i "s:$oldhn:$newhn:g" $f
        fi
done
hostname $newhn
sysctl kernel.hostname=$newhn
# your'd better reboot the system.