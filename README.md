# spritesheet-splitter
splits a sprite sheet into indivisual images

# Usage

split.exe filename sprite_width sprite_height skip

* filename - name of file to process supports jpg and png
* sprite_width - width of the indivisual sprite
* sprite_height - height of the indivisual sprite
* skip - skip a sprite frame. If there are many sprite frames and you only want part of them you would type in 1 to skip every other frame or 2 to skip every 2 frames etc. Use 0 to process all frames

e.g. There are 20 64x64 sprites in a sprite sheet named spritesheet.jpg and you want to split all the images in the sheet

split.exe spritesheet.jpg 64 64 0

Download: https://github.com/creamcast/spritesheet-splitter/releases/download/untagged-bb766d3da7a7f63712c5/split.exe
