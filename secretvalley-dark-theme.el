(deftheme secretvalley-dark
  "secretvalley dark theme")

(let ((class '((class color) (min-colors 89)))
      (white1 "#DBD0DF") (white2 "#B9AEBD")
      (black1 "#000000") (black2 "#222222") (black3 "#5e5e5e") (black4 "#8e8e8e")
      (red1 "#B63E29") (red2 "#D14A33") (red3 "#DD8372")
      (blue1 "#1A3C6E") (blue2 "#25559C") (blue3 "#3070CE") (blue4 "#558AD7")
      (green3 "#67E357"))
  (custom-theme-set-faces
   'secretvalley-dark
   `(default ((,class (:background ,black1 :foreground ,white1))))
   `(hl-line ((,class (background ,black2))))
   `(region ((,class (:background ,black3))))
   `(cursor ((,class (:background ,black4))))
   `(button ((,class (:foreground ,red1 :underline t))))
   `(highlight ((,class (:background ,black2))))
   `(show-paren-match ((,class (:background "#53707D"))))

   `(vertical-border ((,class (:foreground ,black2))))

   `(font-lock-comment-face ((,class (:slant italic :foreground ,white2))))
   `(font-lock-keyword-face ((,class (:weight bold :foreground ,red1))))
   `(font-lock-string-face ((,class (:foreground ,red3))))

   `(zencoding-preview-input ((,class (:box nil :background ,blue1))))
   `(minibuffer-prompt ((,class (:foreground ,red2))))
   `(mode-line-inactive ((,class (:background ,black4 :foreground ,black1 :box nil))))
   `(mode-line ((,class (:background ,black2 :foreground ,white1 :box nil))))

   `(link ((,class (:foreground ,red2 :underline t))))
   `(info-header-xref ((,class (:foreground ,red2 :underline t))))

   ;; helm
   `(header-line ((,class (:background ,black1 :foreground nil :weight bold))))
   `(helm-source-header ((,class (:background nil :foreground ,green3 :underline nil))))
   `(helm-selection ((,class (:background ,black2 :underline nil))))
   `(helm-match ((,class (:background ,black1 :foreground ,red3))))
   `(helm-ff-file ((,class (:foreground ,white1))))
   `(helm-ff-directory ((,class (:background nil :foreground ,blue4))))))

(provide-theme 'secretvalley-dark)
