;; better m-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; enable c-u and c-d scrolling like vim
(setq evil-want-C-u-scroll t)

(use-package evil-leader
  :ensure t)

(global-evil-leader-mode)

(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  )

(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode 1))

;; from spacemacs
(define-key global-map (kbd "RET") 'newline-and-indent)
;; (electric-indent-mode +1)
(evil-ex-define-cmd "W[rite]" 'evil-write)

(define-key evil-normal-state-map "s" 'evil-forward-char)
(define-key evil-normal-state-map "k" 'kill-word)
(define-key evil-normal-state-map "j" 'evil-delete-backward-word)

(define-key evil-motion-state-map "l" 'evil-search-next)
(define-key evil-motion-state-map "n" 'evil-previous-line)
(define-key evil-motion-state-map "t" 'evil-next-line)
(define-key evil-motion-state-map "h" 'evil-backward-char)
(define-key evil-motion-state-map "s" 'evil-forward-char)

(define-key evil-normal-state-map (kbd "DEL") 'delete-window)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "w" 'evil-write
  "," 'projectile-find-file
  "n" 'helm-mini
  "g" 'helm-M-x
  "y" 'helm-show-kill-ring
  "a" 'projectile-ag
  "p" 'toggle-pbcopy
  "cd" 'cd
  "h" 'helm-swoop
  "r" 'select-paragraph
  "." 'vi-line-above
  "'" 'vi-line-below
  "d" 'trailing-comma
  "cq" 'tell-emacsclients-for-buffer-to-die
  ;; "m" 'magit-status
  "b" 'magit-blame
  "ss" 'sort-lines
  "cc" 'compile
  "-" 'evilnc-comment-or-uncomment-lines
  "2" (lambda () (interactive) (shift-width 2))
  "4" (lambda () (interactive) (shift-width 4)))

(provide 'ai-keys)
;;; ai-keys.el ends here
