(provide 'my-autocompletions)

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package company
  :ensure t
  :hook ((prog-mode . company-mode))
  :bind (("C-c C-c" . company-complete))
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-tooltip-limit 14
        company-require-match 'never
        company-tooltip-align-annotations t))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)

  :hook (
         (terraform-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         )

  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (add-to-list 'lsp-file-watch-ignored-directories "/mnt/personal/"))


(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'lsp-deferred)
