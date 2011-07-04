;;(add-to-list 'load-path (expand-file-name (concat site-lisp-path "ruby")))
;;(add-to-list 'load-path (expand-file-name (concat site-lisp-path "rails-reloaded")))
(add-to-list 'load-path (expand-file-name (concat site-lisp-path "rinari")))
(add-to-list 'load-path (expand-file-name (concat site-lisp-path "rspec-mode")))
(add-to-list 'load-path (expand-file-name (concat site-lisp-path "rhtml-mode")))

(require 'ruby-mode)

(require 'rinari)
(setq rinari-tags-file-name "TAGS")

(require 'rspec-mode)

(add-to-list 'load-path "~/path/to/your/elisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))

;;(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)
;;(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
;;(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode)) 

;;(add-to-list 'auto-minor-mode-alist
;;	     (cons (concat "\\." (regexp-opt '("html\\.erb" "rb") t) "\\'")
;;		   'rspec-mode))

;; (add-hook 'ruby-mode-hook 'flymake-ruby-load)

;;(require 'rails-autoload)

;;(setq
;;      nxhtml-global-minor-mode t
 ;;     mumamo-chunk-coloring 'submode-colored
  ;;    nxhtml-skip-welcome t
   ;;   indent-region-mode t
    ;;  rng-nxml-auto-validate-flag nil
     ;; nxml-degraded t)     
;;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))


(provide 'es-ruby)