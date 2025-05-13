;; -*- lexical-binding: t; -*-

(provide 'my-editor-settings)

;; coding system settings
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq-default
 indent-tabs-mode nil
 tab-width 4
 tab-stop-list (number-sequence 4 120 4))

;; auto revert to on disk changes
(global-auto-revert-mode t)

;; require new line at the end
(setq require-final-newline t)

(use-package elisp-autofmt
  :commands (elisp-autofmt-mode elisp-autofmt-buffer))

(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)

(electric-pair-mode t)


(use-package tree-sitter)
