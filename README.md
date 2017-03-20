# starthere
Start here to get oriented with all repos and technical things. I am using github as my starting point to setup machines, keep track of external datasources. Access this directly at [fancy url](https://place.test.com).

Here are relevant repos
* dotfiles https://github.com/JaredVogt/dotfiles
* [bitbar extensions](https://github.com/JaredVogt/bitbar)
* [my .vimrc and vim related stuff](https://github.com/JaredVogt/vimrc)
* mackup
* Dropbox
* [this is where to start when setting up a new machine](https://github.com/JaredVogt/kickit) (deprecated)
* [historical repo with tons of configuration stuff in it](https://github.com/JaredVogt/.config)


### Security
To get all security stuff up and happy need to create a .gitconfig and also setup keys in .ssh? That previous sentance needs to be verified - details need to be figured out. 


To get rolling
1. clone dotfiles and run install.sh
2. source quicklinks (this may be in install already - but will create all the links even before the files exist in all the dif places)
1. download vimrc and run macvim to create .vim directory
2. clone vimrc  (where are the creds coming from for private repos?)
3. clone starthere
2. clone bitbar
3. clone utilities
4. get dropbox up and running
5. restore mackup



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
