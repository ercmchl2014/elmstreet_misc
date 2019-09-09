User=$(system_profiler SPSoftwareDataType | awk '/User Name/ {out=""; for(i=3;i<=NF;i++){out=out" "$i}; print out}')
FileName=$(echo $User | awk '{$NF=""; print $0}' | awk '{gsub(" ", "", $0); print}')

echo $FileName
