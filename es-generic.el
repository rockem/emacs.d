;;; Generic emacs settings 
 
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)
 
;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)
 
;; Display line and column numbers
(setq line-number-mode    t)
(setq column-number-mode  t)
 
;; Line-wrapping
(set-default 'fill-column 80)

(setq ring-bell-function (lambda () (message "*beep*"))) 
;; Emacs does not beep or flash anymore, 
;; on hit C-g in the minibuffer or during 
;; an isearch.
;; (setq ring-bell-function 
;;       (lambda ()
;;         (unless (memq this-command
;;                       '(isearch-abort abort-recursive-edit 
;;                                       exit-minibuffer
;;                                       keyboard-quit))
;;           (ding))))

;; (setq ring-bell-function nil)

;; We don't need this useless toolbar
(tool-bar-mode nil)
 
;; Show the current function name
(which-func-mode 1)
 
;; Don't show flash screen
(setq inhibit-startup-message t)
 
;; Saving the last cursor place in files
(require 'saveplace)
(setq-default save-place t)
 
;; Blinking cursor is annoying
(blink-cursor-mode nil)

;; For smoother "normal" scrolling
(require 'smooth-scrolling)
(setq smooth-scroll-margin 2)

;; Preserve the cursor position when scrolling up and down
(setq scroll-preserve-screen-position t)

;; Sets the title bar to the full file name
(setq frame-title-format '(buffer-file-name "%f" ("%b"))) 

;; Enable CUA mode (global mark, rectangle ..)
(setq cua-enable-cua-keys nil)
(cua-mode)

;; Truncating long lines
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(provide 'es-generic)