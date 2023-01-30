
$TableName = Split-Path -Path $PWD -Leaf

$dirs = Get-ChildItem -Path $PWD -Recurse -Directory -Include "*Template*" 
ForEach ($dir in $dirs) { 
    $old = $dir.FullName
    $new = ($dir.FullName).Replace('Template', $TableName) 
    Rename-Item -Path $old -NewName $new
}

$files = Get-ChildItem -Path $PWD -Recurse -File #-Include "*Template*"
ForEach ($file in $files) { 

    $old = $file.FullName
    $new = ($file.FullName).Replace('Template', $TableName) 
    Rename-Item -Path $old -NewName $new

    ((Get-Content -Path $new -Raw).Replace('{{TableName}}', $TableName)) | Set-Content -Path $new

    ((Get-Content -Path $new -Raw).Replace('{{TOLOWER(TableName)}}', $TableName.ToLower())) | Set-Content -Path $new
    
}
