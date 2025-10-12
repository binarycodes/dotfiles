;; -*- lexical-binding: t; -*-

(provide 'my-theming)

;; clean startup
(setq inhibit-startup-echo-area-message t
      inhibit-startup-message t)


;; disable fancy gui stuffs, menu et. all and other ui configs
(scroll-bar-mode -1) ; disable visible scrollbar
(tool-bar-mode -1)   ; disable the toolbar
(menu-bar-mode -1)   ; disable the menu bar
(tooltip-mode -1)    ; disable tooltips
(mouse-avoidance-mode 'banish) ; banish the cursor as soon as i am typing

(column-number-mode 't) ; show column number in the modeline
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
				term-mode-hook
				eshell-mode-hook
				treemacs-mode-hook
                vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(fringe-mode '(10 . 0)) ; give some space for the symbols (only of the left)


;; flash the screen, when moving out of bounds, ex, pressing up when already at the first line.
(setq visible-bell t
      blink-cursor-interval 0.7)

;; theme

(use-package nimbus-theme
  :config
  (load-theme 'nimbus :no-confirm)
  )

;; set frame title to reflect buffer/filename and status of buffer
(setq frame-title-format
      '("emacs%@" (:eval (system-name))
        ": " (:eval (if (buffer-file-name)
                        (abbreviate-file-name (buffer-file-name))
                      "%b")) " [%*]"))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  ((doom-modeline-height 15)
   (setq doom-modeline-icon t))
  )

(unless (member "Symbols Nerd Font Mono" (font-family-list))
  (nerd-icons-install-fonts t))


;; set the fonts
(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil :font "JetBrains Mono" :height 160)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "JetBrains Mono" :height 160)

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 160 :weight 'regular))

(if (daemonp)
    (add-hook 'server-after-make-frame-hook
              (lambda ()
                (efs/set-font-faces)))
    (efs/set-font-faces))
