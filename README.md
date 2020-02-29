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

|ItemID |Ended |Title |Description |EndPrice |AuctionURL |
| --- | --- | --- | --- | --- | --- |
|21825| 11/9/2017 23:30| 2001 SP Authentic Baseball Babe Ruth Game-Used Pants Card #/28| "Serially numbered #18/28 <removed for brevity>"| 300| http://nov17.hugginsandscott.com/cgi-bin/showitem.pl?itemid=21825
|15356| 5/4/2017 23:47| 2001 Upper Deck Legends of New York Game-Used Bat & Jersey Near Sets of (59) Cards| "Memorable monikers headline the <removed for brevity>"| 525| http://may17.hugginsandscott.com/cgi-bin/showitem.pl?itemid=15356
|15350| 5/4/2017 23:30| 2001 Upper Deck Legends of New York Signed Bat & Signed Jersey Set of (32) Cards| "Three storied Gotham franchises <removed for brevity>"| 625| http://may17.hugginsandscott.com/cgi-bin/showitem.pl?itemid=15350

![Image Output](https://github.com/tylerapplebaum/Archive-HugginsScottAuctions/blob/master/docs/image_example.png)