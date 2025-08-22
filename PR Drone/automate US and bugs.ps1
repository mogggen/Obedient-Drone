param(
    [Parameter(Mandatory=$true)][string]$UserStoryOrBugShortDescription
)

$display_name = "Morgan Nyman"
$unique_name = "morgan.nyman@elecosoft.com"

$org = "elecosoft"
$project = "Bidcon"
$repo = "Desktop"

# Get the work item
$workItem = az boards work-item show --id $WorkItemId --org $org --project $project | ConvertFrom-Json

# Check and create "test" and "fix" tasks if missing
$childTasks = $workItem.relations | Where-Object { $_.rel -eq "System.LinkTypes.Hierarchy-Forward" }

'System.CreateDate'
'System.Id'

'System.Parent'
'System.Title' # Write-Output
'System.State'

function TaskExists($title) {
    foreach ($rel in $childTasks) {
        $task = az boards work-item show --id ($rel.url -split '/')[-1] --org $org --project $project | ConvertFrom-Json
        if ($task.fields.'System.Title' -match "^$title$") {
            return $true
        }
    }
    return $false
}

function CreateTask($task_name) {

    if (TaskExists $task_name) { return }
    az boards work-item create --title $task_name --type Task --org $org --project $project --fields "System.Parent=$WorkItemId" | Out-Null
    Write-Host "Created task: $task_name" 
}

# Create branch if it doesn't exist
$branchName = "develop/$WorkItemId_$BranchSuffix"
$branchSafeName = $branchName -replace '[^a-zA-Z0-9_\-]', '_'

$existingBranches = git branch -a
if ($existingBranches -notmatch $branchSafeName) {
    $defaultBranch = git remote show origin | Select-String "HEAD branch" | ForEach-Object { ($_ -split ": ")[1] }
    git checkout -b $branchSafeName origin/$defaultBranch
    Write-Host "Created and checked out branch: $branchSafeName"
} else {
    git checkout $branchSafeName
    Write-Host "Branch already exists: $branchSafeName"
}

# Watch for new commits and auto-create PR
function WatchForCommitsAndCreatePR {
    $lastCommit = git rev-parse HEAD
    $summary = ""
    $commitName = "develop/$WorkItemId_$BranchSuffix$summary"
    while ($true) {
        git fetch origin
        $newCommit = git rev-parse origin/$branchSafeName

        if ($lastCommit -ne $newCommit) {
            Write-Output "New commit detected. Creating PR..."
            $all_PRs = az repos pr list
            Write-Output $all_PRs
            $prTitle = "PR for work item $WorkItemId"

            az repos pr create `
                --title "$prTitle" `
                --description "$prTitle" `
                --repository $repo `
                --source-branch $branchSafeName `
                --target-branch $defaultBranch `
                --org $org `
                --project $project

            break
        }

        Start-Sleep -Seconds 10
    }
}

Write-Output "Done!"
