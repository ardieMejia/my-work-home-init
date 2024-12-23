
(defhydra my-fh-hydra
  (:color blue)
  "file hydra"
  (";" (insert ";") :column "insert ;")
  ("q" nil "quit")    
  ("s" my-open-work-diary "stuff_i_installed_at_work.org" :column "files" )
  ("i" my-open-init-28  "init_28.el")
  ("d" my-open-daily-java "daily_java.org")
  ("r" my-open-general-zoho :column "zoho")
  ("v" my-open-vi-zoho :column "VI log")
  ("t" my-open-teams :column "teams")
  ("g" my-open-ge :column "ge")
  ("l" my-open-alteia-docs :column "alteia docs")
  ("a" my-open-alteia :column "alteia")
  ("y" my-open-yammer :column "yammer")
  ("p" my-open-password :column "password")
  ("m" my-run-macro :column "run macro")
  ("." my-copy-hydra/body :column "copy hydras")
  )


(defhydra my-c-hydra 
  (:color blue)
  "copy hydra"
  ("." (insert ".") :column "insert .")
  ("q" nil "quit")    
  ("c" my-copy-password "copy word/passwords/etc.." :column "text copies")
  ("f" my-magik-copy-defun "copy magik method")
  ("l" my-copy-line "copy line")
  )








;;;###autoload
(define-minor-mode my-fh-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " my file hydra"
  ;; :keymap '(((kbd "C-c ;") . #'my-basic-hydra/body))
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map
	      ;; (kbd "C-c ;")
	      (kbd "; ;")
	      'my-fh-hydra/body) map))



;;;###autoload
(define-globalized-minor-mode global-my-fh-mode my-fh-mode my-fh-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((my-fh-mode . my-file-fh-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-my-fh-mode ()
  "Turn off my-mode."
  (my-fh-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-fh-mode)

(provide 'my-fh-mode)



;;;###autoload
(define-minor-mode my-c-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " my file hydra"
  ;; :keymap '(((kbd "C-c ;") . #'my-basic-hydra/body))
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map
	      ;; (kbd "C-c ;")
	      (kbd "; .")
	      'my-c-hydra/body) map))



;;;###autoload
(define-globalized-minor-mode global-my-c-mode my-c-mode my-c-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((my-c-mode . my-c-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-my-c-mode ()
  "Turn off my-c-mode."
  (my-c-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-c-mode)

(provide 'my-c-mode)










