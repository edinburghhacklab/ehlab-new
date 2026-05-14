---
title: "CNC Quickstart"
date: 2013-11-26
categories: 
  - "mech"
---

This guide will get you running with the CNC for manual machining operations.

<iframe src="//www.youtube.com/embed/u3LBP007X3Y" height="440" width="600" allowfullscreen frameborder="0"></iframe>

### Turn it on!

There are three powered units:

1\. computer & monitor

2\. the electronics and stepper motors (powered by a computer power supply)

3\. The CNC cutter, after turning it on at the wall, you also need to set the direction of the cutter, and turn the speed up. It will not turn the cutter until the speed is set to zero and then increased (so it doesn't start spinning by accident)

<!--more-->

### Start Linux EMC machine controller

This runs g-code, but if you just want to cut a few holes you can "jog" the machine manually, and use its readings as a fancy ruler. For safety reasons, it starts in an "off" state (but the software off state is not actually wired to our machine).

1\. turn the software on (two buttons on top left, "power" then "ready")

2\. Now you can use the cursor keys + page up and page down to move the head

3\. Turn the jog speed up or down to control the speed.

### Align the vice!

You want to cut a rectangle right? The vice needs to be true to the machine axis.

1\. Fasten the vice at just a single point so it can rotate. Start with a gratuitously misaligned vice jaws

2\. But a piece of cylindrical rubbish metal in the chuck. Don't tighten the chuck around a non-precision cylinder and damage the chuck though! Leave it loosish as we are not cutting.

3\. Move the chuck with jog to near the edge of the vice, near the fastened joint.

4\. Move the chuck along the slots of the jaws, so that the cylinder rubs against the jaws and reduces misalignment.

5\. Repeat a few time, gradually refining the alignment. Use a low jog speed to initialise the stroke on the last run.

6\. Fix the other point(s) of the vice.

### Get ready to cut

1\. The z axis only has 2cm of travel. Use the manual column adjustment at the back to get the cutter near your work piece. THIS MANUAL ADJUSTMENT IS LOCKABLE. IT MIGHT BE LOCKED WHEN YOU ARRIVE

2\. Most of out milling bits are for cutting \*sideways\*. Use a normal drill bit if you want to cut holes. Don't drive a milling bit straight down, give it some sideways travel as you plunge downwards, or do it in lots of small down, side cuts, or drill a hole and then swap to a milling bit.

3\. With wood you can just go for it. Using the biggest cutter possible for the job is a good stratergy, because the periphery of the blades spin the faster the larger the cutter diameter. If you want a good finish, you need to cut a certain way, and respect the grain in a certain way. Go google it.

4\. IF YOU ARE CUTTING METAL, USE LUBRICANT AND CLEAR CHIP DEBRIS AS YOU GO. A can of air is good for chip removal.

### Things to listen for

An ugly grinding noise can be the steppers skipping. Try lubricating and cleaning the axis. You can take the whole movable tray off by simply driving it to the edge of its movement.

### Zeroing the axis

There are buttons on EMC called home (sets the zero), and touch off (sets an offset from home for the coordinate system). For manual stuff you normally just use home as a quick zero function. Touch off is useful for registering a known non-zero position ready for running a CNC program.

### Tidy up after

1\. Vacuum up the mess you made!

2\. Pay attention to debris in the axis.

3\. Put the tools away including the milling bit!

### CNC

To get the machine to do the movements itself, you need to run a g-code program using EMC ([RTFM](http://www.linuxcnc.org/)). EMC will not generate a g-code program for an arbitrary shape though. You need computer aided manufacture (CAM) to translate between a CAD drawing and a g-code program, ask about this on the discuss list.
