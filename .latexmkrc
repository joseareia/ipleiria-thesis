#!/bin/env perl

# Author [0]: Miguel Negrão (-)
# Author [1]: José Areia (jose.apareia@gmail.com)
# Date: 2025/01/08
# Version: 1.1.0
# Original Reference: Matthias Geier - Latexmk
# Reference Link: https://mg.readthedocs.io/latexmk.html
# Dependencies: ["latexmk"]

$pdf_mode = 5;

$root_filename = 'IPleiriaMain.tex';

set_tex_cmds("--shell-escape --synctex=1 %O %S");

$clean_ext = 'aux bbl blg brf idx ilg ind lof log lot out toc fdb_latexmk fls synctex.gz';

$success_cmd = "echo 'Compilation of $root_filename successful!'";

$pdf_previewer = 'start okular %S';

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    pushd $path;

    if ($silent) {
        system "makeglossaries -q '$base_name'";        # For Unix-based systems.
        # system "makeglossaries", "-q", "$base_name";  # For Windows-based systems.
    } else {
        system "makeglossaries '$base_name'";           # For Unix-based systems.
        # system "makeglossaries", "$base_name";        # For Windows-based systems.
    };

    popd;
}