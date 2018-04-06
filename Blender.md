Blender
-------

### Main keyboard shortcuts ###
* <kbd>Tab</kbd>: Switch between Object mode and Edit mode
* <kbd>Space</kbd>: Quick search commands

### Camera controls ###
On the numeric keypad
* <kbd>1</kbd>: Align camera to Y axis
* <kbd>Shift</kbd>+<kbd>1</kbd>: Align camera to Z axis
* <kbd>5</kbd>: Switch Perspective/Ortho
* <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Q</kbd>: Toggle quad view

### Create parent object group ###
* <kbd>Shift</kbd>+<kbd>A</kbd> Add Empty Axis
* Import model that contains several submeshes. All the meshes should be selected when loaded.
* <kbd>Shift</kbd> select the Empty object if it's not.
* <kbd>Ctrl</kbd>+<kbd>P</kbd> → Set Parent To Object

### Edit Mode: Selection ###
* <kbd>Alt</kbd>+ Mouse right click: select a vertex loop.
* **Loop Cut and Slide**: create a new vertex loop.

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
