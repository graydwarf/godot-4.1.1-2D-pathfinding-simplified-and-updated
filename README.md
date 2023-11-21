# Poplava Note:
### I forked this branch from an early 4.0 beta version. This 4.1.1 version is greatly simplified because of new navigation features. I also added retry to improve chances of agents reaching their target. Some of the information down below is based on the original branch which I preserved and updated. Shout out to sjharb/NavigationServer2DTest. I stood on his shoulders.

# godot-4.1.1-2D-pathfinding-simplified-and-updated
### Godot NavigationServer2D test for Godot Engine 4.1.1.

#### See the original developers 3.5 branch for old demo. 
https://github.com/sjharb/Navigation2DServerTest/tree/3.5

#### See the original developers 4.0 branch for beta demo. This one contains an early and somewhat busy implementation. It also has a primitive zoom feature along with some other visual helpers that I removed in the 4.1.1 project.
https://github.com/sjharb/NavigationServer2DTest

Godot 3.5 demo video (Still very similiar to the 4.x implementations)
https://youtu.be/WCDA0O8VUIE

#### Basic 2D navigation server demo in Godot Engine 4.x using the following components
- [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html)
- [NavigationAgent2D](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html)
- [NavigationObstacle2D](https://docs.godotengine.org/en/stable/classes/class_navigationobstacle2d.html)

#### Mouse interactive to add Navigation Agents and move Navigation Obstacles
- Left Mouse click to change navigation agent(s) target position, dragging is allowed. i.e. hold down the left mouse button and move the agent target.
- Left Mouse click to move obstacles, click and drag to observe navigation agents avoid moving navigation obstacles.
- Right Mouse click to add navigation agent characters.
