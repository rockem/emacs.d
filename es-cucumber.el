(add-to-list 'load-path (concat site-lisp-path "cucumber"))

(setq feature-default-i18n-file (concat site-lisp-path "cucumber/i18n.yml"))

(require 'feature-mode)

;; load bundle snippets
(yas/load-directory (concat site-lisp-path "cucumber/snippets"))
(yas/load-directory (concat site-personal-path "cucumber-snippets"))

(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))

(provide 'es-cucumber)