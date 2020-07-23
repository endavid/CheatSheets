# Maya

## Geometry

### Create low-poly model

To reduce the polygon count:

1. `Mesh → Reduce`
2. `Edit → Delete by Type → Non-Deformer History`. This is to avoid this error when exporting the file: "The plug-in has detected mesh nodes with unsupported operators that affect the vertex and/or face count". [Ref](https://www.shibuya24.info/entry/2018/03/12/000000)

Now you can export the file to even Collada/DAE. Note that this keeps the correct skinning in skinned models.

Note that the `Remesh` modifier in Blender does not preserve the skinning, but the `Decimate` one does.
