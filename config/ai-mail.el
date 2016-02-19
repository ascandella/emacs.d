(require 'mu4e)
;;; adapted from http://www.ict4g.net/adolfo/notes/2014/12/27/EmacsIMAP.html

(setq
 message-kill-buffer-on-exit t
 mu4e-maildir (substitute-in-file-name "$HOME/.maildir")
 mu4e-get-mail-command "/usr/local/bin/mbsync -a"

 mu4e-drafts-folder "/gmail/drafts"
 mu4e-sent-folder "/gmail/sent"
 mu4e-trash-folder "/gmail/trash"
 mu4e-sent-messages-behavior 'delete
 mu4e-update-interval 120
 mu4e-headers-skip-duplicates t
 mu4e-hide-index-messages t

 mu4e-view-prefer-html t
 mu4e-view-show-images t
 mu4e-use-fancy-chars t
 mu4e-html2text-command "/usr/local/bin/w3m -T text/html"

 user-mail-address "ai@uber.com"
 user-full-name "Aiden Scandella"
 )

; spell checking
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)


(add-to-list 'mu4e-bookmarks
	     '("flag:unread AND NOT flag:trashed AND date:today..now AND NOT maildir:/gmail/sent"
               "Today's unread messages"
               ?m))
(add-to-list 'mu4e-bookmarks
	     '("maildir:/gmail/inbox"
               "Inbox"
               ?i))
(add-to-list 'mu4e-bookmarks
            '("size:5M..500M"       "Big messages"     ?b))


;; sending mail
(setq
 message-send-mail-function 'message-send-mail-with-sendmail
 sendmail-program "/usr/local/bin/msmtp"
 message-sendmail-extra-arguments '("--read-envelope-from")
 message-sendmail-f-is-evil t
 )


(defun mu4e-view-is-below? ()
  "True if mu4e-view is displayed below the current buffer."
  (let ((window-below (window-in-direction 'below)))
    (and window-below
         (string= (buffer-name (window-buffer window-below)) "*mu4e-view*"))))

(with-eval-after-load "mu4e"
  (evil-make-overriding-map mu4e-main-mode-map 'normal t)
  (evil-define-key 'normal mu4e-main-mode-map
    "," nil ; Ensure my evil-leader key works unhindered.
    "j" nil ; originally "jump to maildir".
    "gl" 'mu4e~headers-jump-to-maildir)

  (evil-make-overriding-map mu4e-headers-mode-map 'normal t)
  (evil-define-key 'normal mu4e-headers-mode-map
    "j" 'evil-next-line
    "k" 'evil-previous-line
    "n" (lambda () (interactive) (if (mu4e-view-is-below?) (mu4e-headers-next) (mu4e-headers-view-message)))
    "p" (lambda () (interactive) (if (mu4e-view-is-below?) (mu4e-headers-prev) (mu4e-headers-view-message)))
    "#" 'mu4e-headers-mark-for-trash
    ;; "d" 'mu4e-view-mark-for-trash
    "y" 'mu4e-headers-mark-for-refile
    "/" 'mu4e-headers-search-edit
    "z" 'mu4e-headers-mark-for-unmark
    "gl" 'mu4e~headers-jump-to-maildir
    ;; consider calling this with t, for "no confirmation".
    "e" 'mu4e-mark-execute-all
    (kbd "RET") 'mu4e-headers-view-message
    "o" 'mu4e-headers-view-message
    "ESC" nil
    "a" 'mu4e-reply-all
    "r" 'mu4e-compose-reply
    ;; TODO(philc): mu4e-headers-toggle-full-search - show all results or just up until the cap.
    ;; TODO(philc): mu4e-view-action opens URL
    "f" 'mu4e-compose-forward
    ;; By default, run this in the background. Hit ";vv to show the buffer with the fetch status.
    (kbd "M-r") (lambda () (interactive) (mu4e-update-mail-and-index t))
    "c" 'mu4e-compose-new)

  (evil-make-overriding-map mu4e-view-mode-map 'normal t)
  (evil-define-key 'normal mu4e-view-mode-map
    "j" 'evil-next-line
    "k" 'evil-previous-line
    "n" 'mu4e-view-headers-next
    "p" 'mu4e-view-headers-prev
    "#" 'mu4e-view-mark-for-trash
    "d" 'mu4e-view-mark-for-trash
    "y" 'mu4e-view-mark-for-refile
    "/" 'mu4e-view-search-edit
    ;; "x" 'mu4e-view-mark-for-something
    "z" 'mu4e-view-mark-for-unmark
    "a" 'mu4e-compose-reply
    ;; Opens the URL under the cursor.
    (kbd "RET") (lambda () (interactive) (execute-kbd-macro (kbd "M-RET")))
    "go" nil
    "go1" (lambda () (interactive) (mu4e-view-go-to-url 1))
    "go2" (lambda () (interactive) (mu4e-view-go-to-url 2))
    "go3" (lambda () (interactive) (mu4e-view-go-to-url 3))
    "go4" (lambda () (interactive) (mu4e-view-go-to-url 4))
    "gl" (lambda ()
           (interactive)
           (switch-to-buffer-other-window "*mu4e-headers*")
           (call-interactively 'mu4e~headers-jump-to-maildir))
    ;; consider calling this with t, for "no confirmation".
    "e" 'mu4e-view-marked-execute
    (kbd "SPC") 'evil-ace-jump-word-mode
    "ESC" nil
    "a" 'mu4e-reply-all
    "r" 'mu4e-compose-reply
    "f" 'mu4e-compose-forward
    (kbd "M-r") '(lambda () (interactive) (mu4e-update-mail-and-index t))
    "c" 'mu4e-compose-new)

  (evil-leader/set-key-for-mode 'mu4e-headers-mode
    "vv" 'mu4e-show-fetch-progress)
  (evil-leader/set-key-for-mode 'mu4e-view-mode
    "vv" 'mu4e-show-fetch-progress
    "vr" 'mu4e-view-raw-message)

  (evil-make-overriding-map mu4e-compose-mode-map 'normal t)
  (evil-define-key 'normal mu4e-compose-mode-map
    "c" nil)
  (evil-leader/set-key-for-mode 'mu4e-compose-mode
    ;; Emacs always prompts me "Fix continuation lines?" when sending an email. I don't know what this prompt
    ;; means. It's in message-send-mail in message.el. Answer "y" automatically.
    "s" (lambda () (interactive) (util/without-confirmation 'message-send-and-exit))))

(evil-set-initial-state 'mu4e-mode 'normal)
(evil-set-initial-state 'mu4e-main-mode 'normal)
(evil-set-initial-state 'mu4e-headers-mode 'normal)
(evil-set-initial-state 'mu4e-view-mode 'normal)
(evil-set-initial-state 'mu4e-compose-mode 'normal)

(provide 'ai-mail)
