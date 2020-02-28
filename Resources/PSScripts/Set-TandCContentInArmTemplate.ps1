[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [String]$PathToArmTemplate,
    [Parameter(Mandatory=$true)]
    [String]$PathToTandCHtmlFile,
    [Parameter(Mandatory=$false)]
    [String]$TandCToken = "__TandCHtml__"
)

$ArmTemplateContent = Get-Content -Path $PathToArmTemplate
$TandCHtmlContent = Get-Content -Path $PathToTandCHtmlFile

$ArmTemplateContent = $ArmTemplateContent -replace $TandCToken, $TandCHtmlContent

Set-Content -Value $ArmTemplateContent -Path $PathToArmTemplate