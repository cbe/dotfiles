;;; -*- coding: utf-8 -*-
;; ####################
;; Fonts
;; ####################

(set-frame-font "Hack")

;; Defines different font sizes for different plattforms
(when-on-linux (set-face-attribute 'default nil :height 130))
(when-on-mac   (set-face-attribute 'default nil :height 180))
