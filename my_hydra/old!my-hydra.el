

(defhydra my-basic-hydra/inside (:color blue)
  "
Basic Hydra
"
  (";" (insert ";") :column "insert ;")
  ("s" (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2023/stuff_i_installed_at_work.org") :column "stuff_i_installed_at_work.org")
  ("i" (find-file "c:/Users/ahmadardie.r/my-own-lisp-files/init_28.el") :column "init_28.el")
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
  ("d" my-java-daily :column "java attempt")
  )


;; (defhydra my-basic-hydra/magik (:color blue)
;;   "
;; Magik Hydra
;; "
  
;;   ("." (my-leave-unleave-mark) :column "my leave mark")
;;     )


(defhydra my-basic-hydra (:color blue)
  "press ; again to coninue hydra"
  (";" my-basic-hydra/inside/body "basic hydra")
  ;; ("." my-basic-hydra/magik/body "magik hydra")
  )
(global-set-key (kbd ";") 'my-basic-hydra/body)



;; ====================

(defhydra my-nav-hydra/inside (:color green)
  "
Navigation Hydra
"
  ("`" (insert "`") :column "insert `")
  ("s" my-save-org-and-export  :column "save org and export")
  )

(defhydra my-nav-hydra (:color green)
  "press ` again to continue hydra"
  ("`" my-nav-hydra/inside/body "navigation hydra"))
(global-set-key (kbd "`") 'my-nav-hydra/body)








