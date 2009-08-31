;; Parens handling

;; Mic-paren package
(when (or (string-match "XEmacs\\|Lucid" emacs-version) window-system)
  (require 'mic-paren) ; loading
  (paren-activate)     ; activating
)

(provide 'es-paren)