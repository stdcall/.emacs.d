(load-theme 'secretvalley t)
;; Do not create new frames when opening files
(setq ns-pop-up-frames nil)
;; Turn off mouse interface and some minor modes
(dolist (mode
         '(menu-bar-mode
           tool-bar-mode
           scroll-bar-mode
           tooltip-mode
           blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

(setq inhibit-startup-message t
      frame-title-format '(buffer-file-name "%f" ("%b"))
      show-paren-style 'parenthesis
      whitespace-style '(face tabs trailing empty space-mark space-after-tab::space))

;; (global-hl-line-mode)
(make-variable-buffer-local 'global-hl-line-mode)
(set-default 'indicate-empty-lines nil)
(set-face-attribute 'default nil
                    :family (cond ((eq system-type 'windows-nt) "Cascadia Code")
                                  ((eq system-type 'gnu/linux) "Inconsolata LGC") ;; Inconsolata LGC
                                  ((eq system-type 'darwin) "Menlo")
                                  (t "Mono"))
                    :weight 'normal
                    :height 140)

;; colorize (hsl h s l) expressions
;;(require 'rainbow-mode)
(defvar rainbow-lisp-hsl-colors-font-lock-keywords
  '(("(hsl\s*\\([0-9]\\{1,3\\}\\)\s*\\([0-9]\\{1,3\\}\\)\s*\\([0-9]\\{1,3\\}\\)\s*)"
     (0 (rainbow-colorize-hsl))))
  "Font-lock keywords to add for HSL colors.")
(defadvice rainbow-turn-on (after enable-hsl-colors activate)
  (when (memq major-mode
              '(emacs-lisp-mode clojure-mode))
    (font-lock-add-keywords
     nil
     rainbow-lisp-hsl-colors-font-lock-keywords)))
(defadvice rainbow-turn-off (after disable-hsl-colors activate)
  (font-lock-remove-keywords
   nil
   rainbow-lisp-hsl-colors-font-lock-keywords))


(provide 'appearance-setup)
