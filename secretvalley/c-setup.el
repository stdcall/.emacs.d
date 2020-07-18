(require 'compile)

(setq-default c-default-style "linux"
              c-basic-offset 2
              c-syntactic-indentation t
              truncate-lines t)

(add-hook 'c-mode-hook
          (lambda ()
            (unless (file-exists-p "Makefile")
              (set (make-local-variable 'compile-command)
                   ;; emulate make's .c.o implicit pattern rule, but with
                   ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                   ;; variables:
                   ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s -c -o %s.o %s %s %s"
                             (or (getenv "CC") "gcc")
                             (file-name-sans-extension file)
                             (or (getenv "CPPFLAGS") "-DDEBUG=9")
                             (or (getenv "CFLAGS") "-std=c11 -pedantic -Wall -g")
                             file))))))

(add-hook 'c-mode-common-hook
          (lambda()
      p      (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


(provide 'c-setup)
