;;; steamedfish/chinese/config.el  -*- lexical-binding: t; -*-

(def-package! youdao-dictionary
  :config
  (setq-default
   url-automatic-caching t
   youdao-dictionary-search-history-file (concat doom-cache-dir "youdao.cache")
   youdao-dictionary-use-chinese-word-segmentation t)
  (map!
   :map youdao-dictionary-mode-map
   :n "q" #'quit-window
   :n "p" #'youdao-dictionary-play-voice-of-current-word
   :n "y" #'youdao-dictionary-play-voice-at-point
   :leader
   :prefix ("h" . "help")
   :desc "Lookup Dictionary"    :n "l"  #'youdao-dictionary-search-at-point-tooltip))

(def-package! cal-china-x
  :config
  (setq-default
   mark-holidays-in-calendar t
   cal-china-x-important-holidays cal-china-x-chinese-holidays
   calendar-holidays
   (append
    cal-china-x-important-holidays
    cal-china-x-general-holidays)))
