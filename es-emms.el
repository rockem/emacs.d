;; EMMS 3.0

(add-to-list 'load-path (concat site-lisp-path "emms-3.0"))
(add-to-list 'exec-path "C:/mplayer/")
 
(require 'emms-setup)
(require 'emms-player-mplayer)
(require 'emms-playing-time)
(emms-standard)
(emms-default-players)
(emms-playing-time 1)
 
;; Show the current track each time EMMS
;; starts to play a track with "NP : "
(add-hook 'emms-player-started-hook 'emms-show)

;; When asked for emms-play-directory,
;; always start from this one 
(setq emms-info-functions '(emms-info-libtag)
 emms-source-file-default-directory "c:/MUSIC/"
 emms-mode-line-format " %s "
 emms-show-format "NP: %s")


(provide 'es-emms)