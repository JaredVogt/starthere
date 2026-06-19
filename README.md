# starthere

Stage-0 bootstrap for a fresh Mac. Run this one command on a bare machine and it
takes you from nothing to a cloned, ready-to-run dotfiles repo.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JaredVogt/starthere/HEAD/install.sh)"
```

## What `install.sh` does

1. **Xcode Command Line Tools** — installs them if missing (provides `git` and the
   toolchain Homebrew needs). The installer is a GUI prompt, so if it has to run
   you'll be asked to accept it and re-run this command once it finishes.
2. **Homebrew** — pauses and prints the exact install command, then asks you to
   confirm it still matches the official command at <https://brew.sh> before
   running it. Installs non-interactively once you approve (may still prompt for
   your macOS password via `sudo`).
3. **GitHub CLI + auth** — installs `gh` and runs `gh auth login` so the private
   dotfiles repo can be cloned.
4. **Clone dotfiles** — clones `JaredVogt/dotfiles.v2` into `~/projects/dotfiles.v2`
   (or pulls latest if already present). Override the destination with
   `DOTFILES_DIR=/path`.
5. **Hand off to `go.sh`** — runs the dotfiles repo's own `go.sh` (stage 1) to
   finish the setup.

---

# Historical (pre-`install.sh`)

_Kept for reference; to be pruned later._

# starthere ([install.coffee](http://install.coffee)).
### [inkdrop instructions](https://community.inkdrop.app/note/dbdc214e35dba79a8472540ffc93db5b/note:rvdxD5bdH)

#### clone and follow instructions
1. `git clone https://github.com/JaredVogt/utilities ~/projects/utilities` ([utilities](https://github.com/JaredVogt/utilities))
