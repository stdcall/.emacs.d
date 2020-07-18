(defun add-hook-to-modes (modes function)
  (dolist (mode modes)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
              function)))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  (interactive)
  (whitespace-cleanup)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  ;; Doesn't work with TeX!
  ;; (set-buffer-file-coding-system 'utf-8)
  )

(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)))

(defun sudo ()
  "Use TRAMP to `sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
             buffer-file-name))))

;; I like to use hsl colors, even in emacs themes
(require 'color)
(require 'cl)
(defun hsl (h s l)
  (let ((h (/ (float h) 360)) ;; documentation says hue must be in
        ;; radians but it's not, angle in radians = angle-in-degrees*π/180°
        (s (/ (float s) 100))
        (l (/ (float l) 100)))
    (apply 'color-rgb-to-hex (append (color-hsl-to-rgb h s l) '(2)))))

(defun lighten (color percent)
  (progn
    (string-match "#\\(..\\)\\(..\\)\\(..\\)" color)
    (let ((r (/ (string-to-number (match-string-no-properties 1 color) 16) 255.0))
          (g (/ (string-to-number (match-string-no-properties 2 color) 16) 255.0))
          (b (/ (string-to-number (match-string-no-properties 3 color) 16) 255.0)))
      (multiple-value-bind (h s l)
          (color-rgb-to-hsl r g b)
        (apply 'color-rgb-to-hex
               (apply 'color-hsl-to-rgb (color-lighten-hsl h s l percent)))))))

(defun darken (color percent)
  (progn
    (string-match "#\\(..\\)\\(..\\)\\(..\\)" color)
    (let ((r (/ (string-to-number (match-string-no-properties 1 color) 16) 255.0))
          (g (/ (string-to-number (match-string-no-properties 2 color) 16) 255.0))
          (b (/ (string-to-number (match-string-no-properties 3 color) 16) 255.0)))
      (multiple-value-bind (h s l)
          (color-rgb-to-hsl r g b)
        (apply 'color-rgb-to-hex
               (apply 'color-hsl-to-rgb (color-darken-hsl h s l percent)))))))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))

(provide 'misc-defuns)
