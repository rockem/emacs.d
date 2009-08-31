(provide 'build-tags)

;; This provides `build-tags', which automatically rebuilds tag
;; files used by the current buffer. `build-tags-cmd-alist' can be used
;; to customize the command used to generate the tag file.
;;
;; TODO: handle missing tag files

(defvar build-tags-cmd-alist nil
  "Regexp for tag file path mapped to etag command.
The first match is used.

Example:
(setq build-tags-cmd-alist
      '((\"/home/joe/my_stuff\" . \"etags -I *.*\")
        (\"/site/libs\" . \"etags `find ./ -type f -name '*.c'`\")
        (\"/home/joe/other\" . \"ctags *.*\")))")

(defvar build-tags-cmd-default "etags --links=no --langmap=php:+.html.phph *.*"
  "Command used when nothing in `build-tags-cmd-alist' matches.")

;;;###autoload
(defun build-tags (&optional buffer async)
  "Rebuild all tag files for the current buffer."
  (interactive)
  (if (null buffer) (setq buffer (current-buffer)))
  (let (command)
    (dolist (tag-file (buffer-tag-table-list))
      (setq command (build-tags-cmd-for-tag-file tag-file))
      (setq command (concat "(cd " (file-name-directory tag-file) "; " command ")"))
      (if (async) (setq command (concat command "&")))
      (shell-command command)
      )))

(defun build-tags-cmd-for-tag-file (tag-file)
  "Return the command used to create this tag file."
  (let ((alist-rest build-tags-cmd-alist)
        command expression)
    (while (and (not (null alist-rest)) (null command))
      (setq expression (caar alist-rest))
      (setq maybe-command (cdar alist-rest))
      (setq alist-rest (cdr alist-rest))
      ;; If the car of the alist item is a string, apply it as a regexp
      ;; to the buffer-file-name.  Otherwise, evaluate it.  If the
      ;; regexp matches, or the expression evaluates non-nil, then this
      ;; item will be used.
      (when (if (stringp expression)
                (string-match expression tag-file)
              (ignore-errors
                (eval expression)))
        ;; Now evaluate the cdr of the alist item to get the command.
        (setq maybe-command (ignore-errors (eval maybe-command)))
        (if (stringp maybe-command)
            (setq command maybe-command)
          (error "Expression in build-tags-cmd-alist evaluated to non-string"))
        ))
  (if (null command) (setq command build-tags-cmd-default))
  command))