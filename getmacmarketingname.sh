##marketingModel=$(modelid="$(system_profiler SPHardwareDataType 2>/dev/null|awk '/Model Identifier:/ {print $NF}')"
##    defaults read /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist "MacBookPro12,1"|sed -n -e 's/\\//g' -e 's/.*marketingModel = "\(.*\)";/\1/p')"
##    echo "${marketingModel}"

##Model=$(sysctl hw.model | awk '{print $2}')
##Modelplistinfo=$(defaults read /System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes.plist "$Model")
##marketingModel=$("$Modelplistinfo" | sed -n -e 's/\\//g' -e 's/.*marketingModel = "\(.*\)";/\1/p')")
##echo $marketingModel

ATTRIBSFILE=/System/Library/PrivateFrameworks/ServerInformation.framework/Versions/A/Resources/English.lproj/SIMachineAttributes
if [ -f "${ATTRIBSFILE}.plist" ]
then
    modelid="$(sysctl -n hw.model)"
    modelplistinfo="$(defaults read "${ATTRIBSFILE}" "${modelid}" |sed -n -e 's/\\//g' -e 's/.*marketingModel = "\(.*\)";/\1/p')"
    marketingModel="$(echo "$modelplistinfo" | awk '{print $(NF-1),$NF}')"
    echo $modelplistinfo
    echo "${marketingModel}"
else
    echo "can't use offline method to find marketing name on this OS version"
fi