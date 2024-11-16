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

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
				term-mode-hook
				eshell-mode-hook
				treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(fringe-mode '(10 . 0)) ; give some space for the symbols (only of the left)


;; flash the screen, when moving out of bounds, ex, pressing up when already at the first line.
(setq visible-bell t
      blink-cursor-interval 0.7)


;; fonts & theme
(set-face-attribute 'default nil :font "JetBrains Mono" :height 130)
(set-face-attribute 'default nil :family "MesloLGS NF")

(use-package nezburn-theme
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'nezburn :no-confirm))

;; set frame title to reflect buffer/filename and status of buffer
(setq frame-title-format
      '("emacs%@" (:eval (system-name))
        ": " (:eval (if (buffer-file-name)
                        (abbreviate-file-name (buffer-file-name))
                      "%b")) " [%*]"))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(unless (member "Symbols Nerd Font Mono" (font-family-list))
  (nerd-icons-install-fonts t))
