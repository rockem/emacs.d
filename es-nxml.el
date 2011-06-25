;; nXML

;path to where nxml is
;;(set 'nxml-path (concat site-lisp-path "nxhtml/"))

;;(load (concat nxml-path "rng-auto.el"))

(add-to-list 'auto-mode-alist
	     (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
		   'nxml-mode))

;;(unify-8859-on-decoding-mode)

(setq magic-mode-alist
      (cons '("<\\?xml " . nxml-mode)
	    magic-mode-alist))
;;(fset 'xml-mode 'nxml-mode)
;;(fset 'html-mode 'nxml-mode)

(provide 'es-nxml)
