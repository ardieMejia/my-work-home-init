(setq my-list-org-sound '(
			  "C:/Users/ahmadardie.r/Desktop/org-clock/chorded_sound_effect2.mp3"
			  "C:/Users/ahmadardie.r/Desktop/org-clock/beeping.wav"
			  "C:/Users/ahmadardie.r/Desktop/org-clock/chorded_sound_effect2.mp3"
			  "C:/Users/ahmadardie.r/Desktop/org-clock/Netflix-Intro-Sound-Effect2.mp3"
			  "C:/Users/ahmadardie.r/Desktop/org-clock/piano2.mp3"
			  "C:/Users/ahmadardie.r/Desktop/org-clock/Samsung-Whistle2.mp3"
			  "C:/Users/ahmadardie.r/Desktop/org-clock/scriabin_piano_etude2.mp3"
			  ))


(defun my-org-sound-randomizer ()
  (interactive)
  (let ((my-n (1- (random (length my-list-org-sound)))))
    (setq org-clock-sound (car (nthcdr my-n my-list-org-sound)))
    )  
  )

