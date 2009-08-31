;; ibuffer settings

(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-use-header-line t)

(global-set-key [(f12)] 'ibuffer)

(provide 'es-ibuffer)