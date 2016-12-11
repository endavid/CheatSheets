Android Development
===================

Model-View-Controller (MVC)
---------------------------

* iOS ViewController -> Activity, Fragment, Adaptor
* iOS View -> layout, resources, Widgets and View
* Model -> Entities or classes with main business logic

Ref. http://stackoverflow.com/a/12139782/1765629


Resources
----------
### How to export a Keynote graphic to vector icon ###

1. Export the graphic as PDF
2. Import the PDF in Inkscape an save it as SVG
3. Use http://a-student.github.io/SvgToVectorDrawableConverter.Web/ to convert it to a VectorDrawable.
4. Add the file to the drawables folder.
5. Edit width and height if necessary (typically, 24dp)

A VectorDrawable is a simpler version of a SVG. Ref. https://developer.android.com/reference/android/graphics/drawable/VectorDrawable.html

### How to create a negative space in Inkscape ###

1. Select the objects you want to cut out and group them.
2. Select group and do Path -> Object to Path
3. Object -> Ungroup
4. Path -> Union http://graphicdesign.stackexchange.com/a/53300
5. Create a rectangle or whatever you want to cut out. Move it to the bottom layer.
6. Select the rectangle, and then Shift + select the path from (4)
7. Path -> Difference

Online tutorial: https://www.youtube.com/watch?v=X9Weag1lxUc
