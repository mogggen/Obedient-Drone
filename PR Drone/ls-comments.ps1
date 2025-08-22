$unique_name = "morgan.nyman@elecosoft.com"
$display_name = "Morgan Nyman"

$work_item_id = Read-Host -Prompt "work item id: "
$org = "elecosoft"
$project = "Bidcon"
$repo = "Desktop"


az rest --method get `
  --url "https://dev.azure.com/$org/$project/_apis/wit/workItems/$work_item_id/comments?api-version=7.1-preview.3"
