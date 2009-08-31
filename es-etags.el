;; Etags related

(require 'etags-select)

(setq tags-revert-without-query t)
(global-set-key (kbd "M-.") 'etags-select-find-tag)

(provide 'es-etags)