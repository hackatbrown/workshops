## Animation Workshop

[Step-by-Step: How to Make an Animated Movie](http://cgi.tutsplus.com/articles/step-by-step-how-to-make-an-animated-movie--cg-3257)

##### Camera Controls  
* **tumble**: option + drag with left mouse
* **zoom**: option + right mouse
* **pan**: command + option + left mouse

##### Object Operations
* **translate**: w
* **rotate**: e
* **scale**: r (the middle one scales uniformly along all axes!)
* **ctrl + z** (undo) works in Maya, too!

##### Steps in Maya
1. **Changing settings**  
window -> settings/preferences -> interface -> set *mouse tracking* to *2 button*  
create -> polygon primitives -> uncheck *interactive creation* 

2. **Warm-up: making a cube**  
create -> cube

3. **Making the snowman**  
Make 3 spheres, scaled and translated so they form the stack of a snowman. Scale in Maya is all relative!

4. **Naming objects**  
Click on the bottom sphere, then click the file icon on the top right (3rd icon from the right) -> psphere1 -> attribute editor. Name your objects something useful! We used *snowman_bottom*, *snowman_middle*, and *snowman_top*.

5. **Making the eyes**  
Make the first eye by adding another sphere. Ideally, the snowman will have symmetric eyes... Click on the first eye you made, type **command + d** to duplicate the eye, and translate the new eye to the other side of the face. Remember to name your objects in the attribute editor!

6. **Making the nose**  
Add another object, this time a cone. Translate, rotate, and scale until the nose is in position. Remember to name your object!

7. **Forming a group**  
window -> outliner to see all of your named objects in a handy menu   
snowman_top -> **command + click** all of the objects on the head (the eyes and nose) -> **command + g** to group the objects together -> name this group 'snowman_head'  
Make the whole snowman a group!

8. **Making the water**  
Add a plane object, and increase the scale to make it large enough to look like an ocean... Make sure to give the object a name!

9. **Making the island**  
Add a sphere, translate, rotate, scale, name! Half of the sphere will look like it's underwater. Move the snowman onto the island (this is easy because we made the snowman into its own group).

10. **Inserting the camera**  
rendering tab -> camera icon  
panels -> look through selected -> aim the view at the snowman  
resolution gate (white rectangle with blue sphere) shows you the picture area  
Name this your render cam.

11. **Locking the camera**  
select render cam -> channel box (sideways tab on the right, by the attribute editor) -> click + drag all the properties -> right click -> lock selected  
This makes sure that we won't accidentally move the view of our render cam!

12. **Leaving the render cam**  
panels -> perspective -> persp

13. **Lighting**  
**Directional light** is parallel light in a given diretion; its location in the scene doesn't matter. A **point light** emits light in all direcitons from a point, and its location does matter. A **spotlight** emits light in a cone shape, and its location also matters.  
The **key light** is the brightest light in the scene, and forms the shadows. A **fill light** is less bright and makes sure that the whole scene has some light and isn't too dark. A **rim light** accentuates form by adding highlights to objects.

14. **Making a directional light**  
Add a new direcitonal light.
modify -> transformation tools -> show manipulator tool  
Move the manipulator tool to the snowman's head to aim the light straight at the snowman!  
attribute editor -> name this light key -> keyShape -> adjust the intensity and color (use your artistic license here! We used an intensity of about 2).

15. **Viewing the light**  
top toolbar  -> clapboard button (second from left) -> render the current scene

16. **Making the fill light**  
Use **command + d** to copy the key light, move the new light behind the snowman, and rename it to be your fill light. Adjust the intensity to be less than the key light (we used 0.7). Consider adding some blue to this light to reflect the water and sky in the scene.  
fillShape -> shadow -> uncheck *use ray trace shadows*

17. **Shading the snowman**  
**Click + shift** on the three snowman spheres -> right click -> assign new material  
Select blin as the material, and change the name to be your snowman material. Change the material attributes (can be reached from a right click).   
A **diffuse** texture is not shiny, while a **specular** texture is very shiny and shows highlights. Set the color, specular rolloff, reflectivity, and eccentricity (how tight the specular highlight is). A snowman would probably have a near white color, a specular rolloff of about 0.2, and no reflectivity.

18. **Shading the ocean**  
Select another blin material, and rename it to be your water material. Give the water some attributes! Continue adding materials to the rest of the objects: eyes, nose, and sand.

19. **Setting key frames**  
Select the head, and go to the channel box next to the attribute editor. In animation, we tell things to move with key frames. Set the beginning and end frames, and Maya will interpolate to fill in the frames in between.
Press the **s** key to set the frame. Move the timer to a later time (we did 25) and rotate the head to the side. Set this key frame by hitting **s** again. Continue setting more key frames along the timeline.

20. **Playing back the animation**  
Go to frame 1 and hit the play button to see your animation!  
window -> preferences -> time slider -> real time -> save
