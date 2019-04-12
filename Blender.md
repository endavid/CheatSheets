Blender
-------

    ________________________________________
    | Toolbar |                |  Outliner |
    |         |                |           |
    |         |   Viewport     |___________|
    |         |                | Properties|
    |         |  ,manipulator, |  panel    |
    |_________|________________|___________|
    |            Timeline                  |
    |______________________________________|

### Navigation ###
* Middle click
* <kbd>Shift</kbd> click
* Wheel
* Track pad → pinch, etc.


### Main keyboard shortcuts ###
* <kbd>Tab</kbd>: Switch between **Object Mode** and **Edit Mode**
* <kbd>Space</kbd>: Quick search commands

### Camera controls ###
On the numeric keypad
* <kbd>0</kbd>: Camera view
* <kbd>1</kbd>: Align camera to Y axis
* <kbd>Shift</kbd>+<kbd>1</kbd>: Align camera to Z axis
* <kbd>5</kbd>: Switch Perspective/Ortho
* <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Q</kbd>: Toggle quad view


    | 1 Front | 2       | 3 Side |
    | 4 R     | 5 Ortho | 6 R    |
    | 7 Top   | 8 R     | 9      |

* R: rotation increments

You can emulate keypad (enable in Prefs)
* <kbd>Ctrl</kbd> + (1, 3, 7)

### Create parent object group ###
* <kbd>Shift</kbd>+<kbd>A</kbd> Add Empty Axis
* Import model that contains several submeshes. All the meshes should be selected when loaded.
* <kbd>Shift</kbd> select the Empty object if it's not.
* <kbd>Ctrl</kbd>+<kbd>P</kbd> → Set Parent To Object

### Selection ###

Some of these only make sense in **Edit Mode**.

* <kbd>b</kbd>: box selection
* Right click: select
* Middle click: deselect
* <kbd>Shift</kbd>+ click: multiple
* <kbd>Alt</kbd>+ right click: select a vertex loop.
* Right click, <kbd>ESC</kbd>: cancel op.
* **Loop Cut and Slide**: create a new vertex loop.

### Basic manipulation ###

* <kbd>o</kbd>: proportional editing tool (wheel: +/- area)
* <kbd>g</kbd>: grab
* <kbd>r</kbd>: rotate
* <kbd>s</kbd>: scale
* While transforming, press <kbd>x</kbd>, <kbd>y</kbd>, or <kbd>z</kbd> to transform along selected axis only.
* <kbd>Shift</kbd> + <kbd>d</kbd>: duplicate
* <kbd>x</kbd>: delete
* <kbd>Alt</kbd> + <kbd>m</kbd>: merge vertices
* <kbd>z</kbd>: wireframe / solid
* <kbd>e</kbd>: extrude tool
* <kbd>Shift</kbd> + <kbd>a</kbd>: add object
* <kbd>f</kbd>: add face

### Measuring distances ###
* Select **Grease Pencil** from the left tab
* Select **Ruler/Protactor**
* <kbd>Ctrl</kbd>-drag to draw a line in your object. It should snap to the surface.
* <kbd>Esc</kbd> to stop measuring things and remove all the annotations.
* Ref. http://blender.stackexchange.com/a/19773/2373

### Checks ###
* Watertight-ness
 * select non-manifold faces http://www.mcell.org/tutorials/mesh_repair.html
 * In Edit Mode, Ctrl+Alt+Shift+M to select non-manifold faces
 * Select 3 or 4 vertices around hole, and press F to create a face.
