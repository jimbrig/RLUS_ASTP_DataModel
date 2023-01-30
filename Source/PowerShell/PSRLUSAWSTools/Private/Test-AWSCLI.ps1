Function Test-AWSCLI {

    $hasCLI = $false

    If (!(Get-Command aws -ErrorAction SilentlyContinue)) {
        Write-Error "AWS CLI must be installed and on your PATH. Aborting.."
    } Else {
        $hasClI = $true
    }

    $hasCLI

}
