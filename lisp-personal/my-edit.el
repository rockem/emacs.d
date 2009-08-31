;; Editing utililties

(defun indent-whole-buffer ()
  "Indenting the whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(defun mark-line-and-copy ()
  "Copy the current line into the kill ring."
  (interactive)
  (kill-ring-save (line-beginning-position) (line-end-position))
  (message "line copied"))

(defun duplicate-line ()
  "Copy this line under it; put point on copy in current column."
  (interactive)
  (let ((start-column (current-column)))
    (save-excursion
      (mark-line-and-copy) ;save-excursion restores mark
      (end-of-line)
      (open-line 1)
      (next-line 1)
      (yank))
    (forward-line 1)
    (move-to-column start-column))
  (message "line dup'ed"))

(defun open-next-line (arg)
  "Move to the next line and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun open-previous-line (arg)
  "Open a new line before the current one."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun pg-kill-this-line (n)
  "Kill the line point is on.
      With prefix arg, kill this many lines starting at the line point is on."
  (interactive "p")
  (kill-region (line-beginning-position)
	       (progn (forward-line n) (point))))

;; ===== Function to delete a line =====

;; First define a variable which will store the previous column position
(defvar previous-column nil "Save the column position")

;; Define the nuke-line function. The line is killed, then the newline
;; character is deleted. The column which the cursor was positioned at is then
;; restored. Because the kill-line function is used, the contents deleted can
;; be later restored by usibackward-delete-char-untabifyng the yank commands.
(defun nuke-line()
  "Kill an entire line, including the trailing newline character"
  (interactive)

  ;; Store the current column position, so it can later be restored for a more
  ;; natural feel to the deletion
  (setq previous-column (current-column))

  ;; Now move to the end of the current line
  (end-of-line)

  ;; Test the length of the line. If it is 0, there is no need for a
  ;; kill-line. All that happens in this case is that the new-line character
  ;; is deleted.
  (if (= (current-column) 0)
    (delete-char 1)

    ;; This is the 'else' clause. The current line being deleted is not zero
    ;; in length. First remove the line by moving to its start and then
    ;; killing, followed by deletion of the newline character, and then
    ;; finally restoration of the column position.
    (progn
      (beginning-of-line)
      (kill-line)
      (delete-char 1)
      (move-to-column previous-column))))



(defun move-line-down()
  "move the current line down one line"
  (interactive)
  (setq previous-column (current-column))
  (progn
    (next-line)
    (transpose-lines 1)
    (previous-line)
    (move-to-column previous-column)))

(defun move-line-up()
  "move the current line one line up"
  (interactive)
  (setq previous-column (current-column))
  (if (> (line-number-at-pos) (point-min))
      
  (progn
    (transpose-lines 1)
    (previous-line)
    (previous-line)
    (move-to-column previous-column))))


(provide 'my-edit)
