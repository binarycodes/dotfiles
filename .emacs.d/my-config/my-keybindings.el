(provide 'my-keybindings)

;;; prevent C-z from sending emacs to background
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "<f12>") 'revert-buffer)

;; ace-window (switch between windows and frames)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "C-c <f12>") 'ansible-vault-mode-maybe)

;; treemacs
(global-set-key (kbd "<f11>") 'treemacs-select-window)
(global-set-key (kbd "C-<f11>") 'treemacs-select-directory)
