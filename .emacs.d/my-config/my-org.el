(provide 'my-org)


(use-package org

  :config
  (setq
   org-ellipsis "  ⤶"
   org-adapt-indentation t
   org-confirm-babel-evaluate nil
   org-startup-folded t
   org-hide-block-startup t)
)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))
