;; Compilation utilities

(defun es-compile ()
    "Run compile and resize the compile window"
    (interactive)
    (progn
      (call-interactively 'compile)
      (setq cur (selected-window))
      (setq w (get-buffer-window "*compilation*"))
      (select-window w)
      (setq h (window-height w))
      (shrink-window (- h 10))
      (select-window cur)))

(defun es-compilation-hook () 
  "Make sure that the compile window is splitting veritaclly"
  (progn
    (if (not (get-buffer-window "*compilation*"))
	(progn
	  (split-window-vertically)))))
