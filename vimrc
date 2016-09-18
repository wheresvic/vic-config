
"Show line numbers
set number

"Convert tabs to spaces
set expandtab

"Hard line wrap at 80 chars
"set textwidth=80
"set formatoptions+=t

"Soft wrapping at 80 chars
"Unfortunately, this is not possible. There are many many ways to configure how a wrap should occur, such as with textwidth and wrapmargin, but these are only for hardwraps, not softwraps. The only way to change a softwrap is by changing your window size.

"There are some plugins that sort of do what you want, where the wrap occurs in an area smaller than your window. There is mikewest/vimroom and junegunn/goyo.vim, but for both of these, a smaller softwrap is mainly just a side-effect of the main purpose of the plugin: To declutter your vim window and remove distractions.

"An ugly workaround could be to open a split and resize it to column 80, but this hardly feels like an ideal solution. (Especially since the location of the split will change when you resize your window)
":vnew | wincmd p | vertical res 80

