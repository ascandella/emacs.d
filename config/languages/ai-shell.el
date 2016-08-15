(add-hook 'sh-mode-hook
	  (lambda ()
	    (smart-tab-mode)
	    (setq tab-width 2)))

(provide 'ai-shell)
