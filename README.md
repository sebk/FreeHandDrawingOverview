FreeHandDrawingOverview
=======================

some freehand ios drawing implementations



## Purpose

Quite know I am trying to implement a simple freehand drawing app. I found some great implementations. So this repo is mainly a collection of other implementations, so that I can test various projects. 


## Requirements

**For the user in general:**

 * Draw with one finger
 * Change the color for a new drawing
 * Zomm in and out
 
**Be a good app:**

* Don't be laggy no matter how often the user draws
* The drawing should not be pixelated even when zoomed in


## Problems for me

* Drawing becomes pixelated when zoomed in
* App becomes laggy when drawing to long or to much
* Can't draw with a new color very good
* Want to avoid caching or drawing previous drawing in an image, doesn't work quite well
* Drawing will not be shown correct when the device rotates

A lot of problems...


## Other implementation

I tried to link to the related github repositories. I've included these as submodules.

To init and update these submodules do:

    git submodule init
    git submodule update
    
When I can't find the git repo anymore I included the code directly.

Please notify me when you don't want to be included in this repository.


## TODO

* Integrate Code from Erica Sadun
