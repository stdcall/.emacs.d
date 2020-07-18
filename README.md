# Intro

This emacs configuration is modularized with the help of [use-package][1] macro,
so user can safely adjust or remove parts of it. Additional packages are
used to help me edit

* clojure by [clojure-mode][12], [cider][13]
* [haskell](https://github.com/haskell/haskell-mode)
* ocaml by [tuareg][9], [merlin][10], [utop][11].
  Configuration was grabbed from [Real World Ocaml][8].
  See [installation instructions][7].
* javascript, html, css by [js2-mode][5], [emmet][3], [rainbow-mode][4]
* [latex][6]

# Quickstart

Emacs configuration should be located at `$HOME/.emacs.d`. To bootstrap fresh
emacs installation on Unix-like OS, i usually do

```sh
git clone https://github.com/stdcall/.emacs.d $HOME/stdcall-emacs
ln -s $HOME/stdcall-emacs $HOME/.emacs.d
```

First of all, you need to know i have *disabled arrow keys* for good habits.
Check [wiki][2] for information on general movement commands and keys.
Just pull it somewhere and symlink to


# Directory structure

Start by navigating init.el -- the entry point of everything else.

# Documentation

Some notes are kept in [repos wiki][2].

[1]: https://github.com/jwiegley/use-package
[2]: https://github.com/stdcall/.emacs.d/wiki
[3]: https://github.com/smihica/emmet-mode
[4]: http://git.savannah.gnu.org/cgit/emacs/elpa.git/tree/packages/rainbow-mode
[5]: https://github.com/mooz/js2-mode
[6]: https://www.gnu.org/software/auctex/
[7]: https://github.com/realworldocaml/book/wiki/Installation-Instructions
[8]: https://realworldocaml.org/
[9]: https://github.com/ocaml/tuareg
[10]: https://github.com/the-lambda-church/merlin
[11]: https://github.com/diml/utop
[12]: https://github.com/clojure-emacs/clojure-mode
[13]: https://github.com/clojure-emacs/cider
