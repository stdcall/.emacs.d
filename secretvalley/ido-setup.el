(ido-mode t)

(use-package smex
  :ensure t
  :pin melpa
  :bind (("M-X" . smex-major-mode-commands)))

(use-package flx
  :ensure t
  :defer t
  :pin melpa)

(use-package flx-ido
  :ensure t
  :pin melpa
  :config
  (flx-ido-mode t))

(use-package ido-vertical-mode
  :ensure t
  :pin melpa
  :config
  (ido-vertical-mode t))

(setq
 ido-use-virtual-buffers t
 ido-enable-prefix nil
 ido-enable-flex-matching t
 ido-case-fold nil
 ido-auto-merge-work-directories-length -1
 ido-create-new-buffer 'always
 ido-use-filename-at-point nil
 ido-max-prospects 10
 ido-file-extensions-order '(".el" ".hs" ".c" ".cxx" ".org" ".txt" ".py" t ".pyc"))

(add-to-list 'ido-ignore-directories "node_modules")
(add-to-list 'ido-ignore-directories "target")
(add-to-list 'ido-ignore-directories "bower_components")

(provide 'ido-setup)
