# Click-The-Squares-App
My submission for the final project of CUAppDev's Intro to App Dev course.

It utilizes a navigation controller as its root view controller, which is basically just the title screen.

In the title screen, you can put in a name into a UITextField, to be used in the high score screen.

When you go to (push) to the game screen (view controller), the name input into the UITextField in the title screen is stored within the game screen view controller.

For the actual game itself, one is given 60 seconds to click on as many randomly generated moving squares as possible.

When a square (UIButton) is generated, it is positioned randomly on the screen, given a random color, and given cardinal direction to move in (the direction is determined by a random integer between 0 and 3, inclusive).

The game updates itself 60 times a second via an object of the CADisplayLink class. Time is kept via this object as well.

Once 60 seconds are up, the score is added to the high score list, which can later be accessed from the title screen, which you can go back to via the Back button since the title screen is a UINavigationController.

Only the top 10 scores are maintained. Once a score no longer qualifies for the top 10 spots, it is removed.