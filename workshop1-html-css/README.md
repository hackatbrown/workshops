### Welcome

We're so excited you're here. Let's start making a website. 

First thing's first, you'll need a text editor. What's the heck is a text editor you ask? Well, it's just what it sounds like: you use it to edit text, in the same way that you maybe use Word to write yours papers, we use text editors to write code!

We recommend [Sublime Text](http://www.sublimetext.com/2) <-- click there to download. 

Alright, now let's get started. 

Create a new folder on your desktop called "HTML/CSS"

Open up Sublime, go to the File dropdown in the upper left and click "Save" (or press cmnd+s, just like any other old file). I know we haven't written anything to save yet. 

Save your file as `index.html` and put in your brand spankin new HTML/CSS folder.

![Screenshot of saving](http://i59.tinypic.com/33cu45i.png)

What makes an HTML file different from any other file you've always wondered? Well, first and foremost the fact that it ends with `.html`. So congrats, you just made your first HTML file, you're well on your way!

Now, in your sublime file, type `Hello, world!` and save. 

![Image of Hello World]("path")

Now, open up your HTML/CSS folder so you can see your `index.html` file and double click it. It should open your web browser and display this page.  

![Image of Hello World online]("path")

Magic! You're making websites already.

What just happened is that your computers default way of opening a file that ends in .html is in a web brower. It's like when you click a file that ends in .doc and Word or Pages opens. This also means that when you later go back to edit index.html, you'll have to right click on it and choose Sublime to open it with, otherwise you'll just see it in the browser.

Anyway, enough with the boring stuff of how a file opens, you just made a website! Browsers are pretty easy to get along with and will display pretty much whatever you throw at them, hence your text showing up, but that'll only get us so far. We're gonna need to learn how to speak the specific language the browser understands, HTML. 

Delete `Hello, world!`, and on the first line replace it with `<!DOCTYPE html>`. Here we're letting the browser know that what's coming next is HTML. 

Now for the HTML

Think of HTML as a way of labeling things. It's like if I drew a picture with no colors, but labeled all the parts with (Green) or (Red) so that you could color it in correctly for me. In HTML we calls these labels tags and HTML works from most general down to more specific tags, nesting them inside eachother. 

On line 2 write `<html>` and each tag needs a closing tag, so online 3 write `</html>`. This general format of opening tags starting with `<` and closing tags starting with `<\` will hold for pretty much all of HTML.

![Image of html tags]("path")

Now, inside of the html tags, add head and body tags:
```
<head>
</head>
<body>
</body>
```

![Image of html tags]("path")

Now, your site is going to need a title. In between the `<head>` tags, add: 
`<title>Your awesome title here</title>`

![Image of title code]("path")


If you save, open up your HTML/CSS folder again and double click index.html, you should be able to see your new title on top of the browser window. 

![Image of title]("path")

And you're site wouldn't be much without text, so let's add `Hello, world!` back in between the body tags!

![Image of hello world code]("path")

Double click your file in your folder, revel in the glory. 

![Image of hello world browser]("path")

Congrats! You've reach checkpoint 1! Copy and past what's in `checkPoint1.html` into your own file if you didn't get all that. 

------

What's that? Site looks a little lame? Well just you wait. It's time to add some style. 

Open up a new window in Sublime and save it as `index.css` in your same HTML/CSS folder. CSS stands for Cascading Style Sheet, but we'll explain that later. 

![Image of saving css]("path")

CSS allows you to select certain things in the HTML and style them. For example, if I wanted to select `<body>` and make it's background-color black, I'd write:
```
body {
  background-color: black;
}
```
But right now my text is black, too. So beneah `background-color:` let's add `color: white;`

```
body {
  background-color: black;
  color: white;
}
```

![Image of code in the file]("path")

Go ahead and copy and paste that code into your `index.css` and double click your `index.html` file to check it out in the browser. 

But wait, it all still looks the same. That's because we haven't told the index.html where to look for its style yet. 

Switch back to looking at `index.html` and add this in between the `head` tags beneath `title`:
`<link type='text/css' rel='stylesheet' href='index.css'>`

Things in the head don't get rendered visibly on the page (except for the title!) but rather tell the page where to long for its dependencies (things that it depends on). In this case we're saying, "Hey, look at this file, it's type is text/css (type), it's relation to me is a stylesheet (rel), and you can find it here (href)."

![Image of link code]("path")

Now let's refresh the page (or double click on index.html again). Walah! 
