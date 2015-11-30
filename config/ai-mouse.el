(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (setq mouse-sel-mode t)
  (global-set-key [mouse-4] (lambda ()
			      (interactive)
			      (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
			      (interactive)
			      (scroll-up 1)))
  )

(provide 'ai-mouse)
