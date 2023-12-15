(setq initial-scratch-message "(setq debug-on-error t)")
(setq large-file-warning-threshold nil)

(setq vc-follow-symlinks t)

;; Smooth Scroll: one line at a time:
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
;; Remove alarm (bell) on scroll
(setq ring-bell-function 'ignore)

(set-default 'indent-tabs-mode nil)
(set-default 'tab-width 2)
(set-default 'fill-column 80)

(setq default-input-method "russian-computer")
(setq tramp-default-method "ssh")

(set-default 'imenu-auto-rescan t)

;; Sentences end with only one space
(setq sentence-end-double-space nil)

;; Set PATH
(when (equal system-type 'darwin)
  (let ((path-from-shell
         (replace-regexp-in-string "[[:space:]\n]*$" ""
                                   (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))
    ))

;; Set PKG_CONFIG_PATH
(when (equal system-type 'darwin)
  (let ((path-from-shell
         (replace-regexp-in-string "[[:space:]\n]*$" ""
                                   (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))
    ))

;; Do not trash my filesystem.
(let ((backup-dir (concat user-emacs-directory "backups"))
      (autosave-dir (concat user-emacs-directory "autosaves")))
  (unless (file-exists-p backup-dir)
    (make-directory backup-dir))
  (unless (file-exists-p autosave-dir)
    (make-directory autosave-dir))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,(concat autosave-dir "/\\1") t))))

(add-hook 'before-save-hook (lambda ()
                              (unless (derived-mode-p 'makefile-mode)
                                (cleanup-buffer-safe))))


(defadvice kill-line (before check-position activate)
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1))))

(defadvice split-window-right (after split-window-right-and-move-there-dammit activate)
  (windmove-right))

(defadvice newline-and-indent (before auto-pair-ret activate)
  (when (and (eq (char-after) ?}) (eq (char-before) ?{))
    (save-excursion
      (newline)
      (indent-according-to-mode))))


;; better find-file-in-repository
;; assumes you have magit and maybe other stuff
(defun choose/find-file-in-git-repo ()
  (interactive)
  (require 's)
  (let ((root-dir (magit-toplevel default-directory)))
    (if root-dir
        (let ((default-directory root-dir))
          (let ((f (s-trim
                    (shell-command-to-string
                     "git ls-files -co --exclude-standard | choose"))))
            (unless (string= "" f)
              (find-file f))))
      (call-interactively 'find-file))))
(global-set-key (kbd "C-x f") 'choose/find-file-in-git-repo)

(provide 'misc-setup)
