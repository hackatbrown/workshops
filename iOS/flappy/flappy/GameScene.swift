//
//  GameScene.swift
//  flappy
//
//  Created by Justin, Nate, and Valentin on 1/28/15.
//  Copyright (c) 2015 Hack@Brown All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //Set the initial value for our score / game state, and associate 
    //some labels with the variables to show our user.
    //
    // SKLabelNode is just a type of node that represents a label. we can add
    // other types of nodes to our scene too (try searching for SKShapeNode!)
    var score = 0
    var gameOver = false
    var scoreLabel = SKLabelNode()
    var gameOverLabel = SKLabelNode()
    
    
    var bird = SKSpriteNode()
    var bg = SKSpriteNode()
    var labelHolder = SKSpriteNode()
  
    // Here we create unique identifiers for each of our sprite groups.
    // The idea is to have one identifying bit set in each of the numbers
    // that describes the group. 
    
    // The "<<" is a bit shifting operator. It performs an 'arithmetic'
    // shift, which slides over all the bits and makes any bits that 
    // slide off the end of the number overflow and become zeroes.
    //
    // Here's an example:
    //  (0010) << 1 = (0100) *no overflow*
    //  (0010) << 3 = (0000) *the one was pushed off the ledge!*
    //
    // If you find bits interesting, consider taking CS33!

    // 00000.000 in binary (no mask!)
    
    let birdGroup:UInt32 = 1 << 0
    // 00000...1 in binary
    
    let objectGroup:UInt32 = 1 << 1
    // 00000..10 in binary
    
    let gapGroup:UInt32 = 1 << 2
    // 00000..100 in binary
    
    var movingObjects = SKNode()
    
    
    

    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        //Establish our gravitational vector. We're choosing to have a vector
        //pointing down with strength 3, but you can modify this as needed
        self.physicsWorld.gravity = CGVectorMake(0, -3)
        
        self.addChild(movingObjects)
        
        makeBackground()
        
        self.addChild(labelHolder)
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.color = UIColor.blackColor()
        scoreLabel.fontColor = UIColor.brownColor()
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - 70)
        self.addChild(scoreLabel)
        
        //These two steps load our textures for the bear. 
        //
        // If you want some sort of animation to take place instead of the same image being used,
        // simply change the textures (or copy and paste the lines and add more!)
        //
        //SKTexture allows us to reuse a texture, instead of repeatedly loading it.
        var birdTexture = SKTexture(imageNamed: "brownBear.png")
        var birdTexture2 = SKTexture(imageNamed: "brownBear.png")
        
        var animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1)
        var makeBirdFlap = SKAction.repeatActionForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture)
        bird.setScale(100/bird.frame.size.width)
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bird.runAction(makeBirdFlap)
        
        //Because bird.physicsBody is an instance variable and may not have been instantiated,
        //swift requires us to refer to it with optional syntax (!). By using the question
        //mark, we're assuming responsibility for bird's instance variable, since we know it
        //was just instantiated in the line below. This can cause a crash if you're not careful!
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2)
        bird.physicsBody!.dynamic = true
        bird.physicsBody!.allowsRotation = false
        bird.physicsBody!.categoryBitMask = birdGroup
        bird.physicsBody!.contactTestBitMask = objectGroup | gapGroup;
        bird.physicsBody!.collisionBitMask = objectGroup
        
        /* 

        What are collisionBitMask, categoryBitMask, and contactTestBitMask?
        
        
        categoryBitMask:
        
            - Some number who's bits each represent being in some kind of category.
            
                For instance, a banana may have a categoryBitMask with the first bit set,
                    and an apple may have the second bit set. If an object is BOTH a banana
                    and an apple, both bits can be set.
                This number just lets other objects know what *kind* of object this is. You have
                to agree on which bits to set (set the n-th bit by doing x = x | (1 << n))
        
        contactTestBitMask:
        
            - If the n-th bit of this number is set, that *category* of object will produce a
                contact hit (see didBeginContact()) when it hits an object of that type.
        
        collisionBitMask:
            
            - When two objects collide, collisionBitMask from each object is ANDd with the 
                categoryBitMask of the other object. If the result is a nonzero number, a collision
                occurs. 
        
                Essentially, if your n-th entry is on, the category of objects represented by 
                that n-th bit will trigger collisions with this object. In this case, we only
                want to collide with pipes, so we pass 'objectGroup' as our mask.
        
                If we wanted to collide with pipes AND gaps, we could pass objectGroup | gapGroup
                but we wouldn't get very far!
        
        For more detailed, correct information, see the SpriteKit documentation
        
        https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKPhysicsBody_Ref/index.html#//apple_ref/occ/instp/SKPhysicsBody/collisionBitMask
        
        */
        
        
        
        //The z-position tells us how much the sprite should 'pop out' -- rather,
        //with what priority it should be layered on top of other sprites.
        //
        //Since we want our bird to be the top thing all the time, we can set the zPosition
        //to a higher value than all of our nodes to guarantee this.
        bird.zPosition = 10
        
        self.addChild(bird)
        
        var ground = SKNode()
        ground.position = CGPointMake(0, 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody!.dynamic = false
        ground.physicsBody!.categoryBitMask = objectGroup
        self.addChild(ground)
        
        //This timer will repeat and call the function 'makePipes' to generate the
        //obstacles for our flappy bird.
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makePipes"), userInfo: nil, repeats: true)
        
    }
    
    func makeBackground() {
        
        var bgTexture = SKTexture(imageNamed: "h@bBack.png")
        
        //We accomplish a 'moving' background by repeatedly scrolling it back and forth.
        //This saves resources, because we're only using one image and 3 sprites for our background.
        
        var movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        var replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        var movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        for var i:CGFloat=0; i<3; i++ {
            
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y: CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height
            bg.runAction(movebgForever)
            movingObjects.addChild(bg)
        }
        
        
    }
    
    /**
    *   This function gets called by a timer that we set up to generate the pipes for our game.
    *   It handles inserting them into the scene and generating our textures.
    *
    *   What might we do to improve this function?
    *
    */
    func makePipes() {
        
        if (!gameOver) {
            
            let gapHeight = bird.size.height * 4
            
            var movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
            
            var pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
            
            var movePipes = SKAction.moveByX(-self.frame.size.width * 2, y: 0, duration: NSTimeInterval(self.frame.size.width / 100))
            
            var removePipes = SKAction.removeFromParent()
            
            var moveAndRemovePipes = SKAction.sequence([movePipes, removePipes])
            
            var pipe1Texture = SKTexture(imageNamed: "pipe1.png")
            var pipe1 = SKSpriteNode(texture: pipe1Texture)
            pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipe1.size.height / 2 + gapHeight / 2 + pipeOffset)
            pipe1.runAction(moveAndRemovePipes)
            pipe1.physicsBody = SKPhysicsBody(rectangleOfSize: pipe1.size)
            pipe1.physicsBody!.dynamic = false
            pipe1.physicsBody!.categoryBitMask = objectGroup
            movingObjects.addChild(pipe1)
            
            var pipe2Texture = SKTexture(imageNamed: "pipe2.png")
            var pipe2 = SKSpriteNode(texture: pipe2Texture)
            pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2.size.height / 2 - gapHeight / 2 + pipeOffset)
            pipe2.runAction(moveAndRemovePipes)
            pipe2.physicsBody = SKPhysicsBody(rectangleOfSize: pipe2.size)
            pipe2.physicsBody!.dynamic = false
            pipe2.physicsBody!.categoryBitMask = objectGroup
            movingObjects.addChild(pipe2)
            
            var gap = SKNode()
            gap.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipeOffset)
            gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipe1.size.width, gapHeight))
            gap.runAction(moveAndRemovePipes)
            gap.physicsBody!.dynamic = false
            gap.physicsBody!.collisionBitMask = 0
            gap.physicsBody!.categoryBitMask = gapGroup
            gap.physicsBody!.contactTestBitMask = birdGroup
            movingObjects.addChild(gap)
            
        }
        
    }
    // It turns out that SKTexture will cache textures automatically, so you don't need to worry
    // about making new SKTextures every time.
    
    
    func didBeginContact(contact: SKPhysicsContact!) {
        
        
        //Here what we're doing is a boolean AND operation. before we defined some bitwise
        //flags, and here we want to see if a particular bit is set in a number.
        
        //For instance, say that if the second bit in a number is 1, it means that our sprite is a super bear.
        //
        // We take our sprite's bitmask (unique number) and check it against a reference number that ONLY has the
        // second bit set. One way we might arbitrarily check to see if this bit is set is to walk through each bit
        // of the sprite's bitmask, and see if the corresponding bit is set in the reference number. If both are set,
        // we can set the bit in the output.
        //
        // Here's an example, for clarity:
        //           Bitmask: 1100
        //       monkey mask: 0001
        //         --------------
        //                   0000
        //
        // So if no bits match, you get 0 as your answer. And if the bits DO match, you get a non
        // zero answer!
        
        if ((contact.bodyA.categoryBitMask & gapGroup) > 0) || ((contact.bodyB.categoryBitMask & gapGroup) > 0) {
            
            score++
            
            scoreLabel.text = "\(score)"
    
        } else if (!gameOver){
                
                gameOver = true
                movingObjects.speed = 0
                gameOverLabel.fontName = "Helvetica"
                gameOverLabel.fontSize = 30
                gameOverLabel.text = "Game Over! Tap to play again."
                gameOverLabel.fontColor = UIColor.blackColor()
                gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                labelHolder.addChild(gameOverLabel)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        if (!gameOver) {
            
            bird.physicsBody!.velocity = CGVectorMake(0, 0)
            bird.physicsBody!.applyImpulse(CGVectorMake(0, 100))
            
        } else {
            
            score = 0
            scoreLabel.text = "0"
            
            movingObjects.removeAllChildren()
            
            makeBackground()
            
            bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
            bird.physicsBody!.velocity = CGVectorMake(0, 0)
            labelHolder.removeAllChildren()
            gameOver = false
            movingObjects.speed = 1
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
