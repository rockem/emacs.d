;; CEDET Settings

;; (add-to-list 'load-path (expand-file-name (concat site-lisp-path "elib-1.0/")))
(add-to-list 'load-path (expand-file-name (concat site-lisp-path "cedet-1.0pre4/common")))

(require 'cedet) 

(provide 'es-cedet)