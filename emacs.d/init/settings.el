;;; -*- coding: utf-8 -*-
;; ####################
;; Settings
;; ####################

;; Autosave & Backup Files
(defvar emacs-directory     (file-name-directory load-file-name))
(defvar auto-save-directory (expand-file-name "../auto-save/" emacs-directory))
(defvar backup-directory    (expand-file-name "../backup/" emacs-directory))
(setq auto-save-list-file-prefix auto-save-directory)
(setq auto-save-file-name-transforms `((".*" ,auto-save-directory t)))
(setq backup-directory-alist (list (cons ".*" backup-directory)))

;; Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Frame settings
;; Disables menu-bar & background-color in terminal mode
(when-in-terminal (menu-bar-mode -1))
(when-in-terminal (set-face-background 'default "unspecified-bg" nil))
;; Saves frame and window options and all open buffers
(when-graphical-display (desktop-save-mode 1))
(when-graphical-display (scroll-bar-mode -1))
(tool-bar-mode -1)
;; OSX: Clean and dark frame title, https://emacs.stackexchange.com/a/40777
(when-on-mac (add-to-list 'default-frame-alist '(ns-appearance . dark)))
(when-on-mac (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
;; Full path in frame title, https://www.emacswiki.org/emacs/FrameTitle#toc4
(setq frame-title-format
      '(buffer-file-name "%f"
                         (dired-directory dired-directory "%b")))

;; Window & Buffer settings
;; Disable blinking cursor
(blink-cursor-mode 0)
;; Highlight current line
(global-hl-line-mode t)
;; Show line number in left margin
(global-linum-mode t)
;; Highlight matching parentheses
(show-paren-mode t)
;; System paste does this at cursor position
(setq mouse-yank-at-point t)

;; Mini-Buffer settings
;; Show column number in mini-buffer
(column-number-mode t)

;; Major modes
;; Set major mode in scratch buffer
(setq initial-major-mode 'rjsx-mode)

;; Set default major modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;; Minor Modes
;; Enhance auto-completion in mini-buffer with ‘ido’
(ido-mode t)
;; Save place in buffer
(save-place-mode t)
;; Enable ‘auto-completion’ minor mode
(ac-config-default)
(add-to-list 'ac-modes 'rjsx-mode)
;; Enable ‘editorconfig-mode’
(editorconfig-mode t)
;; Enable ‘yassnippet’ globally
(yas-global-mode t)

;; Electric
(electric-pair-mode t)
(electric-quote-mode t)
(global-auto-complete-mode t)
(setq require-final-newline t)

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset indentation
              css-indent-offset indentation
              js-indent-level indentation
              sh-basic-offset indentation
              sh-indentation indentation
              standard-indent indentation
              tab-width indentation)
