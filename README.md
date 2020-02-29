# Archive-HugginsScottAuctions.ps1

## Description

This script will save the auction information including Price, Title, End Date and URL, including any images. The auction description isn't in a consistent place, so saving that is problematic.

The AuctionURLs file should contain one URL per line.

## Why do this?

The main use is to have a reference price when you're buying these cards later. As of late, this can be useful to get "before" pictures of cards, since they may be altered later.

Usage:

```powershell
.\Archive-HugginsScottAuctions.ps1 -AuctionURLs .\AuctionURLs.txt -ExportPath "C:\Users\Dad\Google Drive\Baseball\BB\Not Mine\HugginsScottArchive"
```

Example output:

![Data Output](https://github.com/tylerapplebaum/Archive-HugginsScottAuctions/blob/master/docs/data_example.png)

![Image Output](https://github.com/tylerapplebaum/Archive-HugginsScottAuctions/blob/master/docs/image_example.png)