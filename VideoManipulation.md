# Video Manipulation

Useful CLI commands for manipulating video, mainly using `ffmpeg`, and perhaps some `ImageMagick`.

## How To

### Convert images to video

Read [ref.](https://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/)

For images named `0001.png, ..., xxxx.png`:

```bash
ffmpeg -r 24 -f image2 -s 1280x720 -i %04d.png -vcodec libx264 -crf 25 -pix_fmt yuv420p test.mp4
```

### Convert images to animated GIF

Use ImageMagick:

```bash
convert -delay 1x30 -loop 0 *.ppm output.gif
```

### Convert video clip to animated GIF

To trim the video, use `-ss` to select a start time, and `-t` to set a duration. Or `-to` to send the end time.

E.g.

```bash
# starts at second 4
ffmpeg -i input.mp4 -ss 00:00:04 -to 00:00:08 output.gif
```

Convert video to GIF [without dithering](https://tyhopp.com/notes/ffmpeg-crosshatch):

```bash
ffmpeg -i ${INPUT}.mp4 -vf palettegen palette.png && ffmpeg -i ${INPUT}.mp4 -i palette.png -filter_complex “paletteuse=dither=none” ${OUTPUT}.gif
```


### Crop video

```bash
# crop a 900x1600 rectangle, starting at (150,0)
ffmpeg -i "${INPUT}" -filter:v "crop=900:1600:150:0" "${OUTPUT}.mp4"
```

To compute the crop and offset, use the aspect.
For instance, if we have a `1280x720` video and we want to crop a `9:16` vertical rectangle, horizontally centered:

```text
height = 720
width = 9 * 720 / 16 = 405
x = (1280 - 405) / 2 = 437.5 ~= 437
```

### Scale video

```bash
# For instance, scale the 405x720 9:16 from a previous example,
ffmpeg -i "${INPUT}.mp4" -vf scale=750:1334 -c:a copy "${OUTPUT}.mp4"
```

### Add green padding to top and right

This extends the video and add some extra padding to the top and right of the video.

```bash
ffmpeg -i "${INPUT}.mov" -vf "pad=iw+640:ih+360:0:360:0x00ff00" -c:a copy "${OUTPUT}.mp4"
```

### Extract mp3

The input can also be an mp3. You can use `-copy` if the input is already an mp3.

```bash
# e.g. trim 2 minutes of mp3
ffmpeg -i input.mp3 -t 120 -c copy output.mp3
# re-encode
ffmpeg -i input.mp4 -acodec libmp3lame output.mp3
# start at a 60 secs, trim, and reencode
ffmpeg -ss 60 -i input.mp3 -t 120 -acodec libmp3lame output.mp3
```