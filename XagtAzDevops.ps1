mkdir C:\temp1 ; cd C:\temp1
#[Net.ServicePointManager]::SecurityProtocol= [Net.SecurityProtocolType]::Tls12
System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12
# Repo Information
$organization= "InspirePolaris"
$projectName = "Cloud_test"
$repoName= "Cloud_test"
$filePath= "Cloud_test.zip"
$token = "g4dzzzy2cmtdd4ywomberog2tysa6o3igazdfyzzt26xikgdarza"

# Encode the Personal Access Token (PAT) to Base64 String
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f "",$token)))

# Construct the download URL
$uri = "https://dev.azure.com/$organization/$projectName/_apis/git/repositories/$repoName/items?path=$filePath&download=true&api-version=5.0"


# Download the file
$result = Invoke-RestMethod -Uri $uri -Method Get -ContentType "application/zip" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -outfile $filePath
expand-archive -path 'c:\temp1\Cloud_test.zip' -destinationpath '.\masterunzip'
cd masterunzip
msiexec /i xagtSetup_32.30.13_universal.msi