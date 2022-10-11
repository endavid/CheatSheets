# Image Manipulation

Useful CLI commands for manipulating video, mainly using `ImageMagick`.

## Basics

### Geometry

Important for commands like crop. Read [Geometry](https://legacy.imagemagick.org/script/command-line-processing.php#geometry)

E.g.

```bash
{size}{+-}x{+-}y
# Horizontal and vertical offsets x and y, specified in pixels
# e.g. 600x900+40+60
```

## How To

### Crop

```bash
convert ${INPUT} -crop {size}{+-}x{+-}y ${OUTPUT}
# See Geometry
# e.g. convert a.png -crop 600x900+0+0 b.png
```

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

### Get layer names from XCF / PS file

```bash
identify -format '%[p]:%[l]\n' image.xcf
```

Returns:

```log
0: name-layer-0
1: name-layer-1
...
```

Read [Format and Print Image Properties](https://imagemagick.org/script/escape.php)

### Concatenate images horizontally

See [Combine multiple images using ImageMagick](https://superuser.com/q/290656)

```bash
convert img1.jpg img2.jpg +append out.jpg
```
