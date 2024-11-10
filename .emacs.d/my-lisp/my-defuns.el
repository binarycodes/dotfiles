(provide 'my-defuns)

(defun add-to-load-path-with-subdirs (base exclude-list include-list)
  "Adds base to the load-path and all dirs from include-list
recursively, while excluding the content from the exclude-list"
  (interactive)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (member f exclude-list)))
		(add-to-list 'load-path name)
        (when (member f include-list)
          (add-to-load-path-with-subdirs name exclude-list include-list))))))

(defun my-prog-nuke-trailing-whitespace ()
  (interactive)
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

(defun my-kill-non-file-buffs ()
  "Kill all buffers that are not associated with files or running
processes. Excludes on-file buffers for some modes and buffer
names. Mode list and uffer names to be updated as per
convenience."
  (interactive)
  (dolist (buffer (buffer-list))
    (when (and (equal (buffer-file-name buffer) nil)
               (not (member (with-current-buffer buffer major-mode)
							'(erc-mode slime-repl-mode comint-mode inferior-lisp dired-mode treemacs-mode)))
               (equal (get-buffer-process buffer) nil))
      (kill-buffer buffer)))
  (message "Killed some buffers!"))
