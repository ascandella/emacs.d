(use-package sublimity
  :ensure t
  :config
  (sublimity-mode 1))

(require 'sublimity-scroll)
;; this only works in xemacs
;; (when window-system
;; (require 'sublimity-map))
;; (require 'sublimity-attractive)

(provide 'ai-sublimity)
