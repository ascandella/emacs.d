(use-package hcl-mode
  :ensure t)

(use-package terraform-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tfstate\\'" . terraform-mode)))

(provide 'ai-terraform)
