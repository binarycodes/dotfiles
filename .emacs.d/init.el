;; -*- lexical-binding: t; -*-

;;; setup packages
(require 'package)

;; elpa servers
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;;; general custom functions
(require 'my-defuns "~/.emacs.d/my-lisp/my-defuns.el")

;;; load path
;; add paths to the load-path
(add-to-load-path-with-subdirs (expand-file-name "~/.emacs.d/")
                               '("." ".." ".emacs.d" ".srecode" "auto-save-list" "history" "my-backup-files" "eshell", "elpa")
                               '("my-lisp", "my-config"))

;;; load all customizations
(require 'my-requires)


(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
