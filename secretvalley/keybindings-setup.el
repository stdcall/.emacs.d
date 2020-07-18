(dolist (key '("<left>"
               "<right>"
               "<up>"
               "<down>"
               "C-<left>"
               "C-<right>"
               "C-<up>"
               "C-<down>"
               "M-<left>"
               "M-<right>"
               "M-<up>"
               "M-<down>"))
  (global-unset-key (kbd key)))

(global-unset-key (kbd "C-z"))

(load "comment-sexp")
(global-set-key (kbd "C-M-;") #'comment-or-uncomment-sexp)


;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)
(global-set-key (kbd "<f8>") 'compile)

(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Switch fast between last two buffers
(global-set-key (kbd "C-`") 'mode-line-other-buffer)
(define-prefix-command 'ataraxia-map)
(global-set-key (kbd "C-c n") 'ataraxia-map)
(with-eval-after-load 'hydra
  (defhydra hydra-ataraxia (:hint nil)
"
^Miscellaneous^                   ^Org^
^^^^^^^^-----------------------------------------
_C-s_: New scratch                _l_: link
_C-r_: Align                      _a_: agenda
_C-c_: Clean up                   _c_: capture
_C-w_: Whitespace                 _b_: iswitchb
_C-b_: Browse at point            ^ ^
"
  ("C-\\" toggle-input-method "toogle input" :color blue)
  ("C-r" align-regexp)
  ("C-s"  create-scratch-buffer)
  ("C-c" cleanup-buffer)
  ("C-e" eval-buffer)
  ("C-w" whitespace-mode)
  ("C-b" browse-url-at-point)

  ("l" org-store-link)
  ("a" org-agenda)
  ("c" org-capture)
  ("b" org-iswitchb)))
(bind-key "C-b" 'hydra-ataraxia/body ataraxia-map)

(windmove-default-keybindings)

(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region-or-line)

(provide 'keybindings-setup)
