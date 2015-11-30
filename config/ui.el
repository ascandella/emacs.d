(use-package monokai-theme
	     :ensure t)
(load-theme 'monokai t)
;; (load-theme 'lush t)

;; disable menu bar
(menu-bar-mode -1)

(require 'ansi-color)
(setq-default fill-column 80)

(set-face-attribute 'vertical-border
		    nil
		    :foreground "#282a2e")

(when window-system
  (tool-bar-mode -1)
  (setq-default dotspacemacs-default-font '(:size 14)))

;; (global-linum-mode)

(show-paren-mode 1)
; enable colorization in compilation window
(require 'ansi-color)

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(defadvice display-message-or-buffer (before ansi-color activate)
  "Process ANSI color codes in shell output."
  (let ((buf (ad-get-arg 0)))
    (and (bufferp buf)
	 (string= (buffer-name buf) "*Shell Command Output*")
	 (with-current-buffer buf
	              (ansi-color-apply-on-region (point-min) (point-max))))))

(provide 'ui)
