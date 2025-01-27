#!/bin/env perl

# Author [0]: Miguel Negrão (-)
# Author [1]: José Areia (jose.apareia@gmail.com)
# Date: 2025/01/27
# Version: 1.2.0
# Original Reference: Matthias Geier - Latexmk
# Reference Link: https://mg.readthedocs.io/latexmk.html
# Dependencies: ["latexmk"]

# Choose TeX engine for PDF generation. Options are:
# 1: PDFLaTeX
# 2: Postscript Conversion
# 3: DVI Conversion
# 4: LuaLaTeX
# 5: XeLaTeX
$pdf_mode = 5;

# Main TeX file.
$root_filename = 'IPleiriaMain.tex';

# Additional flags for the TeX engine.
set_tex_cmds("--shell-escape --synctex=1 --file-line-error --halt-on-error %O %S");

# Extra extensions of files to remove in a clean-up.
$clean_ext = 'aux bbl blg brf idx ilg ind lof log lot out toc fdb_latexmk fls synctex.gz';

# Modify the default 'biber' call to improve error detection and clarity.
$biber = "biber --validate-datamodel %O %S";

# Delete the .bbl file during clean-up if the bibliography file is present.
$bibtex_use = 1.5;

# Show used CPU time.
$show_time = 1;

# Write all auxiliary files in a separate directory
$aux_dir = '.aux';

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

$success_cmd = "echo '[ OK ] Compilation of $root_filename successful!'";

print `find . -maxdepth 2 -type f -name "*.tex" | sed -nE 's|\\./(.*)/.*|\\1|p' | sort -u | xargs -I {} mkdir -pv "$aux_dir"/{}`;