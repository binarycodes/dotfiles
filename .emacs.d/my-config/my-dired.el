(provide 'my-dired)

(use-package dired
  :ensure nil
  :commands (dired)
  :config
  (setq  dired-kill-when-opening-new-dired-buffer t
         dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso"))
