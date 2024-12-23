(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; https://www.sandeepnambiar.com/my-minimal-emacs-setup/



;; save history between sessions. Useful for magik-session
(savehist-mode 1)


;; auto-save when moving to a different app


;; ========== removing menu bars, and non-blinking cursor
(menu-bar-mode 1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)







;; ========== highlight
;; (global-hl-line-mode +1)

;; ========== no splash screen
(setq inhibit-startup-screen t)


;; ========== save session
(desktop-save-mode 1)


;; ========== 
(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))





;; ========== batt_reminder
(defun my-battery-reminder ()
  (interactive)
  (print "change your battery!!"))

(global-set-key (kbd "C-\\") 'my-battery-reminder)
;; ========== batt_reminder

(require 'ox-publish)


(load-file "~/.config/emacs/my_templates.el")
(load-file "~/.config/emacs/my_present/init_present.el")
(load-file "~/.config/emacs/my_hydra/my-hydra.el")
(load-file "~/.config/emacs/my_python/init_python.el")
(load-file "~/.config/emacs/my-modeline/my-modeline.el")
(load-file "~/.config/emacs/my_org_settings/my-sound.el")



;; * TODO ========== create  our  own minor mode by adding more functions in the keymap
;; (load-file  "~/my-own-lisp-files/my_minor_modes/my_minor_mode.el")




;; ===== https://www.emacswiki.org/emacs/SetFonts


;; my favourite font for most work
;; (set-face-attribute 'default nil :font "Source Code Pro" :weight 'regular)
;; (set-face-attribute 'default nil :font "Source Code Pro 12" :weight 'regular)



;; my favourite font for teaching and coding is Iosevka
;; https://curiousprogrammer.wordpress.com/2009/06/08/error-handling-in-emacs-lisp/
(condition-case xe
    (set-face-attribute 'default nil :font "Iosevka" :weight 'regular)
  ('error (progn (set-face-attribute 'default nil :font "Georgia" :weight 'regular)  "Iosevka failed, loading Georgia")))






















(setq backup-directory-alist '(("." . "~/Documents/my-trash/emacs_backup_files")))


;; ===== add to load-path

;; (add-to-list 'load-path "~/my-manual-load28")





(visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)


(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("m" . "src magik"))
(add-to-list 'org-structure-template-alist '("el" . "src lisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src html"))
(add-to-list 'org-structure-template-alist '("p" . "src python"))
(add-to-list 'org-structure-template-alist '("ps" . "src powershell"))
(add-to-list 'org-structure-template-alist '("sc" . "src scheme"))
(add-to-list 'org-structure-template-alist '("ss" . "src shell"))
(add-to-list 'org-structure-template-alist '("j" . "src java"))
(add-to-list 'org-structure-template-alist '("sq" . "src sql"))
(add-to-list 'org-structure-template-alist '("x" . "src xml"))

;; (pop org-structure-template-alist)



(setq org-startup-folded t)




























;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages '(marginalia vertico use-package)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )


;; ===== https://www.emacswiki.org/emacs/RecentFiles
;; new shortcut, different from my home setup
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 300)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(setq recentf-menu-filter "recentf-sort-ascending")



(run-at-time nil (* 5 60) 'recentf-save-list)
(run-at-time nil (* 5 600) 'my-org-sound-randomizer)

 
;; ===== https://github.com/magnars/multiple-cursors.el
;; multiple cursor same setup

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)




;; =====
(setq dired-dwim-target t)


;; ===== org super star
(load-file "C:/Users/ahmadardie.r/.config/emacs/my_org_safe/org-superstar.el")
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))




;; ========== we are currently not using these
;; ===== repoint find command to Git's find.exe
;; (setq find-program "\"C:\\Program Files\\Git\\usr\\bin\\find.exe\"")

;; ===== repoint find command to Git's find.exe
;; (setq grep-program "\"C:\\Program Files\\Git\\usr\\bin\\grep.exe\"")
;; ========== we are currently not using these





;; ==================================================
;; ==================== LOOKS ====================
;; ==================================================
;; ===== system crafters org presentation
;; fonts to try
;; Iosevka, JuliaMono-10, Jost, Source Code Pro
;; Jost https://fonts.google.com/specimen/Jost

;; (require 'org-faces)



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
(set-face-attribute 'org-level-1 nil :font "Jost ExtraBold" :weight 'medium :height 1.6)
(set-face-attribute 'org-level-2 nil :font "Jost SemiBold" :weight 'medium :height 1.4)
(set-face-attribute 'org-level-3 nil :font "Jost SemiBold Italic" :weight 'medium :height 1.2)
(set-face-attribute 'org-level-4 nil :font "Jost" :weight 'medium :height 1.2)


;; ----- Im sure theres better way to do this. That dolist example was quite cool
(set-face-attribute 'org-block nil :font "Iosevka" :weight 'medium :height 1.0)
(set-face-attribute 'org-block-begin-line nil :font "Iosevka" :slant 'italic :weight 'medium :height 1.0 :background "lightgray")
(set-face-attribute 'org-block-end-line nil :font "Iosevka" :slant 'italic :weight 'medium :height 1.0)





;; ===== we got it from this source

;; ===== we can also change through the context of frame by changing this variable, but thats mostly for new frames

;; (set-face-attribute 'default nil :font "JuliaMono-10" :height 100 :weight 'semi-bold)
;; (set-frame-font "JuliaMono" nil t)

;; ========== damn...

;; (set-frame-font "Source Code Pro SemiBold" nil t)

;; ==================================================
;; ==================== LOOKS ====================
;; ==================================================



;; (autoload ' "~/my-trash/elispPractice_autoload/second.el")
(load-file "~/.config/emacs/my_navigation/init_navigation.el")

;; ================================================== MAGIK

(use-package magik-mode
  :ensure t
  :config
  (magik-global-bindings)
  (magik-menu-set-menus))

;; ==================================================
;; ==================== ORGS  ====================
;; ==================================================

;; ===== org tempo
;; (load-file "C:\Users\ahmadardie.r\.config\emacs\my_org_safe\org-superstar.el")
;; (require 'org-superstar)
;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))


(require 'org-tempo)



;; ==================================================
;; ==================== ORGS  ====================
;; ==================================================










;; ===== from: https://www.reddit.com/r/emacs/comments/14q399t/hi_out_of_curiosity_what_are_your_favourite_fonts/
;; ================================================== minibuffer remaps :weight variables from 'bold to 'normal for example
;; we can later try this exmaple for current buffer if we want

(dolist (buffer (list " *Minibuf-0*" " *Echo Area 0*"
                      " *Minibuf-1*" " *Echo Area 1*"))
  (when (get-buffer buffer)
    (with-current-buffer buffer
      (face-remap-add-relative 'bold :weight 'normal)
      (face-remap-add-relative 'default :weight 'light))))

(add-hook 'minibuffer-setup-hook
          '(lambda()
             (face-remap-add-relative 'bold :weight 'normal)
             (face-remap-add-relative 'default :weight 'light)))



;; ==================================================
;; ==================== cool navigation shortcuts ====================
;; ==================================================



(defun my-magik-practice ()
  (interactive)
  (let ((continue (y-or-n-p (concat "Do you want to create a new magik practice under the current directory?" "c:/Users/ahmadardie.r/Documents/my-trash/magik_practice/" ))))
    (if continue
	(dired-create-directory (concat "c:/Users/ahmadardie.r/Documents/my-trash/magik_practice/" (format-time-string "%Y-%m-%d_at_%Hhours")))
      )
    )
  )


(defun my-magik-apropos ()
  (interactive)
  (let ((my-name (read-string "hello there")))
    (insert 
     (concat ".apropos(\"" my-name "\")"))))


(global-set-key (kbd "C-c p") 'my-magik-apropos)


(defun clean-url-ge()
  (interactive)
  (progn	
    (goto-line 1)
    (replace-string "%257C" "-")
    (goto-line 1)
    (replace-string "%2520" "_")))

;; ===== xah lee open folder of current file or dired
(defun  my-show-in-desktop ()
  "Show current file in desktop. Inspired by Xah Lee
 (Mac Finder, File Explorer, Linux file manager)
This command can be called when in a file buffer or in `dired'.

URL `http://xahlee.info/emacs/emacs/emacs_dired_open_file_in_ext_apps.html'
Version: 2020-11-20 2022-04-20 2022-08-19"
  (interactive)
  (let (($path (if (eq major-mode 'dired-mode)
                   (if (eq nil (dired-get-marked-files))
                       default-directory
                     (car (dired-get-marked-files)))
                 (if buffer-file-name buffer-file-name default-directory))))
    (cond
     ((string-equal system-type "windows-nt")
      (shell-command (format "PowerShell -Command invoke-item '%s'" (expand-file-name default-directory )))
      )
     )))


(global-set-key (kbd "C-c m s d") 'my-show-in-desktop)






(defun my-copy-directory ()
  "get current directory into clipboard"
  (interactive)
  (kill-new default-directory)
  )

(global-set-key (kbd "C-c m , d") 'my-copy-directory)











;; ==================== Python shell interpreter

;; (setq python-shell-interpreter "C:/Program Files/Python38/python")







;; ================================================== all-the-icons

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))



(all-the-icons-completion-mode)





















;; ================================================== magik session variables


;; functions are first class citizens


(defun my-magik-session()
  "my magik session instead of magik-session"
  (interactive)
  (magik-session "*my-gis*" "runalias eo_open -login root")
  (set-window-dedicated-p (selected-window) t)
  (process-send-string (barf-if-no-gis) "sw_app << smallworld_product.application(:sweo_dm_user)\n")
  (process-send-string (barf-if-no-gis) "pl_map << sw_app.plugin(:maps)\n")
  )

(global-set-key (kbd "C-c m m 1") 'my-magik-session)


;; GIS adapter
(defun my-magik-session-cim()
  "my magik session instead of magik-session"
  (interactive)
  (magik-session "*my-gis*" "runalias eo_cim_open -login root")
  (set-window-dedicated-p (selected-window) t)
  (process-send-string (barf-if-no-gis) "sw_app << smallworld_product.application(:sweo_dm_user)\n")
  (process-send-string (barf-if-no-gis) "pl_map << sw_app.plugin(:maps)\n")
  )

(global-set-key (kbd "C-c m m c") 'my-magik-session-cim)



;; ==================== not sure if we actually need this function
;; ==================== if its not finished, we delete this section

(defun my-magik-transmit-buffer ()
  "my own magik transmit buffer"
  (interactive)
  (let ((short-file-name (car (last (split-string (car (split-string buffer-file-name "\\.magik")) "/")))))
    (print short-file-name)
    (process-send-string (barf-if-no-gis) (concat "remex(:" short-file-name  ")\n"))
    (magik-transmit-buffer)))



;; ================================================== we can add hooks at the complete end, maybe next time

(add-hook 'powershell-mode-hook 'electric-pair-mode)
(add-hook 'org-mode-hook 'electric-pair-mode)
(add-hook 'emacs-lisp-mode-hook 'electric-pair-mode)
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
;; DELETE ----- (add-hook 'org-mode-hook 'my-mode)






















;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))




