;; Perl related settings

(require 'flymake)

(mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

;; (defun flymake-perl-init (buffer)
;;        (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                           buffer 'flymake-create-temp-inplace))
;;               (local-file  (concat (flymake-build-relative-filename
;;                                     (file-name-directory (buffer-file-name (current-buffer)))
;;                                     (file-name-directory temp-file))
;;                                    (file-name-nondirectory temp-file))))
;;          (list "perl" (list "-wc " local-file))))

;; (setq flymake-allowed-file-name-masks
;;            (cons '(".+\\.pm$"
;;                    flymake-perl-init
;;                    flymake-simple-cleanup
;;                    flymake-get-real-file-name)
;;                  flymake-allowed-file-name-masks))


;; (setq flymake-err-line-patterns
;;            (cons '("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]"
;;                    2 3 nil 1)
;;                  flymake-err-line-patterns))

(defface my-cperl-nonoverridable-face 
  '((((class color))
     (:foreground "blue4")
     ))
  "Must we have it here ?"
  :group 'cperl-mode)
(set-default 'cperl-nonoverridable-face 'my-cperl-nonoverridable-face)

(defun my-cperl-mode-hook() 
  (setq run-current-buffer 
	(concat "perl " 
	(file-name-nondirectory
	(buffer-file-name (current-buffer)))))
 (flymake-mode))

(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)


  

(provide 'es-perl)