(add-to-list 'load-path (expand-file-name (concat site-lisp-path "ruby")))

(require 'ruby-mode)

(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(provide 'es-ruby)