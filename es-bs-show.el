;; bs-show settings

;; add line highliting to bs-show
(defun my-bs-show-hook () 
  (hl-line-mode t))
(add-hook 'bs-mode-hook 'my-bs-show-hook)

(global-set-key (kbd "C-x C-b") 'bs-show)

(provide 'es-bs-show)