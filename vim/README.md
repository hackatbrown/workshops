# Vim Workshop

Hello! Welcome to the Vim Workshop! Let's get started.

#### Vim Basics

 Vim is already installed on your computer; you just need to open up your terminal to start editing. There are different modes in Vim for performing different tasks, but Vim is basically a text editor that makes it really easy and efficient to do these tasks -- especially ones that have to do with coding.

To start using Vim, open up your terminal and make sure you're in the home directory. You can always type `cd` to get back here. To open a file called `myfile.java` you would type:

```sh
vim myfile.java
```

If `myfile.java` doesn't exist already, Vim will open up a new file to store as `myfile.java`. The extension doesn't have to be `.java` either; you can open all sorts of text files.

You edit your files in Vim straight from the terminal! Next we'll look at some of the modes you can use.

#### Insert Mode
To enter insert mode, type `i` into your terminal while you have a file open in Vim. To exit insert mode, type `esc`. Insert mode is essentially a normal text editor; you can type, delete, and transform or add text.

#### Normal Mode
You can enter normal mode by pressing `esc` from one of the other modes. Normal mode lets you do lots of things using Vim commands without explicitly typing out the text (that's what you use insert mode for). 

There are some basic commands to know here:
* `:w` to save a file
* `:q` to quit a file (Vim is pretty cool here -- if you try to quit a file you haven't saved yet, it'll warn you first)

And some more advanced text-editing commands:
* `y` to copy (or to "yank") a character
* `yy` to yank a whole line
* `d` to delete a character
* `dd` to delete a whole line
* `p` to paste
* `w` to move forward one word
* `e` to move backward one word
* `/` to find a word (for example: `/waldo` would look for "waldo")

#### Visual Mode

Visual mode is awesome because it lets you do standard <i>visual</i> text-editor operations like highlighting text. To enter visual mode, you can type `v`. The normal mode commands `y`, `d`, and `p` work as usual, and you can highlight text using the arrow keys. This lets you yank, delete, and paste large chunks of text!

Hint: Try typing `h`, `j`, `k`, and `l` and see what happens. Are you ready for an [Adventure](http://vim-adventures.com/)?

#### Vim Tutor

If you want more practice learning the basic commands of Vim, just open up the terminal from your home directory and type `vimtutor`. The tutorial takes about 30 minutes and lets you get started in the terminal right away!

#### Composition

What happens if you want to, say, delete 7 lines of code? Vim allows you to compose operations, which you can read more about [here](http://csswizardry.com/2014/06/vim-for-people-who-think-things-like-vim-are-weird-and-hard/) and [here](http://ismail.badawi.io/blog/2014/04/23/the-compositional-nature-of-vim/).


#### Customization

Are you ready to customize your Vim experience? Like many text editors, Vim lets you change your default settings. <i>Unlike</i> many text editors, Vim lets you download plug-ins that do things like add line numbers and check for syntax errors.

Your default settings are stored in your `.vimrc`, which can be opened in Vim from your home directory. The content in this file is executed every time you open Vim! So if you want line numbers when you're typing, and you don't want to have to add them every time you open Vim, you should put this code in your `.vimrc`!

To try downloading a plug-in called Syntastic, head on over to its [Github page](https://github.com/scrooloose/syntastic). Read through Section 2 of the readme to install pathogen and then use pathogen to install Syntastic!

Pathogen is something that lets you easily download other plug-ins; it's basically a plug-in for installing plug-ins. Syntastic checks your syntax whenever you save a code file and shows you errors -- you don't even have to run the code somewhere else!

---
#### Resources

Some sources to fuel your coming Vim adventures! The best way to improve is to concentrate on one or two features you want to learn at a time, and use those until they're second nature. 

* [Vim cheat sheet](http://vim.rtorr.com/)
* [Slides](https://docs.google.com/a/brown.edu/presentation/d/1SEd4KFpjI2YeOzmKROCglVpBqmk2XDEPPTC9YxbGNfY/edit#slide=id.p)
* [Syntastic and pathogen](https://github.com/scrooloose/syntastic)
* [Vim Adventures](http://vim-adventures.com/)
* [Cool things to put in .vimrc](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&es_th=1&ie=UTF-8#q=cool+things+to+put+in+.vimrc)
* [The compositional nature of Vim](http://ismail.badawi.io/blog/2014/04/23/the-compositional-nature-of-vim/)
* [Lots of things Vim](http://csswizardry.com/2014/06/vim-for-people-who-think-things-like-vim-are-weird-and-hard/)
