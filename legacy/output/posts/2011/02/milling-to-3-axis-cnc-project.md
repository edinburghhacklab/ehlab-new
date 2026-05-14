---
title: "Milling to 3 axis CNC project"
date: 2011-02-26
categories: 
  - "mech"
---

[![](images/millingmachine.jpg "millingmachine")](http://new.edinburghhacklab.com/2011/02/milling-to-3-axis-cnc-project/millingmachine/)

This project has been a long term project nearly since Edinburgh Hacklab's formation. The goal was to take the broken RepRap, and use its 3 axis stepper motors and electronic and fit them to a basic milling machine ([Clarke CMD10 Micro Milling Machine](http://www.machinemart.co.uk/shop/product/details/cmd10-micro-milling-drilling-machine/path/metal-lathes-milldrills)).  So far we have successfully made new motor mounts for the X and Y axis and fitted the NEMA 23 steppers to it. The stepper motors can now move the workpiece from electronic instruction.

We have postponed automating the Z axis. Many useful things can still be machined without an automatic Z, e.g. PCBs, sheet profiling. Also it does not make much sense investing more time into the machine until we know the X and Y axis will work as desired. While we know that the X and Y turn, we do not know whether they occasionally skip steps which would lead to loss of accuracy in the machine.

Our focus currently is building the tool chain which turns graphical representations of objects (CAD) into lists of machine instructions (G-Code). This process of instructing a machine to cut according to a technical drawing is known as computer aided machining (CAM). The installed RepRap Arduino electronic controller is already a G-code interpreter. So we are looking for an affordable CAD and CAM software solution (preferably open source). Gareth has suggested [http://www.heeks.net/](http://www.heeks.net/) which seems to tick the right boxes.

There are still some more minor issues to resolve before we can try out heeks. Martin found a laptop for use to use with the machine, but the wi-fi does not seem to work. Before we can install any software on the machining laptop, we need an Internet connection. The machine, to minimize dust contamination, is located as far away from our computers as possible, thus complicating setting up a network connection.

Tom Larkworthy
