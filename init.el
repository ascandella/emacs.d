(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'load-path' "~/.emacs.d/config")
(require 'ai-core)
(require 'ai-keys)
(require 'smart-beginning-of-line)
(require 'ai-mouse)
(require 'ui)
(require 'completion)
(require 'ai-projectile)
(require 'pbcopy)
(require 'ai-sublimity)

(require 'languages)
