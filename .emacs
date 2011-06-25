;;;; Eli Segal's emacs initialization (2007)

;; Enable a backtrace when problems occur
;; (setq debug-on-error t)

;; Load paths
(add-to-list 'load-path (expand-file-name "~/emacs.d"))
(add-to-list 'load-path (expand-file-name "~/emacs.d/lisp"))
(add-to-list 'load-path (expand-file-name "~/emacs.d/lisp-personal"))

(setq site-lisp-path (expand-file-name "~/emacs.d/lisp/"))

;; Personal customizations
(require 'es-generic)
(require 'es-ido)
(require 'es-shortcuts)
(require 'es-paren)
(require 'es-bs-show)
(require 'es-spelling)
(require 'es-cc)
(require 'es-colors)
(require 'es-recentf)
(require 'es-backup)
;; (require 'es-w3m)
(require 'es-anything)
(require 'es-project)
(require 'es-perl)
;; (require 'es-emms)
(require 'es-nxml)
(require 'es-cedet)
;; (require 'es-org)
(require 'es-etags)
(require 'es-ruby)
;;(require 'es-jdee)

;; (require 'seinquote)
(require 'es-git)

;; All done
(message "All done, %s%s" (user-login-name) ".")



(put 'dired-find-alternate-file 'disabled nil)
