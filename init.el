(setq secretvalley (concat user-emacs-directory "secretvalley"))
(add-to-list 'load-path secretvalley)

;; load defuns first
(dolist (m (directory-files secretvalley))
  (when (string-match "-defuns\.el$" m)
    (require (intern
              (replace-regexp-in-string "\.el$" "" m)))))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;;
(dolist (m (directory-files secretvalley))
  (when (string-match "-setup\.el$" m)
    (require (intern
              (replace-regexp-in-string "\.el$" "" m)))))
