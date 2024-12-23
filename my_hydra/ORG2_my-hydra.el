






(defhydra my-basic-hydra 
  (:color blue)
  "press ; again to coninue hydra"
  (";" (insert ";") :column "insert ;")
  ("q" nil "quit")
  ("s" (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2023/stuff_i_installed_at_work.org") "stuff_i_installed_at_work.org" :column "files" )
  ("i" (find-file "c:/Users/ahmadardie.r/my-own-lisp-files/init_28.el") "init_28.el")
  ("d"(find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2024/daily_java.org") "daily_java.org")
  ("r" my-open-general-zoho :column "zoho")
  ("v" my-open-vi-zoho :column "VI log")
  ("t" my-open-teams :column "teams")
  ("g" my-open-ge :column "ge")
  ("l" my-open-alteia-docs :column "alteia docs")
  ("a" my-open-alteia :column "alteia")
  ("y" my-open-yammer :column "yammer")
  ("p" my-open-password :column "password")
  ("m" my-run-macro :column "run macro")
  ("c" my-copy-password :column "copy password")
  )






;; (defvar my-mode-map (make-sparse-keymap)
;;   "Keymap for `my-mode'.")

;;;###autoload
(define-minor-mode my-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " my-mode"
  ;; :keymap '(((kbd "C-c ;") . #'my-basic-hydra/body))
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map
	      ;; (kbd "C-c ;")
	      (kbd "; ;")
	      'my-basic-hydra/body) map)
  )

;;;###autoload
(define-globalized-minor-mode global-my-mode my-mode my-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((my-mode . ,my-mode-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-my-mode ()
  "Turn off my-mode."
  (my-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-mode)

(provide 'my-mode)







;; (global-set-key (kbd "C-c ;") #'my-basic-hydra/body)






