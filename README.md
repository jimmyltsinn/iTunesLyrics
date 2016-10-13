# Lyrics Search for iTunes Now Playing
A macOS app to retrieve current iTunes now playing song information, and search
the lyrics of the song from existing lyrics providing sites.

The searching mechanism is simple: create a link for search page of the lyrics
providing site, and show it in the webview. This is same as browsing their
website with arbitrary browser and automatically type in the song title for you.

## Implementation Notes
Both Swift and Objective C is used. iTunes current information is accessed with
scripting bridge of macOS, and wrapper for accessing information is written in
Objective C class. Logic of updating and searching is written with Swift.

*PS: Just a fun project for trying Swift*
