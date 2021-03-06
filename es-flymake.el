;; Flymake

(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))



(defvar flymake-ruby-err-line-patterns '(("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)))
(defvar flymake-ruby-allowed-file-name-masks '((".+\\.\\(rb\\|rake\\)$" flymake-ruby-init)
                                               ("Rakefile$" flymake-ruby-init)))
 
;; Not provided by flymake itself, curiously
(defun flymake-create-temp-in-system-tempdir (filename prefix)
  (make-temp-file (or prefix "flymake-ruby")))
 
;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (list "ruby" (list "-c" (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-in-system-tempdir))))
 
(defun flymake-ruby-load ()
  (interactive)
  (set (make-local-variable 'flymake-allowed-file-name-masks) flymake-ruby-allowed-file-name-masks)
  (set (make-local-variable 'flymake-err-line-patterns) flymake-ruby-err-line-patterns)
  (flymake-mode t))


(provide 'es-flymake)