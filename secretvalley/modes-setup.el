;; https://github.com/bbatsov/projectile
(projectile-global-mode)
(add-to-list 'projectile-globally-ignored-directories "node_modules")
;; https://github.com/emacs-helm/helm
(setq helm-split-window-in-side-p t)
(helm-mode t)

;; colorize colors in css
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'paredit-mode)

(provide 'modes-setup)
