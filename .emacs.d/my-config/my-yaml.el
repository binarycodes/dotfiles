(provide 'my-yaml)


(use-package yaml-mode
  :hook (yaml-mode . (lambda ()
                       (electric-indent-local-mode -1))))
