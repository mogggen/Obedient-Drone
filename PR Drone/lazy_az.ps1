


az repos pr list --status all --output table

az repos pr create --reviewer "<Reviewer Name>" "<Another Reviewer>"
az repos pr create --repository Fabrikam --source-branch new --reviewer "Christer Carlsson\Bidcon Team" "Conny Lindholm\Bidcon Team"

az repos pr update --||--
az repos pr create --detect true --repository Bidcon --title f'{work_item_id} - {input("title for PR: ")}' --auto-complete true --sqash true

# GET https://dev.azure.com/{organization}/{project}/_apis/test/codecoverage?buildId={buildId}&flags={flags}&api-version=6.0-preview.1

# GET https://dev.azure.com/{organization}/{project}/_apis/wit/workitems/{id}?api-version=6.0
# GET https://dev.azure.com/{organization}/{project}/_apis/wit/workitems/{id}?fields={fields}&asOf={asOf}&$expand={$expand}&api-version=6.0

# GET https://dev.azure.com/{organization}/{project}/_apis/sourceProviders/{providerName}/branches?api-version=6.0-preview.1
# GET https://dev.azure.com/{organization}/{project}/_apis/sourceProviders/{providerName}/branches?serviceEndpointId={serviceEndpointId}&repository={repository}&branchName={branchName}&api-version=6.0-preview.1

# GET https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards/{id}?api-version=6.0
# GET https://dev.azure.com/{organization}/{project}/{team}/_apis/work/boards?api-version=6.0

# POST https://dev.azure.com/{organization}/{project}/_apis/wit/workitems/${type}?validateOnly={validateOnly}&bypassRules={bypassRules}&suppressNotifications={suppressNotifications}&$expand={$expand}&api-version=6.0

# GET https://dev.azure.com/{organization}/{project}/_apis/wit/tags?api-version=6.0-preview.1
# GET https://dev.azure.com/{organization}/{project}/_apis/wit/tags/{tagIdOrName}?api-version=6.0-preview.1
# PATCH https://dev.azure.com/{organization}/{project}/_apis/wit/tags/{tagIdOrName}?api-version=6.0-preview.1
# DELETE https://dev.azure.com/{organization}/{project}/_apis/wit/tags/{tagIdOrName}?api-version=6.0-preview.1

# GET https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{id}/updates?api-version=6.0
# GET https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{id}/updates?$top={$top}&$skip={$skip}&api-version=6.0
# GET https://dev.azure.com/{organization}/{project}/_apis/wit/workItems/{id}/updates/{updateNumber}?api-version=6.0

# POST https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullrequests?api-version=6.0
# POST https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullrequests?supportsIterations={supportsIterations}&api-version=6.0

$API_PREFIX = "GET https://dev.azure.com/Elecosoft/Bidcon/_apis/wit/"
$WORK_ITEM = "workItems/"
$work_item_id = -1
$API_UPDATES = "/updates/"
$updateNumber = -1
$API_PARAMS = "?api-version=6.0"

$api_call = f"{$API_PREFIX}{$WORK_ITEM}{$work_item_id}{$API_UPDATES}{$updateNumber}{$API_PARAMS}" 

$api_call

print(0b01001100)
print(0b01001111)
print(0b01001111)
print(0b01010000)


