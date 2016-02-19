(defun kwm-reconfigure ()
  (interactive)
  (start-process "kwm" nil "pkill" "-f" "kwm"))

(provide 'ai-kwm)
