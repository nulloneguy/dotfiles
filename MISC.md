### Set wallpapers

# using hsetroot

```bash
#using hsetroot
hsetroot -fill <path-to-img>

# using feh
feh --bg-fill <path-to-img>

# using hydrapaper
hydrapaper -c <path-to-img>
```

### Video conversion

```bash
# .mkv -> .avi
ffmpeg -i "input.mkv" -f avi -c:v mpeg4 -b:v 4000k -c:a libmp3lame -b:a 320k "out.avi"

# .mkv -> .avi (dual audio -> single audio)
ffmpeg -i "input.mkv" -map 0:v -map 0:a:1 -f avi -c:v mpeg4 -b:v 4000k -c:a libmp3lame -b:a 320k "out.avi"

# speed change
ffmpeg -i input.mp4 -filter:v "setpts=0.005*PTS" output.mp4

# crop video
ffmpeg -i input.mp4 -filter:v "crop:1920:1080:100:50" output.mp4

# Change container
ffmpeg -i input.mkv -codec copy output.mp4
```

### Change grub screen

```bash
# open config file
sudo nano /etc/default/grub
```

```bash
# Edit or add this lines
GRUB_BACKGROUND="/boot/grub/themes/your-theme/image.png"
GRUB_THEME="/boot/grub/themes/your-theme/theme.txt"
```

```bash
# update grub
sudo update-grub
```
