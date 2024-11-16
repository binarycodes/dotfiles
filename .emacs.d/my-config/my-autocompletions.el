(provide 'my-autocompletions)

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package company
  :ensure t
  :hook ((prog-mode . company-mode))
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
        company-tooltip-limit 14
        company-require-match 'never
        company-tooltip-align-annotations t))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))


(add-hook 'c-mode-hook 'lsp-deferred)
