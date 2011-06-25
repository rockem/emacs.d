;;(add-to-list 'load-path (expand-file-name (concat site-lisp-path "ruby")))
;;(add-to-list 'load-path (expand-file-name (concat site-lisp-path "rails-reloaded")))
(add-to-list 'load-path (expand-file-name (concat site-lisp-path "rspec-mode")))

(require 'ruby-mode)
(require 'rspec-mode)
;; (add-hook 'ruby-mode-hook 'flymake-ruby-load)

;;(require 'rails-autoload)

(provide 'es-ruby)