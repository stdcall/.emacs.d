(use-package pdf-tools
  :ensure t
  :pin melpa
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :init
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-view-continuous t)
  (bind-keys :map pdf-view-mode-map
        ("\\" . hydra-pdftools/body)
        ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
        ("g"  . pdf-view-first-page)
        ("G"  . pdf-view-last-page)
        ("l"  . image-forward-hscroll)
        ("h"  . image-backward-hscroll)
        ("j"  . pdf-view-next-page)
        ("k"  . pdf-view-previous-page)
        ("e"  . pdf-view-goto-page)
        ("u"  . pdf-view-revert-buffer)
        ("al" . pdf-annot-list-annotations)
        ("ad" . pdf-annot-delete)
        ("aa" . pdf-annot-attachment-dired)
        ("am" . pdf-annot-add-markup-annotation)
        ("at" . pdf-annot-add-text-annotation)
        ("y"  . pdf-view-kill-ring-save)
        ("i"  . pdf-misc-display-metadata)
        ("s"  . pdf-occur)
        ("b"  . pdf-view-set-slice-from-bounding-box)
        ("r"  . pdf-view-reset-slice))
  (add-hook 'pdf-tools-enabled-hook 'auto-revert-mode)
  (setq revert-without-query '(".*pdf$"))
  (require 'scroll-other-window)
  (sow-mode)

  (defhydra hydra-pdftools (:color blue :hint nil)
        "
                                                                      ╭───────────┐
       Move  History   Scale/Fit     Annotations  Search/Link    Do   │ PDF Tools │
   ╭──────────────────────────────────────────────────────────────────┴───────────╯
         ^^_g_^^      _B_    ^↧^    _+_    ^ ^     [_al_] list    [_s_] search    [_u_] revert buffer
         ^^^↑^^^      ^↑^    _H_    ^↑^  ↦ _W_ ↤   [_am_] markup  [_o_] outline   [_i_] info
         ^^_p_^^      ^ ^    ^↥^    _0_    ^ ^     [_at_] text    [_F_] link      [_d_] dark mode
         ^^^↑^^^      ^↓^  ╭─^─^─┐  ^↓^  ╭─^ ^─┐   [_ad_] delete  [_f_] search link
    _h_ ←pag_e_→ _l_  _N_  │ _P_ │  _-_    _b_     [_aa_] dired
         ^^^↓^^^      ^ ^  ╰─^─^─╯  ^ ^  ╰─^ ^─╯   [_y_]  yank
         ^^_n_^^      ^ ^  _r_eset slice box
         ^^^↓^^^
         ^^_G_^^
   --------------------------------------------------------------------------------
        "
        ("\\" hydra-master/body "back")
        ("<ESC>" nil "quit")
        ("al" pdf-annot-list-annotations)
        ("ad" pdf-annot-delete)
        ("aa" pdf-annot-attachment-dired)
        ("am" pdf-annot-add-markup-annotation)
        ("at" pdf-annot-add-text-annotation)
        ("y"  pdf-view-kill-ring-save)
        ("+" pdf-view-enlarge :color red)
        ("-" pdf-view-shrink :color red)
        ("0" pdf-view-scale-reset)
        ("H" pdf-view-fit-height-to-window)
        ("W" pdf-view-fit-width-to-window)
        ("P" pdf-view-fit-page-to-window)
        ("n" pdf-view-next-page-command :color red)
        ("p" pdf-view-previous-page-command :color red)
        ("d" pdf-view-dark-minor-mode)
        ("b" pdf-view-set-slice-from-bounding-box)
        ("r" pdf-view-reset-slice)
        ("g" pdf-view-first-page)
        ("G" pdf-view-last-page)
        ("e" pdf-view-goto-page)
        ("o" pdf-outline)
        ("s" pdf-occur)
        ("i" pdf-misc-display-metadata)
        ("u" pdf-view-revert-buffer)
        ("F" pdf-links-action-perfom)
        ("f" pdf-links-isearch-link)
        ("B" pdf-history-backward :color red)
        ("N" pdf-history-forward :color red)
        ("l" image-forward-hscroll :color red)
        ("h" image-backward-hscroll :color red)))

(use-package auctex
  :ensure t
  :pin gnu
  :mode ("\\.tex\\'" . LaTeX-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode plain-TeX-mode)
  :init
  (setq
   TeX-auto-save t
   TeX-parse-self t
   TeX-PDF-mode t
   LaTeX-indent-level 0)
  (setq-default TeX-master t
                TeX-command-BibTeX "BibTeX8")
  (setq preview-image-type 'dvipng)
  (setq LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))
  (setq TeX-view-program-list
        '(("PDF Tools" TeX-pdf-tools-sync-view)))
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
    ;; Setup synctex
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

  (setq TeX-source-correlate-method 'synctex)

  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

  (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'TeX-fold-mode)
  (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
  (add-hook 'LaTeX-mode-hook
            (lambda nil (local-set-key "\M-0" cm-map)))


  (eval-after-load 'tex
    '(progn
       (add-to-list
        'TeX-command-list
        '("BibTeX8" "bibtex8 -B -c utf8cyrillic.csf %s"
          TeX-run-BibTeX nil t :help "Run BibTeX8"))
       (add-to-list
        'TeX-command-list
        '("Glossary" "makeglossaries %s" TeX-run-command nil
          (latex-mode) :help "Create glossaries")))))


(use-package reftex
  :ensure auctex
  :commands turn-on-reftex
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t)))

(use-package bibtex
  :ensure auctex
  :mode ("\\.bib" . bibtex-mode)
  :init
  (add-hook 'bibtex-mode-hook 'turn-on-auto-revert-mode)
  (progn
    (setq bibtex-align-at-equal-sign t)
    (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))))

(define-prefix-command 'cm-map nil "Outline-")
(bind-keys
 :map cm-map
 ;; HIDE
 ("q" . hide-sublevels)    ; Hide everything but the top-level headings
 ("t" . hide-body)         ; Hide everything but headings (all body lines)
 ("o" . hide-other)        ; Hide other branches
 ("c" . hide-entry)        ; Hide this entry's body
 ("l" . hide-leaves)       ; Hide body lines in this entry and sub-entries
 ("d" . hide-subtree)      ; Hide everything in this entry and sub-entries
 ;; SHOW
 ("a" . show-all)          ; Show (expand) everything
 ("e" . show-entry)        ; Show this heading's body
 ("i" . show-children)     ; Show this heading's immediate child sub-headings
 ("k" . show-branches)     ; Show all sub-headings under this heading
 ("s" . show-subtree)      ; Show (expand) everything in this heading & below
 ;; MOVE
 ("u" . outline-up-heading)                ; Up
 ("n" . outline-next-visible-heading)      ; Next
 ("p" . outline-previous-visible-heading)  ; Previous
 ("f" . outline-forward-same-level)        ; Forward - same level
 ("b" . outline-backward-same-level)       ; Backward - same level
 )

(provide 'tex-setup)
