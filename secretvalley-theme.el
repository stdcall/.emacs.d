;; Created by Nikolay Khodyunya, May 2013
;;

(deftheme secretvalley
  "secretvalley theme")
(let* ((class '((class color) (min-colors 89)))
      (light-color1 (hsl 200 7 80))
      (dark-color1 (hsl 200 7 10))
      (dark-color2 (hsl 200 30 15))
      (color-palette2 (hsl 180 50 75))
      (color-palette3 (hsl 100 50 75))
      (color-palette4 (hsl 30  55 80))
      (color-palette5 (hsl 0   55 75))
      (color-palette6 (hsl 314 55 85))
      (color-palette7 (hsl 40 53 80))

      (main-bg  dark-color2)
      (main-fg light-color1)
      (low-hl-bg (lighten main-bg 10))
      (low-hl-fg (darken main-fg 10))
      (high-hl-bg color-palette3)
      (high-hl-fg main-bg)
      )

  (custom-theme-set-faces
   'secretvalley
   `(default
      ((,class (:background ,main-bg :foreground ,main-fg))))

   `(highlight
     ((,class (:background ,low-hl-bg))))

   `(hl-line
     ((,class (:background ,low-hl-bg))))

   `(cursor
     ((,class (:background ,(hsl 322 43 43)))))

   `(vertical-border
     ((,class (:foreground ,(lighten main-bg 8)))))

   `(fringe
     ((,class (:background ,(darken main-bg 1.5)))))

   `(show-paren-match
     ((,class (:foreground ,color-palette3))))

   `(sp-show-pair-match-face
     ((,class (:foreground ,dark-color1 :background ,high-hl-bg, :weight extra-bold))))

   `(show-paren-mismatch
     ((,class (:background ,color-palette5 :foreground ,dark-color1))))

   `(sp-show-pair-mismatch-face
     ((,class (:foreground ,color-palette5))))

   `(region
     ((,class (:background ,color-palette2 :foreground ,(lighten dark-color1 20)))))

   `(hi-yellow
     ((,class (:background ,color-palette7 :foreground ,dark-color1))))

   `(isearch
     ((,class (:background ,high-hl-bg :foreground ,high-hl-fg))))

   `(match
     ((,class (:background ,low-hl-bg :foreground ,low-hl-fg))))

   `(error
     ((,class (:foreground ,(darken color-palette5 10) :weight bold))))
   `(success
     ((,class (:foreground ,(darken color-palette3 10) :weight bold))))
   `(mode-line
     ((,class (:background ,(lighten light-color1 2) :foreground ,(darken dark-color1 2) :box nil))))
   `(mode-line-inactive
     ((,class (:background ,(darken dark-color1 2) :foreground ,(lighten light-color1 2) :box nil))))
   `(minibuffer-prompt
     ((,class (:foreground ,(darken color-palette3 15)))))

   `(font-lock-keyword-face
     ((,class (:foreground ,(hsl 100 50 70)))))

   `(font-lock-comment-face
     ((,class (:foreground ,(darken light-color1 35) :slant normal))))

   `(font-lock-constant-face
     ((,class (:foreground ,(hsl 100 50 70)))))

   `(font-lock-doc-face
     ((,class (:foreground ,(lighten color-palette2 5)))))

   `(font-lock-builtin-face
     ((,class (:foreground ,(darken color-palette2 10)))))

   `(font-lock-string-face
     ((,class (:foreground  ,color-palette2))))

   `(font-lock-type-face
     ((,class (:foreground ,color-palette6))))

   `(font-lock-function-name-face
     ((,class (:foreground ,(darken color-palette6 25)))))

   `(font-lock-variable-name-face
     ((,class (:foreground ,color-palette3))))

   `(font-lock-preprocessor-face
     ((,class (:foreground ,(darken color-palette3 10)))))

   `(c-annotation-face
     ((,class (:foreground ,color-palette3))))

   `(js2-function-param
     ((,class (:foreground ,(lighten color-palette3 10)))))
   `(js2-external-variable
     ((,class (:foreground ,(darken color-palette5 12)))))

   `(link
     ((,class (:foreground ,(darken color-palette3 0) :underline t))))
   `(link-visited
     ((,class (:foreground ,(hsl 30 10 80)))))
   `(info-header-xref
     ((,class (:foreground ,color-palette4 :underline t))))
   `(zencoding-preview-input
     ((,class (:box nil :background ,color-palette2 :foreground ,dark-color1))))

   `(ido-first-match
     ((,class (:foreground ,color-palette3))))
   `(ido-subdir
     ((,class (:foreground ,color-palette4))))
   `(ido-only-match
     ((,class (:foreground ,(darken color-palette3 20)))))

   `(flx-highlight-face
     ((,class (:foreground ,color-palette3 :underline t))))

   `(helm-selection
     ((,class (:foreground ,low-hl-fg :background ,low-hl-bg))))
   `(helm-match
     ((,class (:foreground ,color-palette3))))
   `(helm-source-header
     ((,class (:foreground ,main-bg :background ,main-fg))))

   `(erc-timestamp-face
     ((,class (:foreground ,(darken color-palette3 10)))))
   `(erc-prompt-face
     ((,class (:background ,color-palette3 :foreground ,dark-color1))))
   `(erc-notice-face
     ((,class (:foreground ,(darken light-color1 35)))))
   `(erc-nick-default-face
     ((,class (:foreground ,(lighten light-color1 12) :weight bold))))
   `(erc-current-nick-face
     ((,class (:foreground ,(darken color-palette6 25) :weight bold))))
   `(erc-my-nick-face
     ((,class (:foreground ,(darken color-palette6 25) :weight bold))))
   `(erc-input-face
     ((,class (:foreground ,(darken color-palette6 25)))))

   `(gnus-server-opened
     ((,class (:foreground ,(darken color-palette3 15)))))
   `(gnus-summary-selected
     ((,class (:foreground ,dark-color1 :background ,color-palette3))))
   `(gnus-summary-normal-unread
     ((,class (:foreground ,color-palette3))))
   `(gnus-summary-normal-read
     ((,class (:foreground ,(lighten color-palette3 17)))))
   `(gnus-button
     ((,class (:underline t :weight normal))))
   `(gnus-header-name
     ((,class (:foreground ,(lighten light-color1 12) :weight bold))))
   `(gnus-header-from
     ((,class (:foreground ,(lighten color-palette3 5)))))
   `(gnus-header-subject
     ((,class (:foreground ,(lighten color-palette3 5)))))
   `(gnus-header-content
     ((,class (:foreground ,(lighten color-palette3 15) :slant normal))))

   `(message-header-name
     ((,class (:foreground ,(lighten light-color1 12) :weight bold))))
   `(message-header-other
     ((,class (:foreground ,(lighten light-color1 12) :weight normal))))
   `(message-header-cc
     ((,class (:foreground ,(lighten light-color1 12) :weight normal))))

   `(eshell-ls-executable
     ((,class (:foreground ,(darken color-palette3 15)))))
   `(eshell-ls-directory
     ((,class (:foreground ,color-palette4 :weight bold))))
   `(eshell-ls-symlink
     ((,class (:foreground ,color-palette6))))
   `(eshell-ls-product
     ((,class (:foreground ,color-palette5))))

   `(org-level-1
     ((,class (:foreground ,(lighten light-color1 12) :weight bold))))
   `(org-level-2
     ((,class (:foreground ,color-palette3))))
   `(org-level-3
     ((,class (:foreground ,color-palette6))))
   `(org-level-4
     ((,class (:foreground ,color-palette4))))

   `(markdown-math-face
     ((,class (:foreground ,color-palette6 :weight bold))))
   `(haskell-interactive-face-prompt
     ((,class (:foreground ,color-palette3))))

   `(coq-solve-tactics-face
     ((,class (:foreground ,(darken color-palette3 15)))))

   `(font-latex-sectioning-5-face
     ((,class (:foreground ,(darken color-palette5 15)))))
   `(font-latex-math-face
     ((,class (:foreground ,(darken color-palette4 10)))))

   ))

(provide-theme 'secretvalley)
;; Local Variables:
;; eval: (rainbow-mode)
;; eval: (local-set-key (kbd "C-c e") (lambda () (interactive) (load-theme 'secretvalley t)))
;; End:
