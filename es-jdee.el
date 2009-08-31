;; JDEE settings

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/jde-2.3.5.1/lisp/"))

;; (require 'jde)
(setq defer-loading-jde t)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '((".java'" . jde-mode))
	     auto-mode-alist)))

  (require 'jde))

(provide 'es-jdee)