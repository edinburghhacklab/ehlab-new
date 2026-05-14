---
title: "A Java implementation of persistent red-black trees open sourced"
date: 2011-07-24
categories: 
  - "software"
---

Make search go mega fast! O(log(n)) inserts and deletes on ordered lists, but with the twist that the original list before modification remains intact! Implemented by using path-copying as per "Making Data Structures Persistent" Driscoll, Sarnak, Sleator and Tarjan.

[PersistentRedBlackTreeSet](http://wiki.edinburghhacklab.com/PersistentRedBlackTreeSet)

This was quite tricky to implement, because you are not allowed parent pointers, so you got to keep a linked list for the way back up when diving down, whose integrity can't be compromised when you are doing the red-black spaghetti balancing act.
