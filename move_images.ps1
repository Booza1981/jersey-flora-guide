function Move-PlantImages {
    param (
        [string]$SourceDir,
        [string]$PlantName,
        [string]$Category
    )
    
    $PlantNameKebab = $PlantName.Replace('_', '-').ToLower()
    $TargetDir = "assets\images\plants\$Category\$PlantNameKebab"
    
    # Create target directory if it doesn't exist
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force
    }

    # Map of source file patterns to target names
    $commonMapping = @{
        'leaves.jpg' = 'leaves.jpg'
    }

    $treeMapping = @{
        'full_tree.jpg' = 'full.jpg'
        'full_bush.jpg' = 'full.jpg'
        'full_shrub.jpg' = 'full.jpg'
        'leaf_closeup.jpg' = 'leaves.jpg'
        'bark_closeup.jpg' = 'bark.jpg'
        'catkins.jpg' = 'flowers.jpg'
        'flower_cluster.jpg' = 'flowers.jpg'
        'flower_spike.jpg' = 'flowers.jpg'
        'flower_head.jpg' = 'flowers.jpg'
        'flowers.jpg' = 'flowers.jpg'
        'acorns.jpg' = 'seeds.jpg'
        'beech_nuts.jpg' = 'seeds.jpg'
        'berries_cluster.jpg' = 'seeds.jpg'
        'berry_cluster.jpg' = 'seeds.jpg'
        'winged_seeds.jpg' = 'seeds.jpg'
        'mature_catkin.jpg' = 'seeds.jpg'
    }

    $wildflowerMapping = @{
        'habitat.jpg' = 'full.jpg'
        'flower_closeup.jpg' = 'flowers.jpg'
        'flower_spike.jpg' = 'flowers.jpg'
        'flower_head.jpg' = 'flowers.jpg'
        'flowers.jpg' = 'flowers.jpg'
        'carpet.jpg' = 'full.jpg'
        'bush_habitat.jpg' = 'full.jpg'
        'needles_closeup.jpg' = 'leaves.jpg'
        'blossom_cluster.jpg' = 'flowers.jpg'
    }

    # Select the appropriate mapping based on category
    $fileMapping = $commonMapping.Clone()
    if ($Category -eq "trees") {
        $treeMapping.GetEnumerator() | ForEach-Object { $fileMapping[$_.Key] = $_.Value }
    } else {
        $wildflowerMapping.GetEnumerator() | ForEach-Object { $fileMapping[$_.Key] = $_.Value }
    }

    Write-Host "`nProcessing $Category/$PlantNameKebab..."
    
    # Track all image files in source directory
    $allImageFiles = Get-ChildItem -Path $SourceDir -Filter "*.jpg"
    $processedFiles = @{}
    
    # First pass: Move files according to mapping
    foreach ($sourcePattern in $fileMapping.Keys) {
        $matchingFiles = $allImageFiles | Where-Object { $_.Name -eq $sourcePattern }
        foreach ($file in $matchingFiles) {
            $targetPath = Join-Path $TargetDir $fileMapping[$sourcePattern]
            Copy-Item -Path $file.FullName -Destination $targetPath -Force
            Write-Host ("Mapped: " + $file.Name + " -> " + $fileMapping[$sourcePattern])
            $processedFiles[$file.Name] = $true
        }
    }
    
    # Second pass: Move any unmapped image files with their original names
    $unmappedFiles = $allImageFiles | Where-Object { -not $processedFiles[$_.Name] }
    foreach ($file in $unmappedFiles) {
        $targetPath = Join-Path $TargetDir $file.Name
        Copy-Item -Path $file.FullName -Destination $targetPath -Force
        Write-Host ("Unmapped: " + $file.Name + " -> " + $file.Name + " (preserved original name)")
        $processedFiles[$file.Name] = $true
    }
    
    # Report summary
    Write-Host "Summary for $Category/$PlantNameKebab"
    Write-Host ("Total files: " + $allImageFiles.Count)
    Write-Host ("Processed files: " + $processedFiles.Count)
    if ($allImageFiles.Count -ne $processedFiles.Count) {
        Write-Host "WARNING: Some files may have been missed!"
        $allImageFiles | Where-Object { -not $processedFiles[$_.Name] } | ForEach-Object {
            Write-Host ("  Missed: " + $_.Name)
        }
    }
    Write-Host "----------------------------------------"
}

Write-Host "Starting image processing..."

# Process Trees
$treesDir = "Trees"
Get-ChildItem -Path $treesDir -Directory | ForEach-Object {
    Move-PlantImages -SourceDir $_.FullName -PlantName $_.Name -Category "trees"
}

# Process Wildflowers
$wildflowersDir = "Wildflowers"
Get-ChildItem -Path $wildflowersDir -Directory | ForEach-Object {
    Move-PlantImages -SourceDir $_.FullName -PlantName $_.Name -Category "wildflowers"
}

Write-Host "`nImage processing complete!" 