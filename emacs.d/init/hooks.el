;;; -*- coding: utf-8 -*-
;; ####################
;; Hooks
;; ####################

;; Removes trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ‘js2-mode‘ (or ‘rjsx-mode‘): adds known globals
(defun js2-known-globals-hook ()
  (dolist (global '(;; node
                    "global"
                    "require"
                    ;; es6
                    "import"
                    "export"
                    ;; mocha/chai
                    "describe"
                    "context"
                    "beforeEach"
                    "afterEach"
                    "it"
                    "expect"))
    (add-to-list 'js2-global-externs global)))
(add-hook 'js2-mode-hook 'js2-known-globals-hook)

;; some modes override basic offset
(defun custom-php-hook () (setq c-basic-offset indentation))
(add-hook 'php-mode-hook 'custom-php-hook)

(defun custom-markdown-hook () (setq tab-width indentation))
(add-hook 'markdown-mode-hook 'custom-markdown-hook)
