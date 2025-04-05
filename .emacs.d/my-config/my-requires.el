;; -*- lexical-binding: t; -*-

(provide 'my-requires)

(require 'my-general-settings)
(require 'my-theming)
(require 'my-editor-settings)
(require 'my-dired)

(require 'my-yaml)
(require 'my-ansible)
(require 'my-terraform)

(require 'my-magit)
(require 'my-treemacs)

(require 'my-autocompletions)
(require 'my-c-mode)
; load at the ending after everything else has been defined
(require 'my-keybindings)

(require 'my-go)
