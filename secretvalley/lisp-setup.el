(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(add-hook-to-modes '(scheme emacs-lisp lisp clojure clojurescript)
                   'paredit-mode)

(add-hook-to-modes '(scheme emacs-lisp lisp)
                   'pretty-lambda)

(add-hook-to-modes '(clojure clojurescript)
                   'pretty-fn)

(provide 'lisp-setup)
