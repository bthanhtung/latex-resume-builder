# 🚀 LaTeX Resume Builder Script

A set of automation scripts to build your CV from LaTeX locally, freeing you from dependence on online editors like Overleaf.

## 💡 Why did I create this repo?

While **Overleaf** is very convenient, it has certain limitations:
- **Compile Limits**: Free accounts have restrictions on the number of PDF generations.
- **Internet Dependency**: You cannot work offline.
- **Speed**: Local compilation is often faster and offers more flexibility in file management.

This repo provides scripts that allow you to professionally compile LaTeX directly on your computer with a single command.

## 🛠️ Features
- **Fully Automated**: A single command builds the PDF and cleans up auxiliary files.
- **Smart Detection**: Automatically identifies the main file (`main.tex` or `resume.tex`).
- **Clean Workspace**: All output PDFs are gathered in the `scripts/pdf/` directory, keeping your root folder tidy.
- **Cross-Platform**: Supports both macOS/Linux (`.sh`) and Windows (`.bat`).

---

## 🚀 How to Use

### 1. Install LaTeX (If not already installed)
You need to install a LaTeX distribution on your machine:
- **macOS**: `brew install --cask mactex-no-gui`
- **Windows**: [MiKTeX](https://miktex.org/download) or [TeX Live](https://www.tug.org/texlive/).
- **Linux**: `sudo apt-get install texlive-full`

### 2. Download a CV Template
You can find and download beautiful templates from: [Overleaf LaTeX Templates](https://www.overleaf.com/latex/templates).

**Recommended Templates:**
- **The one I'm using**: [SWE Resume Template](https://www.overleaf.com/latex/templates/swe-resume-template/bznbzdprjfyy)
- **Data Science/Tech**: [Data Science Tech Resume](https://www.overleaf.com/latex/templates/data-science-tech-resume-template/zcdmpfxrzjhv)
- **Minimalist**: [Harshibar's Resume](https://www.overleaf.com/latex/templates/harshibars-resume/sbcyynmtpnyd)
- **Network Engineer**: [Personal Resume of Shriram Jadhav](https://www.overleaf.com/latex/templates/personal-resume-of-shriram-jadhav-network-engineer/zzcxzhmqyddy)

### 3. Integrate Script into Your Project
There are 2 ways to get started:

**Method A: Copy scripts to a template (Recommended)**
1. Download a template from Overleaf and extract it.
2. Clone this repo: `git clone https://github.com/bthanhtung/latex-resume-builder.git`
3. Copy the `scripts/` folder from this repo into your template's directory.

**Method B: Use this repo directly**
1. Clone this repo.
2. Edit the content in `resume.tex` or replace it with your own template content.

### 4. Build Your CV
Open your terminal at the root of the project and run:

**macOS / Linux:**
```bash
chmod +x scripts/build.sh
./scripts/build.sh "Your_CV_Filename"
```

**Windows:**
```batch
scripts\build.bat "Your_CV_Filename"
```

*By default, the script uses `pdfLaTeX`. If your template requires `XeLaTeX` (usually for templates with custom system fonts), add the `--xe` flag:*
```bash
./scripts/build.sh "Your_CV_Filename" --xe
```

---

## 🛠️ Troubleshooting

### 1. Error `Undefined control sequence \pdfglyphtounicode`
This error occurs when you use an old `pdfLaTeX` template but compile it with `XeLaTeX`.
- **Fix**: Run the script **without** the `--xe` flag. The script will default to `pdfLaTeX`, and this error will disappear.

### 2. Font Not Found Error
If you use the `--xe` flag and encounter a "font not found" error:
- Ensure you have installed that font on your system (Windows Fonts or Font Book on macOS).
- Check if the template includes font files (`.ttf`, `.otf`).

---

## 📝 Note on Input Files
The script is designed to automatically find `main.tex` or `resume.tex`. If your template uses a different filename, ensure there is only one `.tex` file in the root directory, or rename your main file to `main.tex` for the most accurate detection.

## 🤝 Contributing
Contributions are welcome: fixes for a platform, new troubleshooting entries, better templates, or ideas. Read
[CONTRIBUTING.md](CONTRIBUTING.md) for the setup and checks (keep `build.sh` and `build.bat` in step, no real
personal data in `src/`). Hit a LaTeX error that is not covered above?
[Open an issue](https://github.com/bthanhtung/latex-resume-builder/issues/new/choose) with the output.
Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## 📄 License
The build scripts are released under the [GNU General Public License v3.0](LICENSE). Contributions made before the
switch remain available under [MIT](LICENSES/MIT.txt). The resume template in `resume.tex` keeps its original MIT
license from its author, Audric Serador ([LICENSES/MIT-resume-template.txt](LICENSES/MIT-resume-template.txt)).
Your own CV content is yours.
