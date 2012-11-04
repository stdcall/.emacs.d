;; http://batsov.com/projectile/
(global-set-key (kbd "C-c h") 'helm-projectile)

;; Switch fast between last two buffers
(global-set-key (kbd "C-.") 'mode-line-other-buffer)

;; Auto indent
(define-key prog-mode-map (kbd "RET") 'newline-and-indent)

;; Expand region (increases selected region by semantic units)
(global-set-key (kbd "C-'") 'er/expand-region)

(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Navigation bindings
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)

;; select windows
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)
;; Eval buffer
(global-set-key (kbd "C-c v") 'eval-buffer)

(provide 'keybindings-setup)
