# Image Manipulation

Useful CLI commands for manipulating video, mainly using `ImageMagick`.

## How To

### Extract a layer from a GIMP / PS file

Use the `[${layer_index}]` syntax:

```bash
# Extract first layer
convert ${INPUT}.xcf[0] $OUTPUT.png
# Extract 4 layers, starting from the 9th one (index=8)
for i in {0..3}
do
    convert ${INPUT}.xcf[$((i+8))] "${OUTPUT}-$i.png"
done
```
