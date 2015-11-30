;; disable annoying tilde-files
(setq
 make-backup-files nil
 )

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'ai-core)
