(auto-fill-mode 1)

(use-package osx-trash
  :ensure t
  :pin melpa
  :init
  (when (eq system-type 'darwin)
    (osx-trash-setup)))

(setq delete-by-moving-to-trash t)


(setq save-place-file "~/.emacs.d/saved-places")
(save-place-mode 1)
(setq save-abbrevs 'silently)

(semantic-mode 1)

(setq dired-guess-shell-alist-user '(("\\.pdf\\'" "evince")
                                     ("\\.djvu\\'" "evince")
                                     ("\\.docx?\\'" "libreoffice")))

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(defun dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (cond
     ((eq system-type 'windows-nt) (w32-shell-execute nil file))
     ((eq system-type 'darwin) (call-process "open" nil 0 nil file))
     (t (call-process "xdg-open" nil 0 nil file)))))

(eval-after-load "dired" '(progn
   (define-key dired-mode-map (kbd "M-RET") 'dired-open-file)))



(require 'dired-x)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-x4\C-j" 'dired-jump-other-window)
(setq dired-dwim-target t)

(if (eq system-type 'windows-nt)
    (progn
      (setq ls-lisp-use-insert-directory-program t)
      (setq insert-directory-program "C:/msys64/usr/bin/ls.exe")
      (setq default-file-name-coding-system 'utf-8)
      ))

(if (eq system-type 'darwin)
    (setq insert-directory-program "gls"))

(setq dired-listing-switches "-lAGh --group-directories-first")
(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'ibuffer-mode-hook 'hl-line-mode)
(add-hook 'bookmark-bmenu-mode-hook 'hl-line-mode)

(add-hook 'makefile-mode-hook (lambda ()
                                (setq indent-tabs-mode t
                                      tab-width 8)))

(unless (cl-member 'cp65001 coding-system-list)
  (define-coding-system-alias 'cp65001 'utf-8))

(use-package find-file-in-project
  :ensure t
  :pin melpa
  :bind ("C-x C-o" . find-file-in-project))

(use-package magit
  :ensure t
  :pin melpa)

(use-package emmet-mode
  :ensure t
  :pin melpa
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))

(use-package langtool
  :pin melpa
  :ensure t
  :commands (langtool-check
             langtool-check-done
             langtool-switch-default-language
             langtool-show-message-at-point
             langtool-correct-buffer)
  :init
  (setq
   langtool-language-tool-jar "/opt/langtool/languagetool-commandline.jar"
   langtool-default-language "ru-RU"
   langtool-mother-tongue "ru-RU"))

(use-package hydra
  :ensure t
  :pin melpa)


(use-package discover
  :ensure t
  :pin melpa
  :init
  (global-discover-mode 1))


(use-package edit-server
  :ensure t
  :if window-system
  :init
  (add-hook 'after-init-hook 'server-start t)
  (add-hook 'after-init-hook 'edit-server-start t))

(use-package hippie-exp
  :ensure t
  :pin melpa
  :bind ([remap dabbrev-expand] . hippie-expand))

(use-package diminish
  :ensure t
  :pin melpa)

(use-package expand-region
  :ensure t
  :pin melpa
  :bind ("C-=" . er/expand-region))

(use-package gap-mode
  :ensure t
  :pin melpa
  :mode (("\\.g\\'" . gap-mode) ("\\.gap\\'" . gap-mode))
  :init
  (setq
   gap-executable "~/opt/gap/bin/x86_64-pc-linux-gnu-default64/gap"
   gap-start-options '("-E"))
  )

(use-package smartparens
  :ensure t
  :pin melpa
  :init
  (dolist (hook '(emacs-lisp-mode-hook
                  lisp-mode-hook
                  racket-mode-hook))
    (add-hook hook 'smartparens-strict-mode))
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)
  (bind-key ";" 'sp-comment emacs-lisp-mode-map)
  (bind-key "C-x C-t" 'sp-transpose-hybrid-sexp smartparens-mode-map)
  (with-eval-after-load 'hydra
    (bind-key "C-M-s"
          (defhydra smartparens-hydra ()
            "Smartparens"
            ("d" sp-down-sexp "Down")
            ("e" sp-up-sexp "Up")
            ("u" sp-backward-up-sexp "Up")
            ("a" sp-backward-down-sexp "Down")
            ("f" sp-forward-sexp "Forward")
            ("b" sp-backward-sexp "Backward")
            ("k" sp-kill-sexp "Kill" :color blue)
            ("q" nil "Quit" :color blue))
          smartparens-mode-map))
  (smartparens-global-mode t)
  (show-smartparens-global-mode t))


(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  )

(use-package ivy-hydra
  :ensure t
  :pin melpa)

(use-package swiper
  :ensure t
  :pin melpa
  :bind (([remap isearch-forward] . swiper)))

(use-package helm
  :ensure t
  :pin melpa
  :bind (([remap execute-extended-command] . helm-M-x)
         ([remap yank-pop] . helm-show-kill-ring)
         ("M-i" . helm-semantic-or-imenu)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-c <SPC>" . helm-all-mark-rings)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :init
  (helm-mode 1)

  (setq
   helm-M-x-fuzzy-match        t
   helm-buffers-fuzzy-matching t
   helm-recentf-fuzzy-match    t
   helm-semantic-fuzzy-match   t
   helm-imenu-fuzzy-match      t
   helm-always-two-windows t
   helm-net-prefer-curl t
   helm-ff-file-name-history-use-recentf t
   helm-echo-input-in-header-line t
   helm-autoresize-max-height 0
   helm-autoresize-min-height 40
   )
  (helm-autoresize-mode 1)
  (defun spacemacs//helm-hide-minibuffer-maybe ()
    "Hide minibuffer in Helm session if we use the header line as input field."
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face
                     (let ((bg-color (face-background 'default nil)))
                       `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))


  (add-hook 'helm-minibuffer-set-up-hook
            'spacemacs//helm-hide-minibuffer-maybe)
  (use-package helm-flx
    :ensure t
    :init
    (helm-flx-mode +1))
  (use-package helm-descbinds
    :ensure t
    :init
    (helm-descbinds-mode)))

(use-package company
  :ensure t
  :pin melpa
  :commands (global-company-mode company-mode)
  :init
  )

(use-package company-quickhelp
  :ensure t
  :after company
  :pin melpa
  :commands company-quickhelp-mode
  :init
  (add-hook 'company-mode-hook 'company-quickhelp-mode))

(use-package yasnippet
  :ensure t
  :pin melpa
  :diminish yas-minor-mode
  :init
  ;; (require 'buster-snippets)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))
  (setq yas-wrap-around-region t)
  :config
  (yas-global-mode 1))

(use-package org
  :ensure org-plus-contrib
  :pin org
  :mode ("\\.org\\'". org-mode)
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb)
         :map org-mode-map
         ("S-<right>" . nil)
         ("S-<left>"  . nil)
         ("S-<up>"    . nil)
         ("S-<down>"  . nil))
  :init
  (setq org-file-apps
        '((auto-mode . emacs)
          ("\\.djvu\\'" . "evince \"%s\"")
          ("\\.djvu::\\([0-9]+\\)\\'" . "evince \"%s\" -p %1")))

  (org-babel-do-load-languages 'org-babel-load-languages
                               '((python . t)
                                 (emacs-lisp . t)))
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))

  ;;(require 'org-glossary nil t)

  (setq org-latex-listings 'minted)
  (setq org-latex-minted-options
        '(("bgcolor" "minted-bg") ("frame" "single") ("framesep" "6pt")
          ("mathescape" "true") ("fontsize" "\\footnotesize")))
  (setq org-latex-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "biber %b"
          "makeglossaries %b"
          "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
  (add-to-list 'org-latex-classes
               `("org-koma"
                 ,(concat  (with-temp-buffer
                            (insert-file-contents
                             (concat user-emacs-directory "org-koma.tex"))
                            (buffer-string))
                          "[NO-DEFAULT-PACKAGES] [NO-PACKAGES]")

     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  :config
  (add-to-list 'org-latex-packages-alist
  '("english,main=russian" "babel"))
  (setq org-agenda-files '("~/Dropbox/notes")
        org-confirm-babel-evaluate nil
        org-format-latex-options (plist-put
        org-format-latex-options :scale 1.5) ) )

(use-package org-ref
    :pin melpa
    :ensure t)

(use-package markdown-mode
  :ensure t
  :pin melpa
  :mode ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  :init
  (setq markdown-enable-math t)
  :config
  )

(use-package pandoc-mode
  :ensure t
  :after markdown-mode
  :pin melpa
  :diminish pandoc-mode
  :commands pandoc-mode
  :init
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (add-hook 'pandoc-mode-hook 'pandoc-load-default-settings))

(use-package haskell-mode
  :ensure t
  :pin melpa
  :mode "\\.hs\\'"
  :init
  (dolist (hook '(haskell-indentation-mode
                  interactive-haskell-mode
                  haskell-doc-mode
                  haskell-decl-scan-mode
                  flycheck-mode))
    (add-hook 'haskell-mode-hook hook))

  :config
  (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
  (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right))

(use-package intero
  :ensure t
  :pin melpa
  :after haskell-mode
  :commands 'intero-mode
  :init
  (add-hook 'haskell-mode-hook 'intero-mode)
  (add-hook 'intero-mode-hook
   '(lambda () (flycheck-add-next-checker 'intero
                '(warning . haskell-hlint)))))


(use-package sass-mode
  :ensure t
  :pin melpa
  :mode "\\.sass\\'")

;; Coq
(when (file-exists-p "/usr/local/opt/coq/lib/emacs/site-lisp")
      (add-to-list 'load-path "/usr/local/opt/coq/lib/emacs/site-lisp"))
(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)
(autoload 'run-coq "coq-inferior" "Run an inferior Coq process." t)
(autoload 'run-coq-other-window "coq-inferior"
  "Run an inferior Coq process in a new window." t)
(autoload 'run-coq-other-frame "coq-inferior"
  "Run an inferior Coq process in a new frame." t)

(provide 'modes-setup)
