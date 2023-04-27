;;; -*- coding: utf-8 -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-spacegrey)))
 '(custom-safe-themes
   (quote
    ("d6f04b6c269500d8a38f3fabadc1caa3c8fdf46e7e63ee15605af75a09d5441e" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(package-selected-packages
   (quote
    (go-mode restclient yaml-mode yasnippet json-mode editorconfig rjsx-mode php-mode org multiple-cursors move-text markdown-mode gruvbox-theme find-file-in-project doom-themes dockerfile-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Defines indentation for every loaded module
(defvar indentation 2)

;; Imports
(add-to-list 'load-path (expand-file-name "init/" (file-name-directory load-file-name)))
;; Load packages & functions first to allow usage in other loaded modules
;; Load packages after ’package-selected-packges’ is defined
(load "packages")
(load "functions")

(load "fonts")
(load "hooks")
(load "key_bindings")
(load "settings")
