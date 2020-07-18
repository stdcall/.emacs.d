(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(add-hook-to-modes '(emacs-lisp lisp)
                   'eldoc-mode)

(add-hook-to-modes '(emacs-lisp lisp)
                   'pretty-lambda)

(provide 'lisp-setup)
