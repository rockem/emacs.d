;; C/C++

(load-file (expand-file-name (concat site-lisp-path "sourcepair.el")))
(require 'es-qt)


(defun my-c++-mode-hook ()
  (setq c-basic-offset 4
	tab-width 4
	indent-tabs-mode t)
  (c-toggle-auto-newline -1)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map [(control c) (control o)] 'sourcepair-load)
  (flymake-mode))

(defun my-c-mode-hook ()
  (setq c-basic-offset 4
	tab-width 4
	indent-tabs-mode t)
  (c-toggle-auto-newline -1)
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c-mode-map [(control c) (control o)] 'sourcepair-load)
  (flymake-mode))

;; Add all of the hooks...
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)

; h should be c++ mode by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun cxx-create-gaurds ()
  "puts the required #defines into an header file."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (setq guard (concat (upcase
                         (file-name-sans-extension
                          (file-name-nondirectory buffer-file-name))) 
                        "_H"))
    (insert "#ifndef " guard  "\n")
    (insert "#define " guard  "\n")
    (goto-char (point-max))
    (insert "\n#endif // " guard "\n")))

(provide 'es-cc)