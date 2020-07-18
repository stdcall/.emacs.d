;; Eshell configuration
(add-hook 'eshell-mode-hook (lambda () (setq global-hl-line-mode nil)))
;; Someone told me the rule that all prompts must include lambda :)
(setq eshell-prompt-function
      (lambda ()
        (propertize (concat (car (last (split-string (eshell/pwd) "/")))
                            (propertize " λ"  'face `(:foreground ,(hsl 100 55 75))) " ")
                    'intangible t 'read-only nil 'rear-nonsticky t 'front-nonsticky t))
      eshell-prompt-regexp "^.* λ $"
      eshell-highlight-prompt nil)

;; More decent ansi colors
;; black red green yellow blue magenta cyan white
(custom-set-variables
 '(ansi-color-names-vector
   ["black" "red" "#b3e29c"  "yellow" "PaleBlue" "magenta" "cyan" "white"]))

(provide 'eshell-setup)
