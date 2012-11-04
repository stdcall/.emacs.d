;; Never insert tabs
(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)

;; Do not trash my filesystem
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "autosaves/\\1") t))
      smex-save-file (concat user-emacs-directory ".smex-items"))

(add-hook 'before-save-hook 'cleanup-buffer-safe)

(defadvice kill-line (before check-position activate)
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1))))

;; Spell checking
(add-to-list 'exec-path "/opt/Aspell/bin")
(setq ispell-program-name "aspell")
(setq flyspell-default-dictionary "russian")
(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'text-mode-hook 'turn-on-flyspell)))

;; Miscellaneous
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(provide 'misc-setup)
