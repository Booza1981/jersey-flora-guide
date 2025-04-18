function Verify-And-Remove {
    param (
        [string]$OriginalDir,
        [string]$Category
    )
    
    $plantName = Split-Path $OriginalDir -Leaf
    $plantNameKebab = $plantName.Replace('_', '-').ToLower()
    $newDir = "assets\images\plants\$Category\$plantNameKebab"
    
    # Get file counts
    $originalFiles = Get-ChildItem -Path $OriginalDir -Filter "*.jpg"
    $newFiles = Get-ChildItem -Path $newDir -Filter "*.jpg"
    
    Write-Host "`nChecking $Category/$plantName..."
    Write-Host "Original files: $($originalFiles.Count)"
    Write-Host "New location files: $($newFiles.Count)"
    
    # Only remove if we have at least the same number of files in new location
    if ($newFiles.Count -ge $originalFiles.Count) {
        Write-Host "Safe to remove original directory"
        Remove-Item -Path $OriginalDir -Recurse -Force
        Write-Host "Removed: $OriginalDir"
    } else {
        Write-Host "Warning: New location has fewer files than original. Skipping removal for safety."
    }
}

Write-Host "Starting cleanup..."

# Clean Trees directory
$treesDir = "Trees"
if (Test-Path $treesDir) {
    Get-ChildItem -Path $treesDir -Directory | ForEach-Object {
        Verify-And-Remove -OriginalDir $_.FullName -Category "trees"
    }
    # Remove parent directory if empty
    if (-not (Get-ChildItem -Path $treesDir)) {
        Remove-Item -Path $treesDir -Force
        Write-Host "Removed empty directory: $treesDir"
    }
}

# Clean Wildflowers directory
$wildflowersDir = "Wildflowers"
if (Test-Path $wildflowersDir) {
    Get-ChildItem -Path $wildflowersDir -Directory | ForEach-Object {
        Verify-And-Remove -OriginalDir $_.FullName -Category "wildflowers"
    }
    # Remove parent directory if empty
    if (-not (Get-ChildItem -Path $wildflowersDir)) {
        Remove-Item -Path $wildflowersDir -Force
        Write-Host "Removed empty directory: $wildflowersDir"
    }
}

Write-Host "`nCleanup complete!" 