;; Project settings and templates

(require 'compile)
(add-to-list 'auto-mode-alist '("\\.eprj\\'" . lisp-mode))

(defcustom run-project-command ""
  "run the specified program"
  :type 'string
  :group 'project)

(defvar run-project-history nil) 

(defvar eproj-root-directory nil)
(defvar eproj-unittest-directory nil)
(defvar eproj-unittest-exe nil)
(defvar eproj-exe nil)
(defvar eproj-ctags-args nil)


(defun eproj-run-ctags()
  (shell-command (concat "ctags " eproj-ctags-args " " eproj-root-directory)))

(defun eproj-open-project(file) 
  (interactive "fOpen Porject:")
  (setq eproj-root-directory (file-name-directory (expand-file-name file)))
  (load-file file)
  (visit-tags-table (concat eproj-root-directory "TAGS"))
  (add-hook 'after-save-hook 'eproj-run-ctags)
  (message "Project loaded."))

(defun eproj-compile-project() 
  (interactive)
  (let ((default-directory eproj-root-directory))
    (call-interactively 'compile)))

(defun eproj-run-tests() 
  (interactive)
  (setq tmp-compile compile-command)
  (let ((default-directory (concat eproj-root-directory eproj-unittest-directory)))
    (compile (concat eproj-root-directory eproj-unittest-directory "/" eproj-unittest-exe)))
  (setq compile-command tmp-compile))


(defun run-project(command)
  (interactive
   (list
   (let ((command (eval run-project-command)))
     (read-from-minibuffer "Run command: "
			   command nil nil
			   (if (equal (car run-project-history) command)
			       '(run-project-history . 1)
			     'run-project-history)))))
   ;; (consp current-prefix-arg)))
  (unless (equal command (eval run-project-command))
    (setq run-project-command command))
  (eshell-command run-project-command))

(defun eproj-run-app() 
  (interactive)
  (setq tmp-compile compile-command)
  (let ((default-directory (concat eproj-root-directory eproj-unittest-directory)))
    (compile (concat eproj-root-directory eproj-unittest-directory "/" eproj-exe)))
  (setq compile-command tmp-compile))

(global-set-key (kbd "<f7>") 'eproj-compile-project)
(global-set-key (kbd "<f8>") 'eproj-run-tests)
(global-set-key (kbd "<f2>") 'eproj-open-project)
(global-set-key (kbd "<f5>") 'eproj-run-app)



(provide 'es-project)


