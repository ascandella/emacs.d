(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'python-mode-hook 'ac-anaconda-setup)

(provide 'completion)
