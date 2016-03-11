;; disable annoying tilde-files
(setq
 make-backup-files nil
 inhibit-startup-screen t
 inhibit-startup-echo-area-message t
 initial-scratch-message nil
 require-final-newline t
 vc-follow-symlinks t
 backup-directory-alist `(("." . "~/.saves"))
 backup-by-copying-when-linked t
 )

;; auto reload stuff from disk
(global-auto-revert-mode t)

(defun display-startup-echo-area-message ())

(fset 'yes-or-no-p 'y-or-n-p)

(eval-when-compile
  (require 'use-package)
  )

(use-package flycheck
  :ensure t)

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq dired-use-ls-dired nil)

;; ensure path is configured properly
(use-package exec-path-from-shell
  :ensure t
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (progn
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))
    (exec-path-from-shell-copy-env "GOPATH")))

(use-package helm
  :ensure t)

(provide 'ai-core)
