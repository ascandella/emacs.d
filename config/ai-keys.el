;; better m-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq
 ;; enable c-u and c-d scrolling like vim
 evil-want-C-u-scroll t
 ;; count symbols (e.g. _) as part of words for * next-word search
 evil-symbol-word-search t)

(defun go-to-reviewers()
  (interactive)
  "Go to reviewers section of `arc diff`"
  (search-forward "Reviewers:")
  (evil-append-line 1))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun tell-emacsclients-for-buffer-to-die ()
  "Sends error exit command to every client for the current buffer."
  (interactive)
  (dolist (proc server-buffer-clients)
    (server-send-string proc "-error die")))

(defun shift-width (width)
  (interactive "n")
  (set-variable 'evil-shift-width width)
  (message "set shift width to %d" width))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package helm-swoop
  :ensure t
  :config
  (evil-leader/set-key "h" 'helm-swoop))


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

(define-key evil-motion-state-map "gr" 'go-to-reviewers)

(global-set-key (kbd "C-c v") 'pbpaste)

(provide 'ai-keys)
;;; ai-keys.el ends here
