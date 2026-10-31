# Contributing

Thanks for helping improve LaTeX Resume Builder: build scripts that compile a LaTeX
CV locally with one command, plus a starter resume split into `src/` sections.

## Development setup

Install a TeX distribution (`brew install --cask mactex-no-gui` on macOS, TeX Live on
Linux, MiKTeX or TeX Live on Windows), then:

```bash
git clone https://github.com/bthanhtung/latex-resume-builder.git && cd latex-resume-builder
chmod +x scripts/build.sh
./scripts/build.sh "Test_CV"     # PDF lands in scripts/pdf/
```

On Windows run `scripts\build.bat "Test_CV"`.

## Before you open a pull request

```bash
shellcheck scripts/build.sh      # if you changed the shell script
./scripts/build.sh "Test_CV"     # must produce scripts/pdf/Test_CV.pdf and clean up aux files
```

If you change the build logic, change `build.sh` and `build.bat` together so macOS,
Linux, and Windows keep the same behavior, and say in the pull request which
platforms you tested on.

## Guidelines

- **Scripts** should run on the bash 3.2 that ships with macOS as well as on bash 5.
  Quote every variable and avoid GNU-only flags.
- **No personal data.** Keep the placeholders (`First Last`, `XXX-XXX-XXXX`) in
  `src/*.tex`; never commit a real CV.
- **Templates.** `resume.tex` is based on a third-party MIT template; keep its header.
  New templates must come with a compatible license and credit to their author.
- **Troubleshooting.** If you hit and fix a LaTeX error, add it to the
  Troubleshooting section of the README.

## Reporting bugs and requesting features

Open an issue with the command you ran, the error output, your OS, and your TeX
distribution and version (`pdflatex --version`).
