;; Org mode settings

(add-to-list 'load-path (expand-file-name (concat site-lisp-path "org-5.17a")))

(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; for conflicts with CUA
;; * S-RET - C-S-RET
;; * S-up - M-p
;; * S-down - M-n
;; * S-left - M--
;; * S-right - M-+
(setq org-CUA-compatible t)

(provide 'es-org)