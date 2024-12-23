(defun my-mode-line-magik()
  (interactive)
(force-mode-line-update)

  (setq mode-line-format
	'(
	  (:eval 
	   ;; (if (buffer-read-only)
	   ;;     (propertize "Re" 'face 'shr-h1)
	   ;;   (propertize "Wr" 'face 'shr-h1))
	   (if buffer-read-only
	       (propertize "Re " 'face 'outline-2)
	     (propertize "Wr " 'face 'outline-1)
	     )
	   
	   )
	   
	  (:eval (propertize "%05b " 'face
		  (if (buffer-modified-p)
		      'org-mode-line-clock-overrun
		    'diff-refine-added)))
	  ;; (:eval (propertize "%f " 'face 'shr-h1))
	  (:eval (propertize
		  (if (string-match "\/\/" default-directory)
		       (car (nthcdr 2
				    (split-string default-directory "/")
				    ))
		    default-directory	    
		    )
		  'face 'shr-h1))

	  )
	
	  ))

(add-hook 'magik-mode-hook 'my-mode-line-magik)
