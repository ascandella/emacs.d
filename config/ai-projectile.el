(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package grizzl
  :ensure t
  :config
  (setq projectile-completion-system 'grizzl))

(use-package ag
  :ensure t)

(setq
 projectile-globally-ignored-directories
 (append projectile-globally-ignored-directories
	 '(
	   "go-build"
	   "Godeps"
	   "vendor"
	   ))
 )

(provide 'ai-projectile)
