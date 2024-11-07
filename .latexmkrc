#!/bin/env perl

# Author [0]: Miguel Negrão (-)
# Author [1]: José Areia (jose.apareia@gmail.com)
# Date: 2024-11-07
# Version: 1.0.0
# Original Reference: Matthias Geier - Latexmk
# Reference Link: https://mg.readthedocs.io/latexmk.html
# Dependencies: ["latexmk"]

$pdf_mode = 5;

$root_filename = 'IPleiriaMain.tex';

set_tex_cmds("--shell-escape --synctex=1 %O %S");

$clean_ext = 'aux bbl blg brf idx ilg ind lof log lot out toc fdb_latexmk fls synctex.gz';

$success_cmd = "echo 'Compilation of $root_filename successful!'";

$pdf_previewer = 'start okular %S';