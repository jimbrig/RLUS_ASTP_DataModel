Function Get-AWSCredentials {
    <#

    #>
    Param(
        [string]$AWSProfileName = 'dev_engineer',
        [switch]$LaunchBrowser
    )

    $url = 'https://resolutionlifeus.awsapps.com/start'
    If ($LaunchBrowser) { start-process $url }

    Write-Host "Go to $url and copy the credentials needed."

    # retrieve credentials from user:
    $AWSAccessKey = Read-Host "Enter your AWS Access Key"
    $AWSSecretKey = Read-Host "Enter your AWS Secret Access Key"
    $AWSSessionToken = Read-Host "Enter your AWS Session Token"

    # New-AWSCredential -AccessKey $AWSAccessKey -SecretKey $AWSSecretKey -SessionToken $AWSSessionToken -ProfileLocation "C:\Users\i830299\.aws\profiles\dev_engineer"

    $AWSCreds = @{
        AccessKey = $AWSAccessKey
        SecretKey = $AWSSecretKey
        SessionToken = $AWSSessionToken
    }

    $AWSCreds

}
