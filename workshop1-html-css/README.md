### Welcome

We're so excited you're here. Let's start making a website. 

First thing's first, you'll need a text editor. What's the heck is a text editor you ask? Well, it's just what it sounds like: you use it to edit text, in the same way that you maybe use Word to write yours papers, we use text editors to write code!

We recommend [Sublime Text](http://www.sublimetext.com/2) <-- click there to download. 

Alright, now let's get started. 

Create a new folder on your desktop called "HTML/CSS"

Open up Sublime, go to the File dropdown in the upper left and click "Save" (or press cmnd+s, just like any other old file). I know we haven't written anything to save yet. 

Save your file as `index.html` and put it in your brand spankin new HTML/CSS folder.

![Screenshot of saving](http://i59.tinypic.com/33cu45i.png)

What makes an HTML file different from any other file you've always wondered? Well, first and foremost the fact that it ends with `.html`. So congrats, you just made your first HTML file, you're well on your way!

Now, in your sublime file, type `Hello, world!` and save. 

![Image of Hello World](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%2012.25.56%20AM.png)

Now, open up your HTML/CSS folder so you can see your `index.html` file and double click on it. It should open your web browser and display this page.  

![Image of Hello World online](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-23%20at%2011.35.10%20PM.png)

Magic! You're making websites already.

What just happened is that your computer's default way of opening a file that ends in `.html` is in a web brower. It's like when you click a file that ends in `.doc` and Word or Pages opens. This also means that when you later go back to edit `index.html`, you'll have to right click on it and choose Sublime to open it with, otherwise you'll just see it in the browser.

Anyway, enough with the boring stuff of how a file opens, you just made a website! Browsers are pretty easy to get along with and will display pretty much whatever you throw at them, hence your text showing up, but that'll only get us so far. We're gonna need to learn how to speak the specific language the browser understands, HTML. 

Delete `Hello, world!`, and on the first line replace it with `<!DOCTYPE html>`. Here we're letting the browser know that what's coming next is HTML. 

![Image of doctype](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-23%20at%2011.41.48%20PM.png)

Now for the HTML

Think of HTML as a way of labeling things. It's like if I drew a picture with no colors or text, but labeled all the parts with (Green) or (Red) so that you could color it in correctly for me. In HTML we calls these labels tags and HTML works from most general down to more specific tags, nesting them inside eachother. 

The outtermost tags we want are the html tags, so on line 2 write `<html>`. Each tag needs a closing tag, so online 3 write `</html>`. This general format of opening tags starting with `<` and closing tags starting with `<\` will hold for pretty much all of HTML.

![Image of html tags](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-23%20at%2011.48.54%20PM.png)

Now, within the HTML tags, we seperate an HTML document into two parts, the head and the body. In the head go a lot of things that define the document, in the body go the actual contents that will be displayed. In between your HTML tags, add head and body tags. 
```
<head>
</head>
<body>
</body>
```

![Image of html tags](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-23%20at%2011.50.36%20PM.png)

Now, your site is going to need a title. In between the `<head>` tags, add: 
`<title>Your awesome title here</title>`

![Image of title code](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-23%20at%2011.56.06%20PM.png)


If you save, open up your HTML/CSS folder again and double click index.html, you should be able to see your new title on top of the browser window. 

![Image of title](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-23%20at%2011.54.54%20PM.png)

And you're site wouldn't be much without text, so let's add `Hello, world!` back in between the body tags!

![Image of hello world code](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%2012.12.58%20AM.png)

Double click your file in your folder, revel in the glory. 

![Image of hello world browser](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%2012.13.58%20AM.png)

Congrats! You've reach checkpoint 1! Copy and past what's in `checkPoint1.html` into your own file if you didn't get all that. 

------
#### Section 2
What's that? Site looks a little lame? Well just you wait. It's time to add some style. 

Open up a new window in Sublime and save it as `index.css` in your same HTML/CSS folder. CSS stands for Cascading Style Sheet, but we'll explain that later. 

![Image of saving css](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%201.00.59%20AM.png)

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

![Image of code in the file](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%201.55.18%20AM.png)

Go ahead and copy and paste that code into your `index.css` and double click your `index.html` file to check it out in the browser. 

But wait, it all still looks the same. That's because we haven't told the index.html where to look for its style yet. 

Switch back to looking at `index.html` and add this in between the `head` tags beneath `title`:
`<link type='text/css' rel='stylesheet' href='index.css'>`

Things in the head don't get rendered visibly on the page (except for the title!) but rather tell the page where to long for its dependencies (things that it depends on). In this case we're saying, "Hey, look at this file, it's type is text/css (type), it's relation to me is a stylesheet (rel), and you can find it here (href)."

![Image of link code](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%202.01.38%20AM.png)

Now let's refresh the page (or double click on index.html again). Killin it!

Okay, cool. So now we can style things in index.html by writing css in index.css

Let's change our background color from black to the color we're going to use for the rest of the time: ` #ccf5f` (<-- that's a color written in hexidecimal, which is a fancy way of writing colors with character, click [here](http://www.w3schools.com/tags/ref_colorpicker.asp) to see a whole chart of 'em!).

index.css should now look like: 
```
body {
  background-color: #ccf5f5;
  color: white;
}
```

Okay, now remember how I was saying that HTML is basically just a bunch of tags nested in each other? It doesn't stop with `<head>` and `<body>`, but there are tags for links, images, videos, paragraphs, headings, you name it! There are lots of great resources for learning more about these online (like [codecademy!](http://www.codecademy.com/tracks/web)), so we're only going to cover a couple of them here.

Here, we're going to use `<div>` tags, which are basically used as a way of dividing up and styling things on your page. It'll make a lot more sense in a second, I promise!

Let's delete `Hello, world!` for the time being and add a `<div>` in it's place. Remember, it'll need an open and a close tag, like: `<div> </div>`

![Image of divs code](https://raw.githubusercontent.com/hackatbrown/workshops/master/workshop1-html-css/screenshots/Screen%20Shot%202014-09-24%20at%202.20.03%20AM.png)

But let's think about how we're going to style these. Remember how we used `body` in the css before to refer to `<body></body>`? Well that worked well for body, because there's only one. But what if we have lots of `<div>`s and we want to differentiate? Enter ID's and Classes. 

ID's are used for talking about one `<div>` specifically, and classes are used to talk about all the `<div>`s that have that class. Here's how it looks:

`<div id="divOne" class="bunchOfDivs"></div>`

Go ahead and delete your current div in your code and copy and paste this one in. 

Now, how do we select these in our CSS document?
