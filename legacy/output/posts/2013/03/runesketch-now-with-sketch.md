---
title: "Runesketch, now with sketch"
date: 2013-03-23
---

[![](images/logo3.png)](http://www.runesketch.com/)

So Runesketch was the game we tried to get ready for [Make Game Month in November](http://edinburghhacklab.com/2012/12/that-was-that-month-that-was-makgammon/). Sesh! That seems like a long time ago. We tried alpha testing it a bit [Feb](http://edinburghhacklab.com/2013/02/runesketch-alpha-ready/), but there were not many biters. Its hard to judge what the problem was, was it too hard to find someone to play against? Too hard to work out the rules? Too slow to play the game? Did it look too crap?

Anyway the latest iteration is much closer to our intended game design. The biggest feature is the **sketch** is in [Runesketch](http://www.runesketch.com/static/main.html#/login)! You can draw your own art, and sell it to other players for gold. We wanted a game where creative people could become become top dogs as well as the traditional gamers. If you are a good drawer, you will make so much gold that you will be able to afford the best cards. So there are multiple ways to get gold, win battles, draw art or even speculate on art.

Anyway, we think we are getting somewhere now. The other niggles have hopefully been addressed. There is: a tutorial, a multilayer version where the AI plays both hands (an async match, only one person needs to be online), loads more cards, loads more powers and a better UI. We have Facebook integration, so players have a choice between FB logins or our authentication. Facebook players are able to put their art into their photo albums (and thereby advertise their arts for sale to their friends, for fun and profit).

We have a [forum](http://runesketch.forumotion.co.uk/) as well, so hopefully it will be easier for the alpha players to communicate their feedback (although you can email me directly of course).

Technologically we have made huge strides. Before, the latency for taking a turn was 8 seconds and about 30 DB operations. Previously, during light testing we were filling our daily free allowance of Google App Engine credit in no time. Now taking a turn is 300ms, involves no database writes (the game is all in memcache), and we have not since made a dent in our daily free quota. For those interested in the technical side of things, I can't recommend the GAE [mini profiler](https://github.com/kamens/gae_mini_profiler) developed by the Khan Academy team enough. It tells you _down to the stacktrace_ where each blocking operation occurs and for how long, even on a deployed site, through a JS overlay on your site.

Anyway enjoy the game! And buy LordTom's Healing Light :p

[![Art Drawn by LordTom](images/AMIfv95OO39QfB1BRnV1Fiev8h2D4kWQo88yYsmVWaE9ssM5kaW_Kt0Rg7tcYHSwTa4hp8jT1kKkV4Tgd_5kOuVv8UFDeb9Hai7FVMbhjlM9LTDFmGVlgizBPhSpYpoLFzJbQy22h8IYUIboAkhqt0gKwzN-uJgg5iHgbvnF4ooHT0FIfIr-eDU)](http://www.runesketch.com/static/main.html#/art/368007)
