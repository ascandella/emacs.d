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
 mu4e-update-interval 300

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


(provide 'ai-mail)
