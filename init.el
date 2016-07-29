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
    (require 'ai-git) ;; needs to come after keys so we load evil later
    (require 'ai-kwm)
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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "8abee8a14e028101f90a2d314f1b03bed1cde7fd3f1eb945ada6ffc15b1d7d65" default)))
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
