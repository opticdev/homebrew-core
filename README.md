# Homebrew-Optic

This repository contains the Formulae for Optic software.

## Software taps

- **Api** - The Optic Local CLI

## Use

We use [task](https://taskfile.dev) to manage our Formula update process. `task` will run the default task, which 
lists the tasks available (it runs `task --list`). Any tasks that start with a bracketed indicator of some kind (such as [DIAG] or [SRV]) are generally not expected to be run by individuals, but could be useful for troubleshooting.

Primarily, the key task is `task build` which removes the previous formula, generates a new formula based on the current NPM stable package of the Optic Local CLI, audits the package, then commits it to the local repository and tests the package. This is intended to be used as a GitHub action, triggered on deployment of a new NPM package. The GitHub Action handles committing the changeset if it passes testing, or disposes of the faulty deploy and logs the results for review.

## References

- [Optic's Home](https://www.useoptic.com)
- [Optic on GitHub](https://www.github.com/opticdev/optic)
