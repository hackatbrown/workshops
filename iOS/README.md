#iOS Workshop

Welcome to iOS Workshop! Today, we will be making our own flappy bird game, Flappy Bear. 

For this workshop, we will be using the software Xcode, which can be installed [here](https://developer.apple.com/xcode/downloads/).

We will be coding in Swift, a super cool, simple language recently created by Apple for iOS and OS X development. Let's start off by going over its syntax! 

###Quick Swift Overview

You can play around with code samples by making a new file on Xcode: <code>File -> New -> Playground</code>

#####Declaring Variables
Mutable variables are variables that can be reassigned multiple times, as shown below.

	var myName = "Katie"

You can also do type annotations with colons!

	var myAge : Int = 19

Immutable variables cannot be changed once they are assigned. Here is an example:

	let myVariable = 120

#####Writing a Function

Here is a sample function that takes in two Ints and returns the sum of the two numbers as an Int:

	func myAdd(numberOne : Int, numberTwo: Int) -> Int {
		return numberOne + numberTwo
	}

Awesome! Are we ready to make an iOS app now? Let's get to it!

###Hello World Project

To create a new Game project on Xcode, navigate to: <code>File -> New -> Project -> Game</code>

Make sure to select the following settings.
* Language: Swift
* Game Technology: Spritekit

Run the project now to see the default app that generates spaceships at every click!

###Our Own Flappy

Now that we have the project open, let's program our own game. All files are located in the <code>flappy</code> folder with amazing comments that will guide you through the code! Start by following along the <code>GameScene.swift</code> file. As implied by the title of the file, this is where the code for the game scene will happen.
