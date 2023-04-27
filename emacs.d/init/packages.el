;;; -*- coding: utf-8 -*-
;; ####################
;; Packages
;; ####################

;; Adds `MELPA` Package Archive, https://melpa.org/#/getting-started
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa"        . "https://melpa.org/packages/") t)

;; Official way to treat dependencies, see:
;; https://stackoverflow.com/a/39891192
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
