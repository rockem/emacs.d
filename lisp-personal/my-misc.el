;; Misc utilities

(defun totd ()
  "Tip Of The Day."
  (interactive)
  (with-output-to-temp-buffer "*Tip of the day*"
    (let* ((commands (loop for s being the symbols
                           when (commandp s) collect s))
           (command (nth (random (length commands)) commands)))
      (princ
       (concat "Your tip for the day is:\\n"
               "========================\\n\\n"
               (describe-function command)
               "\\n\\nInvoke with:\\n\\n"
               (with-temp-buffer
                 (where-is command t)
                 (buffer-string)))))))

(defun run-current-buffer-as-external() 
  (interactive)
  (shell-command (concat "run.bat " run-current-buffer)))


(defun doto()
  (interactive)
  (find-file (expand-file-name "~/emacs.d/my_todo.org")))


(provide 'my-misc)