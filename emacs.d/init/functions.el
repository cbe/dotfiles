;;; -*- coding: utf-8 -*-
;; ####################
;; Functions
;; ####################

(defmacro when-in-terminal(body) (if (not (display-graphic-p))
                                     (progn body)))
(defmacro when-graphical-display(body) (if (display-graphic-p)
                                           (progn body)))

(defmacro when-on-mac(body) (if (eq system-type 'darwin)
                                (progn body)
                              nil))
(defmacro when-on-linux(body) (if (eq system-type 'gnu/linux)
                                  (progn body)
                                nil))

;; https://emacs.stackexchange.com/a/171
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation"
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

;; Join multiple lines
;; https://medium.com/@4d47/join-lines-in-emacs-cc40a55e4539
(defun join-lines (n)
  "Join n lines."
  (interactive "p")
  (if (use-region-p)
      (let ((fill-column (point-max)))
        (fill-region (region-beginning) (region-end)))
    (dotimes (_ (abs n))
      (delete-indentation (natnump n)))))
