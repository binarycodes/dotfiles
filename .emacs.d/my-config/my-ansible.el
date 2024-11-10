;; -*- lexical-binding: t; -*-

(provide 'my-ansible)

(defun ansible-vault-mode-maybe ()
  (when (ansible-vault--is-encrypted-vault-file)
    (ansible-vault-mode 1)))

(use-package ansible-vault
  :init (add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe)
  :config (setq ansible-vault-password-file "~/.ansible/vault-password"))
