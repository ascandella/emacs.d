(projectile-global-mode)

(use-package projectile
  :ensure t
  :config
  (setq projectile-enable-caching t))

(use-package grizzl
  :ensure t
  :config
  (setq projectile-completion-system 'grizzl))

(use-package ag
  :ensure t)

(provide 'ai-projectile)
