(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; Include snippets for Buster.js
(require 'buster-snippets)

;; No dropdowns please, yas
(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))

;; Wrap around region
(setq yas-wrap-around-region t)

(provide 'yasnippet-setup)
