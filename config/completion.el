(use-package go-autocomplete
  :ensure t)
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'python-mode-hook 'ac-anaconda-setup)

(provide 'completion)
