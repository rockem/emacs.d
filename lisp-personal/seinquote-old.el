(require 'url)

(defun get-random-quote() 
  (interactive)
  (setq page (get-random-chapter-name))
  (message (concat "->" page))
  (save-excursion
    (let* ((buffer (url-retrieve-synchronously (concat "http://www.pkmeco.com/seinfeld/" page ".htm")))
	   (quote-str "color=\"#000000\" size=\"3\""))
      (if buffer
	  (progn
	    (set-buffer buffer)
	    (goto-char (point-min))
	    (setq sennum (count-matches "color=\"#000000\" size=\"3\""))
	    (setq n (1+ (random sennum)))
	    (while (> n 1)
	      (setq n (- n 1))
	      (search-forward "color=\"#000000\" size=\"3\""))
	    (search-forward ">")
	    (setq q-begin (point))
	    (search-forward "#804000")
	    (search-backward "<")
	    (setq q-end (point))
	    (setq quote (buffer-substring q-begin q-end))
	    (setq quote (strip-html quote))
	    (setq q-begin (point))
	    (search-forward "</em>")
	    (setq q-end (point))
	    (setq source (buffer-substring q-begin q-end))
	    (setq source (strip-html source))))))
  (let* ((inhibit-read-only t))
  (split-window-vertically)
  (other-window 1)
  (switch-to-buffer (get-buffer-create "*Seinfeld Quote*"))
  (seinqoute-mode)
  (erase-buffer)
  (insert quote)
  (insert source)
  (fit-window-to-buffer)))


(defun get-random-chapter-name()
  (save-excursion
    (let* ((buffer (url-retrieve-synchronously "http://www.pkmeco.com/seinfeld/"))
	   (s-str "[a-zA-Z0-9]+\\.htm"))
      (if buffer
	  (progn
	    (set-buffer buffer)
	    (goto-char (point-min))
	    (search-forward-regexp s-str)
	    (setq n (random 138))
	    (while (> n 1)
	      (setq n (- n 1))
	      (search-forward-regexp s-str))
	    
	    (backward-word)
 	    (backward-word)
	    (thing-at-point 'word))))))


(defun strip-html(html)
  (setq html (replace-regexp-in-string "&lt;" "<" html))
  (setq html (replace-regexp-in-string "&gt;" ">" html))
  (setq html (replace-regexp-in-string "&amp;" "&" html))
  (setq html (replace-regexp-in-string "&quot;" "\"" html))
  (setq html (replace-regexp-in-string "[
]+" "" html))
  (replace-regexp-in-string "</*.+>" "" html))




