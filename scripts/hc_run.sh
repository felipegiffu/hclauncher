#/bin/ksh
hcBaseDir=$1 	#localBaseDirHCBin
hcPolDir=$2	#localBaseDirHCPol
hcPolFile=$3	#item
hcReport=$4	#localBaseDirHCReport
hcReportDate=$5	#{{ now(fmt='%d%B%Y') }}
hostName=$6	#{{ ansible_hostname }}
hcRepPolName=`echo ${hcPolFile}| rev | cut -c5- | rev`

rm -rf ${hcBaseDir}/report
cd ${hcBaseDir}
cp ${hcPolDir}/${hcPolFile} ${hcBaseDir}
${hcBaseDir}/INSTALL.sh ./${hcPolFile}
${hcBaseDir}/HCL_exec.sh
mv ${hcBaseDir}/report/*.pdf ${hcReport}/${hostName}_${hcRepPolName}_${hcReportDate}.pdf
chmod 0755 ${hcReport}/${hostName}_${hcRepPolName}_${hcReportDate}.pdf
