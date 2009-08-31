;; Key bindings 

(require 'my-edit)
(require 'my-misc)
(require 'my-nevigate)

(defvar run-current-buffer nil)


(defun reload-emacs-init()
  "reload my init file"
  (interactive)
  (load-file (expand-file-name "~/_emacs")))
(global-set-key (kbd "C-c 1") 'reload-emacs-init)

(global-set-key (kbd "C-c i") 'indent-whole-buffer)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "C-`") 'switch-to-previous-buffer)
;; (global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<f5>") 'run-project)
(global-set-key (kbd "C-c C-y") 'duplicate-line)
(global-set-key (kbd "C-c Y") 'mark-line-and-copy)
(global-set-key (kbd "C-c C-k") 'nuke-line)
(global-set-key (kbd "<f6>") (lambda() (interactive) (eshell-command run-current-buffer)))
(global-set-key (kbd "<C-f6>") 'run-current-buffer-as-external)
(provide 'es-shortcuts)