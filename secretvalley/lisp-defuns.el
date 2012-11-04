(defun add-hook-to-modes (modes function)
  (dolist (mode modes)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
              function)))

(defun pretty-lambda ()
  (font-lock-add-keywords nil `(("(?\\(lambda\\>\\)"
                                 (0 (progn (compose-region (match-beginning 1)
                                                           (match-end 1)
                                                           "\u0192"
                                                           'decompose-region)))))))

(defun pretty-fn ()
  (font-lock-add-keywords nil `(("(\\(\\<fn\\>\\)"
                                 (0 (progn (compose-region (match-beginning 1)
                                                           (match-end 1)
                                                           "\u0192"
                                                           'decompose-region)))))))

(provide 'lisp-defuns)
