(if (string= (getenv "computername") "Sibintek")
    (setq url-proxy-services '(("http" . "10.46.51.100:3128"))))

(require 'package)
(setq package-enable-at-startup nil)

;; Fix elpa (gnu) repo on Mac OS X.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)


;; Load extra files, such as downloaded manually from http://emacswiki.org
(setq extras (concat user-emacs-directory "extras"))
(add-to-list 'load-path extras)
(dolist (f (directory-files extras))
  (when (string-match "\.el$" f)
    (require (intern
              (replace-regexp-in-string "\.el$" "" f)))))

(setq secretvalley (concat user-emacs-directory "secretvalley"))
(add-to-list 'load-path secretvalley)

;; Load defuns first.
(dolist (f (directory-files secretvalley))
  (when (string-match "-defuns\.el$" f)
    (require (intern
              (replace-regexp-in-string "\.el$" "" f)))))

;; Now load setup files.
(dolist (f (directory-files secretvalley))
  (when (string-match "-setup\.el$" f)
    (require (intern
              (replace-regexp-in-string "\.el$" "" f)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red" "#b3e29c" "yellow" "PaleBlue" "magenta" "cyan" "white"])
 '(package-selected-packages
   '(json-mode osx-trash magit smex ebib auctex org-pdfview gnuplot pandoc-mode sass-mode ocp-indent markdown-mode org-ref org-plus-contrib yasnippet company-quickhelp helm-bibtex helm-descbinds helm-flx smartparens rainbow-mode expand-region diminish edit-server counsel ivy-hydra discover helm-wordnet gap-mode ob-sagemath auto-complete-sage sage-shell-mode google-translate helm-dictionary langtool find-file-in-project use-package ido-vertical-mode hydra helm-rtags flx-ido emmet-mode company-rtags)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
