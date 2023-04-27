;;; -*- coding: utf-8 -*-
;; ####################
;; Key Bindings
;; ####################

(global-set-key (kbd "C-x r r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-<prior>") 'windmove-left)
(global-set-key (kbd "C-<next>") 'windmove-right)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-x C->") 'mc/mark-all-like-this)
(global-set-key (kbd "M-s") 'find-file-in-project)
(global-set-key (kbd "M-j") 'join-lines)

;; Packages
;; M-<up> & M-<down> move line or block
(move-text-default-bindings)

;; OSX: specific key-bindings are missing from default
(when-on-mac (global-set-key (kbd "<home>") 'move-beginning-of-line))
(when-on-mac (global-set-key (kbd "<end>") 'move-end-of-line))
(when-on-mac (global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen))
