
(defun my-grep-collective()
  "this function took forever to solve, wow, a source of personal pride"
  (interactive)
  (let (
	(pattern (read-from-minibuffer "enter the pattern, no regexp, simple"))
	(fileExtension (read-from-minibuffer "enter file extension, no * or ."))
	)
    (compilation-start  (concat  "findstr /I /S /C:\"" pattern "\" *"  fileExtension ) 'grep-mode)))

;; ====================






(defun my-add-nonascii-highlighting ()
  (interactive)
  (font-lock-add-keywords 'grep-mode
                          '(("^.*magik:" . 'font-lock-function-name-face))))




(add-hook 'grep-mode-hook #'my-add-nonascii-highlighting)

(global-set-key (kbd "C-c m g") 'my-grep-collective)



;; ;; ============================== text search functionality replacement AND practice
;; ;; E:/cygwin/bin/find.exe . -iname `"*org`" -print0 | E:/cygwin/bin/xargs.exe -0 E:/cygwin/bin/grep.exe -i asic
;; (defun my-grep-collective ()
;;   "this function took forever to solve, wow, a source of personal pride"
;;   (interactive)
;;   (let (
;;         (pattern (read-from-minibuffer "enter the pattern, no regexp, simple"))
;;         (fileExtension (read-from-minibuffer "enter file extension, no * or ."))
;; 	)
;;     (compilation-start  (concat  "e:/cygwin/bin/grep.exe " pattern " -r  . --include \"\*"  fileExtension "\"") 'grep-mode) 
;;     )
;;   )

;; (global-set-key (kbd "C-c m g") 'my-grep-collective)




(defun my-find-collective ()
  "a find version of my-grep-collective"
  (interactive)
  (let (
        (pattern (read-from-minibuffer "enter the filename, simple regexp, like *sOmEnAmE*"))
	)
    (compilation-start  (concat  "e:/cygwin/bin/find.exe . -iname " pattern ) 'grep-mode) 
    )
  )

(global-set-key (kbd "C-c m f") 'my-find-collective)



;; ========== I hope this one works, error?
(fset 'yes-or-no-p 'y-or-n-p)

;; ========== overwrites some other very unused key binding tmm-menubar
(global-set-key (kbd "C-`") 'other-frame)
(global-set-key (kbd "M-`") 'other-window)



;; ========== both of these are built in with most Emacs, odl and new
(global-set-key (kbd "C-c h") 'hide-entry) 

(global-set-key (kbd "C-c s") 'show-entry) 



;; ========== get the file as path ==========
(defun my-copy-directory ()
  "get current directory into clipboard"
  (interactive)
  (kill-new default-directory)
  (print default-directory)
  )

(global-set-key (kbd "C-c m , d") 'my-copy-directory)



;; ========== select line ==========

;; (defun my-mark-line ()
;;   (interactive)
;;   "my own mark lien"
;;   (move-beginning-of-line 1)
;;   (set-mark (point))
;;   (move-end-of-line 1))

;; (global-set-key (kbd "C-c l") 'mark-line)


(defun my-mark-line ()
  (interactive)
  "my own mark lien"
  (if mark-active
      (progn
	(next-line)      
	(move-end-of-line 1))
    (progn
      (move-beginning-of-line 1)
      (set-mark (point))
      (move-end-of-line 1))))



(global-set-key (kbd "C-c l") 'my-mark-line)

;; ;; ========== select line ==========
;; (defun my-mark-eat-line ()
;;   (interactive)
;;   "my own mark lien"
;;   (if mark-active
;;       (progn (next-line)      
;;        (move-end-of-line 1))
;;     )
;;   )


  





;; ========== kill line ==========
(defun my-kill ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (kill-line))

(global-set-key (kbd "C-c k") 'my-kill)













;; ========== save and export ==========
(defun my-save-org-and-export ()
  (interactive)
  "super lazy org mode export"
  (save-buffer)
  (org-html-export-to-html)
  )










;; ========== annoying RPS ==========
(defun my-open-general-zoho ()
  (interactive)
  "mostly Im just super lazy this shit, when Emacs provides many shortcuts"
  (org-open-link-from-string "https://projects.zoho.com/portal/redplanet0#mywork"))

;; (global-set-key (kbd "C-c r") 'my-open-rps-zoho)
(global-set-key (kbd "C-c m o r") 'my-open-general-zoho)



;; ========== annoying VI Zoho ==========
(defun my-open-vi-zoho()
  (interactive)
  (org-open-link-from-string "https://projects.zoho.com/portal/redplanet0/#dashboard/1234245000000345005"))

;; (global-set-key (kbd "C-c r") 'my-open-rps-zoho)
(global-set-key (kbd "C-c m o v") 'my-open-vi-zoho)



;; ========== annoying Teams ==========
(defun my-open-teams ()
  (interactive)
  (org-open-link-from-string "https://teams.microsoft.com/_#"))

;; (global-set-key (kbd "C-c t") 'my-open-teams)
(global-set-key (kbd "C-c m o t") 'my-open-teams)


;; ========== annoying GE Documentation ==========
(defun my-open-ge ()
  (interactive)
  (org-open-link-from-string "https://smallworld.gedigitalenergy.com/documentation"))

(global-set-key (kbd "C-c m o g") 'my-open-ge)








;; (defun my-copy-password()
;;   (interactive)
;;   "copy our password"
;;   (let (p1 p2)
;;     (save-excursion
;;       (skip-chars-backward "$-_.a-zA-Z0-9")
;;       (setq p1 (point))
;;       (skip-chars-forward "$-_.a-zA-Z0-9")
;;       (setq p2 (point))
;;       (print (kill-new  (buffer-substring-no-properties p1 p2)))
;;     )
;;     )
;;   )

(defun my-copy-password()
  (interactive)
  "copy our password"
  (let (p1 p2)
    (save-excursion

      (goto-char  (re-search-backward "[()[:blank:]\n]"))
      ;; notice that  anything isnide the [] means any of theh character, and [:blank:] can be treated as a single character
      ;; (search-forward-regexp "=[[:blank:]\n]*")
      (right-char 1)
      (setq p1 (point))
      ;; (goto-char (search-forward-regexp "[()[:blank:]\n]"))
      (goto-char (re-search-forward "[()[:blank:]\n]"))
      (left-char)
      (setq p2 (point))
      (print (kill-new  (buffer-substring-no-properties p1 p2))))))
  


(defun my-copy-line()
  (interactive)
  "copy our password"
  (let (p1 p2)
    (save-excursion

      (goto-char  (re-search-backward "^"))
      ;; notice that  anything isnide the [] means any of theh character, and [:blank:] can be treated as a single character
      ;; (search-forward-regexp "=[[:blank:]\n]*")
      (setq p1 (point))
      ;; (goto-char (search-forward-regexp "[()[:blank:]\n]"))
      (goto-char (re-search-forward "$"))
      (setq p2 (point))
      (print (kill-new  (buffer-substring-no-properties p1 p2))))))




;; ========== annoying alteia Documentation ==========
(defun my-open-alteia ()
  (interactive)
  "alteia main site"
  (org-open-link-from-string  "https://ge-visint.com/login"))

(global-set-key (kbd "C-c m o a") 'my-open-alteia)



;; ========== my previous buffer ==========
(setq my-prev-buff-name "*scratch*")
(defun my-previous-buffer ()
  (interactive)
  "my previous buffer "
  ;; (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2023/stuff_i_installed_at_work.org"))
  ;; (save-excursion
  ;;     (switch-to-buffer (car (nthcdr 1 buffer-name-history)))
  ;;   )
  (switch-to-buffer (other-buffer))
  )
;; no global binding


;; ========== open work diary ==========
(defun my-open-work-diary ()
  (interactive)
  "my work diary"
   (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2023/stuff_i_installed_at_work.org"))
;; no global binding

;; ========== open work diary ==========
(defun my-open-transient-todo ()
  (interactive)
  "my transient to-do"
   (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/transient.org"))
;; no global binding


;; ========== open init 28 file ==========
(defun my-open-init-28 ()
  (interactive)
  "my init 28 file"
  (find-file "c:/Users/ahmadardie.r/my-own-lisp-files/init_28.el"))
;; no global binding



;; ========== open daily java ==========
(defun my-open-daily-java ()
  (interactive)
  "my daily java"
  (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2024/daily_java.org"))
;; no global binding




 (find-file "c:/Users/ahmadardie.r/Documents/shared_emacs/my-org-files/misc/2023/stuff_i_installed_at_work.org")

;; ========== annoying alteia Documentation ==========
(defun my-open-alteia-docs ()
  (interactive)
  "alteia documentation"
  (org-open-link-from-string "https://help.alteia.com/welcome-to-alteia"))

(global-set-key (kbd "C-c m o l") 'my-open-alteia-docs)


;; ========== open init 28 file ==========
(defun my-open-word-convert ()
  (interactive)
  "word-html-to-word"
  (org-link-open-from-string "https://products.aspose.app/words/conversion/html-to-word"))
;; no global binding


;; ========== annoying alteia Yammer ==========
(defun my-open-yammer ()
  (interactive)
  "yammer"
  (org-open-link-from-string "https://web.yammer.com/main/org/redplanet.com.my"))


(global-set-key (kbd "C-c m o y") 'my-open-yammer)



;; ========== annoying alteia Yammer ==========
(defun my-open-password ()
  (interactive)
  "password alteia and such"
  (find-file "c:/Users/ahmadardie.r/Documents/my-trash/passwords/visual_intelligence_platform.org"))

(global-set-key (kbd "C-c m o p") 'my-open-password)




;; ========== occasional claim forms ==========
(defun my-open-claims ()
  (interactive)
  "Modified from the original code where he can open multiple files, I just open one file
URL `http://xahlee.info/emacs/emacs/emacs_dired_open_file_in_ext_apps.html'"

  

  (start-process "my open in external app"  (get-buffer-create "*my open in default app*") "PowerShell" "-Command" "Invoke-Item" "-LiteralPath" "C:/Users/ahmadardie.r/Documents/my-trash/RPS_forms/RPS_claim_form_2.xlsx")
  )

(global-set-key (kbd "C-c m o c") 'my-open-claims)




 


(defun my-move-buffer ()
  (interactive)
  (let ((my-move-buffer-dir "c:/Users/ahmadardie.r/Downloads/move_buffer_folder/"))
  (dolist (item (directory-files "c:/Users/ahmadardie.r/Downloads/move_buffer_folder/"))
    (progn 
      (if (and (not (string= item "..")) (not (string= item ".")))
	  (if (y-or-n-p (concat "Are you sure you want to move the file? --> " item))(rename-file (concat my-move-buffer-dir item ) default-directory))
	(print "hello")
	)))))










;; ==================== yafolding ====================

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))






;; ==================== dired ====================

(require 'dired-single)

(setq dired-single-use-magic-buffer t)
(setq dired-single-magic-buffer-name "my-dired")

(put 'dired-find-alternate-file 'disabled nil)

(defun ardie-dired-up ()
  (interactive)
  (define-key dired-mode-map (kbd "^") 
		  (lambda ()
		    (interactive)
		    (find-alternate-file ".."))))

(add-hook 'dired-mode-hook 'ardie-dired-up)



(global-set-key (kbd "C-x d") 'dired-single-magic-buffer)




;; these 2 functions might be bad idea
(defun ardie-vertico-marginalia-prescient ()
  (interactive)
  "activate my fancy cololored vert-marg-presc"
  ;; ===== vertico marginalia
  (ivy-mode 0)
  (vertico-mode 1)
  (marginalia-mode 1)

  ;; =================== prescient mode!!!!
  (ivy-prescient-mode 0)
  (vertico-prescient-mode 1)
  (ivy-posframe-mode 0))


;; these 2 functions might be bad idea
(defun ardie-ivy ()
  (interactive)
  "activate my fancy cololored vert-marg-presc"
  ;; ===== vertico marginalia
  (vertico-mode 0)
  (marginalia-mode 0)

  ;; =================== prescient mode!!!!
  (vertico-prescient-mode 0)
  (ivy-mode 1)
  (ivy-prescient-mode 1)
  (load-file "~/.config/emacs/individual/ivy-posframe.el")
  (ivy-posframe-mode 1))




(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))




;; ==================== for visibilitywhen we're playing many apps
;; ==================== we better put this in our own function
;; ==================== we have too many functions already, we need too pick an easily remembered name




;; ++++++++++++++++++++   for red frame



;; ==========  later we make this hydra for this
(defun my-magik-copy-defun ()
  (interactive)
  (let (p1 p2)
    (save-excursion
      (re-search-backward (cdr (assoc "method" magik-regexp)))
      (setq p1 (point))
      (re-search-forward (cdr (assoc "endmethod" magik-regexp)))
      (setq p2 (point))
      (print (kill-new  (buffer-substring-no-properties p1 p2)))))
  )

(global-set-key (kbd "C-c f") 'my-magik-copy-defun)





(defun my-emacs-writer ()
  (interactive)
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    ;; ----- previous value "Ioevka"
    (set-face-attribute (car face) nil :font "Jost" :weight 'medium :height (cdr face)))
  
  ;; ----- becoz we cant decide what we need for org-mode, our org is still ugly
  (set-face-attribute 'org-level-1 nil :font "Georgia" :weight 'medium :height 1.7 :foreground "LemonChiffon4")
  (set-face-attribute 'org-level-2 nil :font "Georgia" :weight 'medium :height 1.4)
  (set-face-attribute 'org-level-3 nil :font "Georgia" :weight 'medium :height 1.2)
  (set-face-attribute 'org-level-4 nil :font "Georgia" :weight 'medium :height 1.2)
  
  (set-frame-parameter (selected-frame) 'internal-border-width 0)
  (set-frame-parameter (selected-frame) 'left-fringe 40)
  (set-frame-parameter (selected-frame) 'right-fringe 40)
  (set-face-background 'fringe "purple1")
  (set-background-color "LemonChiffon"))


(defun my-emacs-mute ()
  (interactive)
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    ;; ----- previous value "Ioevka"
    (set-face-attribute (car face) nil :font "Arial" :weight 'medium :height (cdr face)))
  
  ;; ----- becoz we cant decide what we need for org-mode, our org is still ugly
  (set-face-attribute 'org-level-1 nil :font "Georgia" :weight 'medium :height 1.7 :foreground "LemonChiffon4")
  (set-face-attribute 'org-level-2 nil :font "Georgia" :weight 'medium :height 1.4)
  (set-face-attribute 'org-level-3 nil :font "Georgia" :weight 'medium :height 1.2)
  (set-face-attribute 'org-level-4 nil :font "Georgia" :weight 'medium :height 1.2)
  
  (set-frame-parameter (selected-frame) 'internal-border-width 0)
  (set-frame-parameter (selected-frame) 'left-fringe 25)
  (set-frame-parameter (selected-frame) 'right-fringe 25)
  (set-face-background 'fringe "aquamarine1")
  (set-background-color "LightCyan1"))




(defun my-emacs-session ()
  (interactive)
  (set-frame-parameter (selected-frame) 'left-fringe 0)
  (set-frame-parameter (selected-frame) 'right-fringe 0)
  (set-background-color "PowderBlue"))



(defun my-emacs-life ()
  (interactive)
  
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    ;; ----- previous value "Ioevka"
    (set-face-attribute (car face) nil :font "Jost" :weight 'medium :height (cdr face)))
  
  ;; ----- becoz we cant decide what we need for org-mode, our org is still ugly
  (set-face-attribute 'org-level-1 nil :font "Agency FB" :weight 'medium :height 2.2 :foreground "VioletRed4")
  (set-face-attribute 'org-level-2 nil :font "Agency FB" :weight 'medium :height 1.4 :foreground "DodgerBlue1")
  (set-face-attribute 'org-level-3 nil :font "Garamond" :weight 'medium :height 1.3 :foreground "VioletRed4")
  (set-face-attribute 'org-level-4 nil :font "Arial" :weight 'medium :height 1.1  :foreground "DodgerBlue1")
  
  (set-frame-parameter (selected-frame) 'internal-border-width 0)
  (set-frame-parameter (selected-frame) 'left-fringe 40)
  (set-frame-parameter (selected-frame) 'right-fringe 40)
  (set-face-background 'fringe "DarkOliveGreen3")
  (set-background-color "DarkSeaGreen1"))




(defun my-org-export-after-css()
  (interactive)
  (save-buffer)
  (other-window 1)
  (org-html-export-to-html))

(global-set-key (kbd "C-c m o h ") `my-org-export-after-css)







;; https://emacs.stackexchange.com/questions/45895/changing-faces-one-at-a-time-outside-customize
;; https://emacs.stackexchange.com/questions/74181/how-do-i-get-foreground-and-background-colors-of-a-face
 ;; this one very importaant!! write it down
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Faces.html
;; (setq my-symbol-numvar '("fringe" "LightGoldernRod2" "DarkOliveGreen2"))
;; ========== new stuff
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Buffer-Contents.html#index-filter_002dbuffer_002dsubstring-2827
;; https://dev.to/rajasegar/5-ways-to-get-text-from-an-emacs-buffer-4c3l
;; ========== new stuff
(setq my-symbol-numvar '("fringe" "hi-green" "mouse-drag-and-drop-region" "hi-aquamarine" "show-paren-match" "diff-indicator-removed" "hi-salmon" ))
(defun my-symbol ()
  (interactive)
  (setq my-symbol-numvar (append (cdr my-symbol-numvar)  (list (pop my-symbol-numvar))))
  (setq var1 (buffer-substring-no-properties  (region-beginning) (region-end)))
  (setq var2 (string-replace ":" "" var1))
  (highlight-phrase var2 (car my-symbol-numvar)))

(global-set-key (kbd "C-c y") 'my-symbol)





(defun my-unsymbol ()
  (interactive)
  ;; (thing-at-point 'word 'no-properties)
  (setq var1 (buffer-substring-no-properties  (region-beginning) (region-end)))
  (setq var2 (string-replace ":" "" var1))
  (unhighlight-regexp var2)
)

(global-set-key (kbd "C-c u") 'my-unsymbol)
