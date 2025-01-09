<p align="center">
    <img width="90%" src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/04_Logo.png" alt="Logo">
</p>

<p align="center">
    <a href="https://github.com/joseareia/ipleiria-thesis/issues/new?labels=bug" target="_blank">Report a Bug</a>
·
    <a href="https://github.com/joseareia/ipleiria-thesis/issues/new?labels=enhancement" target="_blank">Request a Feature</a>
·
    <a href="https://github.com/joseareia/ipleiria-thesis/issues/new?labels=question" target="_blank">Ask a Question</a>
</p>

<p align="center">
    <a href="https://www.latex-project.org"><img src="https://img.shields.io/badge/Made%20with-LaTeX-green.svg?style=flat-square"></a>
    <a href="https://www.latex-project.org/lppl/lppl-1-3c"><img src="https://img.shields.io/badge/License-LaTeX%20v1.3c-yellow.svg?style=flat-square"></a>
    <a href="https://github.com/joseareia/ipleiria-thesis/releases"><img src="https://img.shields.io/badge/Release-v2.2.0-8892BF.svg?style=flat-square"></a>
    <a href="https://github.com/joseareia/ipleiria-thesis/graphs/commit-activity"><img src="https://img.shields.io/badge/Maintained-Yes-brightgreen.svg?style=flat-square"></a>
    <a href=""><img src="https://img.shields.io/badge/Build-Passing-brightgreen.svg?style=flat-square"></a>
</p>
<br/>

<p float="left">
<a href="https://github.com/joseareia/ipleiria-thesis">IPLeiria Thesis</a> is an open-source LaTeX template <b>designed for creating professional theses, dissertations, and academic reports</b> specifically tailored for the <a href="https://www.ipleiria.pt/" target="_blank">Polytechnic University of Leiria</a> students. It was developed to ensure a <b>clean, aesthetically pleasing, and professional design</b> while remaining highly customizable to suit various needs. The template is also user-friendly, making it accessible even for newcomers.

Curious to see it in action? Check out the <a href="https://www.overleaf.com/latex/templates/unofficial-polytechnic-university-of-leiria-estg-thesis-slash-report-template/tqgbrncfhwgt.pdf" target="_blank">PDF</a> demo for a preview!
</p>

<p align="center">
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/01_B.png" width="273"/>
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/02_B.png" width="273"/>
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/03_B.png" width="273"/>
</p>

<p float="left">
This repository contains all the <b>source code for the template</b>, organised into a clear and well-structured file hierarchy. It also includes various tools and <b>configuration files necessary for compiling</b> the template across different workspaces.
</p>

<!-- ## About
**IPLeiria Thesis** is an open-source LaTeX template designed for creating professional theses, dissertations, and academic reports specifically tailored for the [Polytechnic University of Leiria](https://www.ipleiria.pt/). This template ensures your document is not only polished and timeless but also adheres to professional formatting standards. Featuring a clean, classic design, the template simplifies the process of structuring and styling your work, making it intuitive and efficient for users of all skill levels. Curious to see it in action? Check out the [demo](https://www.overleaf.com/latex/templates/unofficial-polytechnic-university-of-leiria-estg-thesis-slash-report-template/tqgbrncfhwgt.pdf) for a preview!

<p float="left">
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/01_B.png" width="400"/>
  <img src="https://github.com/joseareia/ipleiria-thesis/blob/master/Assets/02_B.png" width="400"/>
</p> -->

## Getting Started
To utilise this template, please follow the steps below.

1. Download LaTeX:
    - Linux: Install [TeX-Live](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org/).
    - Windows: Install [TeX-Live](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org/).
    - macOS: Install [MacTeX](https://www.tug.org/mactex/) (a macOS version of TeX-Live) or [MikTeX](https://miktex.org/).
2. Download `IPLeiria Thesis` by either:
    - Cloning this GitHub repository (<kbd>git clone https://github.com/joseareia/ipleiria-thesis.git</kbd>).
    - Download the latest version as [ZIP file](https://github.com/joseareia/ipleiria-thesis/archive/refs/heads/master.zip).
3. Compile the document with you favorite LaTeX processor (XeLaTeX or LuaLaTeX)!

> [!TIP]
> To make the most of this template and for real-time collaboration, I highly recommend using [Overleaf](https://www.overleaf.com/home-2). You can access the ready-to-use template by clicking [here](https://www.overleaf.com/latex/templates/unofficial-polytechnic-university-of-leiria-estg-thesis-slash-report-template/tqgbrncfhwgt).


## Getting Started: Using VSCode and DevContainer (Docker)

The simplest way to get started is to install LaTeX and all the necessary tools in a Docker container via the `devcontainer` feature of VSCode.

1. Install [Docker](https://docs.docker.com/engine/install/) and [VSCode](https://code.visualstudio.com/download).
2. Open this directory in VSCode.
3. Install the `Remote Development` extension pack in VSCode using the extensions panel.
4. Do `Ctrl+Shift+P` and run `Dev Container: open folder in container`. 
5. Open `IPleiriaMain.tex`, click the `TeX` icon the bar on the left, and click on `Build LaTeX project`.

If you have access to Gitub Codespaces you can also start a codespace on this repository in order to work on the LaTeX document directly on the web without installing anything on your computer. Just do `Code` > `Codespaces` > `'+'`.

> [!NOTE]
> It might take upwards of 30 minutes to install texlive in the container.


## Dependecies
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

## Compile

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

## Content Overview
This repository has the following structure.

- **Bibliography**: Contains the bibliography file used for references.
- **Chapters**: Includes individual chapters of the thesis.
- **Code**: Includes any code examples related to the thesis.
- **Figures**: Contains figures and images used in the thesis.
- **Matter**: Contains additional matter (e.g. acronyms, glossary, etc.) and front/back pages for the thesis.
- **Variables**: Includes the `Variables.tex` document, where you can change the all the document variables.
- **IPLeiriaMain.tex**: Main LaTeX file for compiling the thesis content.
- **IPLeiriaThesis.cls**: LaTeX class file containing the formatting and styling specifications.

## Multilanguage Support
This template offers multilanguage support in two languages: English and Portuguese. **If you wish to add support for more languages, please contact me**. To change the language, simply modify the first line (*document class definition*) of the `IPLeiriaThesis.tex` file to the desired language: `pt` for Portuguese and `en` for English. Here is an example: `\documentclass[en]{IPLeiriaThesis}`. Easy, right?

## Ease of Changing Style
Don't like the new modern cover? No problem, I’ve got you *covered*! This template now includes a new class option, `bwcover`, which allows you to switch the cover to a black-and-white mode. Simply add it like this: `\documentclass[en,bwcover]{IPLeiriaThesis}`, and the change will be applied automatically. If you have any other style suggestions, feel free to share them with me!

## Getting Help
If you have any questions regarding the template, its usage, or encounter any errors you're struggling with, please feel free to open an issue in this repository, or contact me via email at <a href="mailto:jose.apareia@gmail.com">jose.apareia@gmail.com</a>.

## Contributing
Contributions to this template are welcome! If you encounter any issues, have suggestions for improvements, or would like to add new features, please submit a pull request. We appreciate your feedback and contributions to make this template even better.

## License
This project is under the [LPPL 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/) license.
