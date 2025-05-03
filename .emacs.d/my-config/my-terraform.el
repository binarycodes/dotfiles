(provide 'my-terraform)

(use-package terraform-mode
  ;; if using straight
  ;; :straight t

  ;; if using package.el
  ;; :ensure t
  :custom
  (terraform-indent-level 2)
  (terraform-format-on-save t)

  :config
  (defun my-terraform-mode-init ()
    ;; if you want to use outline-minor-mode
    ;; (outline-minor-mode 1)
    )

  (add-hook 'terraform-mode-hook 'my-terraform-mode-init))
