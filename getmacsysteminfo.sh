#!/bin/sh

ATTRIBSFILE=/System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes
modelid="$(sysctl -n hw.model)"
marketingModel="$(defaults read "${ATTRIBSFILE}" "${modelid}" |sed -n -e 's/\\//g' -e 's/.*marketingModel = "\(.*\)";/\1/p')"

User=$(system_profiler SPSoftwareDataType | awk '/User Name/ {out=""; for(i=3;i<=NF;i++){out=out" "$i}; print out}' | awk '{$NF=""; print $0}' | awk '{$1=$1};1')
Username=$(system_profiler SPSoftwareDataType | awk '/User Name/ {out=""; for(i=3;i<=NF;i++){out=out" "$i}; print out}' | awk '{print $NF}' | sed 's:^.\(.*\).$:\1:')
OSVersion=$(system_profiler SPSoftwareDataType | awk '/System Version/ {out=""; for(i=3;i<=NF;i++){out=out" "$i}; print out}' | awk '{$NF=""; print $0}' | awk '{$1=$1};1')
Brand=$"Apple"
Model=$(sysctl hw.model | awk '{print $2}' | awk '{gsub(",", ".", $0); print}')
Year=$(echo "$marketingModel" | awk '{print $(NF-1),$NF}' | sed 's:^.\(.*\).$:\1:')
SerialNumber=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $NF}')
FileName=$(echo $User | awk '{$NF=""; print $0}' | awk '{gsub(" ", "", $0); print}')

echo $User,$Username,$OSVersion,$Brand,$Model,$Year,$SerialNumber >> /Volumes/ELM_ST/getmacsysteminfo.csv