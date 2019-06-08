# starthere
Start here to get oriented with all repos and technical things. I am using github as my starting point to setup machines, keep track of external datasources. Access this directly at [install.coffee](https://install.coffee).

Here are relevant repos
* [dotfiles](https://github.com/JaredVogt/dotfiles)
* [Vim setup](https://github.com/JaredVogt/vimrc)
* [bitbar extensions](https://github.com/JaredVogt/bitbar)
* mackup
* Dropbox
* [this is where to start when setting up a new machine](https://github.com/JaredVogt/kickit) (deprecated)
* Legacy Repos[Kicket](https://github.com/JaredVogt/kickit), [.config](https://github.com/JaredVogt/.config)


### Security


To get rolling
1. Clone [dotfiles](https://github.com/JaredVogt/dotfiles) and follow instructions 
1. Clone [Vim setup](https://github.com/JaredVogt/vimrc) 
2. clone bitbar
3. clone utilities
4. get dropbox up and running
5. restore mackup


==================== Cruft to cleanup ===================================
### Some additional articles (these need to be written)

* how I use dropbox
* my policy on backups and how they are done
* 


### Additional notes

All apps on my machine are loaded 5 different ways
* mas (GUI apps) - if an app has both a store and a cask, will default to the store version first (this will ask me to login?)
* brew (CLI apps)
* brew cask (GUI apps)
* custom script to download zips (downloaded to `~/Desktop/toinstall`) (GUI apps)
* cloning of repos executed in a script in dotfiles (needs to be defined) (in general these will be CLI)
