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

(global-hl-line-mode 1)
(show-paren-mode 1)
(set-default 'indicate-empty-lines nil)
(set-face-attribute 'default nil
                    :family "Consolas"
                    :weight 'normal
                    :height 120)

(load-theme 'secretvalley-dark t)

(provide 'appearance-setup)
