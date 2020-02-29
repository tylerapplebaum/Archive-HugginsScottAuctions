<#
.SYNOPSIS
    Saves information from past Huggins and Scott auctions
.DESCRIPTION
    Creates a CSV file and downloads images from past Huggins and Scott auctions.
.NOTES
    Author  :   Tyler Applebaum
    Created :   Feb 2020
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True,HelpMessage="Specify the path to a .txt file containing Huggins and Scott auction URLs (one per line)")]
	[ValidateScript({Test-Path $_ -PathType 'Leaf'})]$AuctionURLs,
	
	[Parameter(HelpMessage="File export path")]
	[ValidateScript({Test-Path $_ -PathType 'Container'})]$ExportPath = "$([Environment]::GetFolderPath("Desktop"))\HugginsScottArchive"
)

$HSAuctionURLs = @(Get-Content $AuctionURLs) -match '\S' #Exclude lines with blank characters
$HSItemArr = New-Object System.Collections.ArrayList

ForEach ($HSAuctionURL in $HSAuctionURLs) {
$ItemProperties = $null
$HSAuctionPage = Invoke-WebRequest $HSAuctionURL
$HSAuctionPage.ParsedHtml.title
$HSImages = @($HSAuctionPage.ParsedHtml.images | Where-Object nameProp -notlike "Huggins_Scott*" | Select-Object -ExpandProperty nameProp)
$HSItemText = $HSAuctionPage.ParsedHtml.body.getElementsByClassName("da_ptext") | Select-Object -ExpandProperty outerText
$HSImgURL = $HSAuctionURL -replace 'cgi.*','pl/'
	ForEach ($HSImage in $HSImages) {
		Invoke-WebRequest $HSImgURL/$HSImage -OutFile $ExportPath\$HSImage
	}

	$ItemProperties = [ordered]@{
		"ItemID" = $HSAuctionURL.Split('=')[1]
		"Ended" = $HSItemText[7]
		"Title" = $HSAuctionPage.ParsedHtml.title
		"Description" = $HSItemText[27].TrimEnd()
		"EndPrice" = $HSItemText[13]
		"AuctionURL" = $HSAuctionURL
	}
  
$ItemPropertiesObj = New-Object PSObject -Property $ItemProperties
$HSItemArr.Add($ItemPropertiesObj) | Out-Null #Add the object to the array
}

$HSItemArr | Export-CSV $ExportPath\HSItems.csv -Append -NoTypeInformation
