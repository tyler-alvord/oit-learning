#List images and get input
##System Information: 
$CONTROLLER_IP = "10.0.0.11"
$AUTH_PORT = "5000"
$AUTH_API_VERSION = "v3"
$IMAGE_PORT = "9292"
$IMAGE_API_VERSION = "v2"
$NODE_OS_USER = "oitroot"
$LOCAL_IMG_DIRECTORY = "C:\OpenStack-Images\"

##Authentication information to get token for the request:
$AUTH_URI = "http://$CONTROLLER_IP`:$AUTH_PORT/$AUTH_API_VERSION/auth/tokens?nocatalog="

#Submit to the server using the variables stored above. Save the authentication token into its own variable
$VALID_RESPONSE = $FALSE
do{
    try{
        $CREDS = Get-Credential
        $AUTH_BODY = "{`"auth`":{ `"identity`":{`"methods`":[`"password`"],`"password`":{`"user`":{`"domain`":{`"name`":`"Default`"},`"name`":`"$($CREDS.UserName)`", `"password`":`"$($CREDS.GetNetworkCredential().password)`"}},`"scope`":{`"project`":{`"domain`": {	`"name`":`"Default`"},`"name`":`"admin`"}}}}}"

        $AUTH_RESPONSE = Invoke-WebRequest -Uri $AUTH_URI -Method Post -ContentType "application/json" -UseBasicParsing -Body $AUTH_BODY
        $VALID_RESPONSE=$true
    }
    catch{
        Write-Host "Invalid Credentials, please try again." -ForegroundColor Red
    }
}
while(!$VALID_RESPONSE)

$AUTH_TOKEN = $AUTH_RESPONSE.Headers["X-Subject-Token"]

#Submit request for Image list to the Glance API
$IMAGE_URI = "http://$CONTROLLER_IP`:$IMAGE_PORT/$IMAGE_API_VERSION/images"

$IMAGE_HEADER = @{'X-Auth-Token' = $AUTH_TOKEN} 
try{
    $IMAGE_RESULT = Invoke-RestMethod -Uri $IMAGE_URI -Method Get -Headers $IMAGE_HEADER 
}
catch{
    Write-Host "Uh-oh - it looks like the glance API hit an error"
    Write-Host "HTTP ERROR: " $_Exception.IMAGE_RESULT.StatusCode.Value__
}

#Prompt the user for input
Write-Host "| Enter the number corresponding to the image that you wish to edit |"
Write-Host "--------------------"
foreach($element in $IMAGE_RESULT.images){
    Write-Host $IMAGE_RESULT.images.IndexOf($element) " | " $element.name
    Write-Host "-----------------------"
}

$VALID_SELECTION = $FALSE
do{
    $SELECTED_ID = Read-Host Selection 
    if($SELECTED_ID -le $IMAGE_RESULT.images.length-1 -And $SELECTED_ID -ge 0){
        $VALID_SELECTION = $TRUE
    }
    else{Write-Host "Invalid Selection" -ForegroundColor Red}
}
while(!$VALID_SELECTION)

$COPY_FILE =  $IMAGE_RESULT.images[$SELECTED_ID].id

#Copy the file over with SCP
$COPY_LOCATION = "/var/lib/glance/images/"

$LOCAL_FILE = $LOCAL_IMG_DIRECTORY+"img-" + [guid]::NewGuid().ToString()

$COPY_COMMAND = "scp $NODE_OS_USER@$CONTROLLER_IP`:$COPY_LOCATION$COPY_FILE $LOCAL_FILE";

if(!(Test-Path $LOCAL_IMG_DIRECTORY)){
    Invoke-Expression "mkdir $LOCAL_IMG_DIRECTORY"
}

Invoke-Expression $COPY_COMMAND

#Start the image with QEMU
$QEMU_EXE = "qemu-system-x86_64"
$QEMU_COMMAND = " -accel whpx -hda `"$LOCAL_FILE`" -m 1024 -vga std -boot strict=on -L `"C:\Program Files\qemu`""

Invoke-Expression $QEMU_EXE$QEMU_COMMAND

$VALID_CONFIRMATION = $FALSE
$RETURN_COMMAND = "scp $LOCAL_FILE $NODE_OS_USER@$CONTROLLER_IP`:$COPY_LOCATION$COPY_FILE";
do{
    $CONFIRM_RESPONSE = Read-Host "Are you ready to copy this back to the Openstack Node? [y/n]"
    if($CONFIRM_RESPONSE -like 'y'){
        
        Invoke-Expression $RETURN_COMMAND;
        $VALID_CONFIRMATION = $TRUE
    }
    if($CONFIRM_RESPONSE -eq'n' -or $CONFIRM_RESPONSE -eq'N'){
        Write-Host "NOTE: This script will now terminate." -ForegroundColor Yellow
        Write-Host "Once you have made the changes that you desire on the image that you're working with, shut down the image. `n You'll then want to run the following command in a PowerShell window:"
        Write-Host $RETURN_COMMAND
        Start-Sleep -Seconds 10
        $VALID_CONFIRMATION = $TRUE
    }
}while(!$VALID_CONFIRMATION)
