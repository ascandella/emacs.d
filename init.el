;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
(setq gc-cons-threshold 100000000)

(let ((file-name-handler-alist nil))

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
    (require 'ai-kwm)
    (require 'ai-mail)
    (require 'smart-beginning-of-line)
    (require 'ai-mouse)
    (require 'ui)
    (require 'completion)
    (require 'ai-projectile)
    (require 'pbcopy)
    (require 'ai-sublimity)

    (require 'languages)
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(safe-local-variable-values
   (quote
    ((eval setq golang-test-command
	   (format "UBER_ENVIRONMENT=test UBER_CONFIG_DIR=%s go test -coverprofile=cover.out"
		   (expand-file-name "config")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
