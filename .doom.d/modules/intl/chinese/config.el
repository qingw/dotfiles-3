;;; intl/chinese/config.el  -*- lexical-binding: t; -*-

(def-package! cnfonts
  :when (display-graphic-p)
  :init (cnfonts-enable)
  :config
  (setq-default
   cnfonts-default-step 4
   cnfonts-directory (concat doom-etc-dir "cnfonts/")
   cnfonts-personal-fontnames
   '(
     ("Noto Mono" "Noto Sans" "Noto Serif")
     ("Hiragino Sans GB" "Source Han Sans SC" "Source Han Serif SC" "Noto Sans CJK SC" "Noto Sans Mono CJK SC" "Noto Serif CJK SC" "Sarasa Gothic SC" "Sarasa Mono T SC" "Sarasa UI SC" "Sarasa Mono SC")
     ("Hiragino Sans GB" "Source Han Sans SC" "Source Han Serif SC" "Noto Sans CJK SC" "Noto Sans Mono CJK SC" "Noto Serif CJK SC" "Sarasa Gothic SC" "Sarasa Mono T SC" "Sarasa UI SC" "Sarasa Mono SC")
     ))
  (map!
   :leader
   :prefix ("t" . "toggle")
   :desc "Increase Fontsize"  :n "+"  #'cnfonts-increase-fontsize
   :desc "Decrease Fontsize"  :n "-"  #'cnfonts-decrease-fontsize
   :desc "Reset Fontsize"     :n "0"  #'cnfonts-reset-fontsize))

(def-package! fcitx
  :config
  (when IS-LINUX
    (setq-default
     fcitx-use-dbus t))
  (setq-default
   fcitx-active-evil-states '(insert emacs hybrid))
  (fcitx-aggressive-setup))

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
   :desc "Lookup Dictionary"    :n "l"  #'youdao-dictionary-search-at-point))

(def-package! cal-china-x
  :config
  (setq-default
   mark-holidays-in-calendar t
   cal-china-x-important-holidays cal-china-x-chinese-holidays
   calendar-holidays
   (append
    cal-china-x-important-holidays
    cal-china-x-general-holidays)))
