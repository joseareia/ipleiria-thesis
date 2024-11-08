## Polytechnic University of Leiria: LaTeX Thesis Template
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg?color=green)](https://www.latex-project.org/)
[![GitHub license](https://img.shields.io/badge/License-LaTeX%20v1.3c-green.svg)](https://www.latex-project.org/lppl/lppl-1-3c)
[![Release](https://img.shields.io/badge/Release-v2.1.1-green.svg)](https://github.com/joseareia/ipleiria-thesis/releases)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-Yes-green.svg)](https://github.com/joseareia/ipleiria-thesis/graphs/commit-activity)

### Description
Optimize your academic document creation with this LaTeX template tailored for theses and dissertations at the [Polytechnic University of Leiria](https://www.ipleiria.pt/). Tailored specifically for students within the School of Management and Technology (ESTG), this template guarantees a refined, timeless, and professionally formatted document. With its clean and classic aesthetic, navigating through the template is exceptionally straightforward, making document creation a seamless and efficient endeavor. Curious? Explore the [demo](https://www.overleaf.com/latex/templates/unofficial-polytechnic-university-of-leiria-estg-thesis-slash-report-template/tqgbrncfhwgt.pdf) to see more!

<p float="left">
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/01_B.png" width="400"/>
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/02_B.png" width="400"/>
</p>

### Getting started using vscode and devcontainer (docker)

The simplest way to get started is to install Latex and all necessary tools in a docker container via the devcontainer feature of vscode.

1. Install [docker](https://docs.docker.com/engine/install/) and [vscode](https://code.visualstudio.com/download).
1. Open this directory in vscode.
1. Install the "Remote Development" extension pack in vscode using the extensions panel.
1. Do Ctrl+Shift+P and run "Dev Container: open folder in container". 
1. Open IPleiriaMain.tex, click the "TeX" icon the bar on the left, and click on "Build LaTeX project".

If you have access to Gitub Codespaces you can also start a codespace on this repository in order to work on the latex document directly on the web without installing anything on your computer. Just do Code > Codespaces > '+'.

> **Note:**
> It might take upwards of 30 minutes to install texlive in the container.

### Getting Started
To utilise this template, please follow the steps below.

1. Download LaTeX:
    - Linux: Install [TeX-Live](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org/).
    - Windows: Install [TeX-Live](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org/).
    - macOS: Install [MacTeX](https://www.tug.org/mactex/) (a macOS version of TeX-Live) or [MikTeX](https://miktex.org/).
2. Download `IPLeiria Thesis` by either:
    - Cloning this GitHub repository (<kbd>git clone https://github.com/joseareia/ipleiria-thesis.git</kbd>).
    - Download the latest version as [ZIP file](https://github.com/joseareia/ipleiria-thesis/archive/refs/heads/master.zip).
3. Compile the document with you favorite LaTeX processor (pdfLaTeX, XeLaTeX or LuaLaTeX)!

> [!TIP]
> To make the most of this template and for real-time collaboration, I highly recommend using [Overleaf](https://www.overleaf.com/home-2). You can access the ready-to-use template by clicking [here](https://www.overleaf.com/latex/templates/unofficial-polytechnic-university-of-leiria-estg-thesis-slash-report-template/tqgbrncfhwgt).

### Dependecies
To use this template locally, ensure that you have the following dependencies installed:

- **Lato Font:** Required for document styling. On debian-based systems install with `sudo apt install fonts-lato`. Can be downloaded [here](https://fonts.google.com/specimen/Lato?query=lato).
- **Texgyre Fonts:** Essential for specific font styles; On debian-based systems install with: `sudo apt install fonts-texgyre`.
- **Rubber** and **inotify-tools** (Optional): Necessary for automated compilation. Can be installed with:

```
$ sudo apt install rubber inotify-tools
```
- **Make**: Required to run the build scripts, install with: `sudo apt install make`.
- **Latexmk** (Optional): Necessary for automated compilation and argument parsing. Can be installed with:

```
$ sudo apt install perl latexmk
```
Make sure all these dependencies are in place to ensure smooth usage of the template.

### Compile

To compile this template, you have two options:

1. **Using the Makefile**: Simply run `make` in the terminal to automatically build the document. This requires the the rubber tool.
2. **Using Latexmk**: Alternatively, you can use **Latexmk** with the provided configuration file `.latexmkrc` for automated compilation. Just run `latexmk` in the terminal.

> [!NOTE]
> These methods are intended for use in a local environment.

Both methods have been successfully tested with the following versions:

- TeXLive 2024
- Latexmk 4.85
- Make 4.3

Choose the method that best fits your workflow!

### Content Overview
This repository has the following structure.

- **Bibliography**: Contains the bibliography file used for references.
- **Chapters**: Includes individual chapters of the thesis.
- **Code**: Includes any code examples related to the thesis.
- **Figures**: Contains figures and images used in the thesis.
- **Matter**: Contains additional matter (e.g. acronyms, glossary, etc.) and front/back pages for the thesis.
- **Variables**: Includes the `Variables.tex` document, where you can change the all the document variables.
- **IPLeiriaMain.tex**: Main LaTeX file for compiling the thesis content.
- **IPLeiriaThesis.cls**: LaTeX class file containing the formatting and styling specifications.

### Multilanguage Support
This template offers multilanguage support in two languages: English and Portuguese. **If you wish to add support for more languages, please contact me**. To change the language, simply modify the first line (*document class definition*) of the `IPLeiriaThesis.tex` file to the desired language: `pt` for Portuguese and `en` for English. Here is an example: `\documentclass[en]{IPLeiriaThesis}`. Easy, right?

### Ease of Changing Style
Don't like the new modern cover? No problem, I’ve got you *covered*! This template now includes a new class option, `bwcover`, which allows you to switch the cover to a black-and-white mode. Simply add it like this: `\documentclass[en,bwcover]{IPLeiriaThesis}`, and the change will be applied automatically. If you have any other style suggestions, feel free to share them with me!

### Getting Help
If you have any questions regarding the template, its usage, or encounter any errors you're struggling with, please feel free to open an issue in this repository, or contact me via email at <a href="mailto:jose.apareia@gmail.com">jose.apareia@gmail.com</a>.

### Contributing
Contributions to this template are welcome! If you encounter any issues, have suggestions for improvements, or would like to add new features, please submit a pull request. We appreciate your feedback and contributions to make this template even better.

### License
This project is under the [LPPL 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/) license.
