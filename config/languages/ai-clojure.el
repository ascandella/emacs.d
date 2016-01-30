(use-package cider
  :ensure t)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(provide 'ai-clojure)
