;;; intl/chinese/config.el  -*- lexical-binding: t; -*-

(when (display-graphic-p)
  (def-package! cnfonts
    :commands
    (cnfonts-enable)
    :config
    (setq-default
     cnfonts-default-step 4
     cnfonts-directory (concat doom-etc-dir "cnfonts/")
     cnfonts-personal-fontnames
     '(
       ("Noto Mono" "Noto Sans" "Noto Serif")
       ("Hiragino Sans GB" "Source Han Sans SC" "Source Han Serif SC" "Noto Sans CJK SC" "Noto Sans Mono CJK SC" "Noto Serif CJK SC" "Sarasa Gothic SC" "Sarasa Mono T SC" "Sarasa UI SC" "Sarasa Mono SC")
       ("Hiragino Sans GB" "Source Han Sans SC" "Source Han Serif SC" "Noto Sans CJK SC" "Noto Sans Mono CJK SC" "Noto Serif CJK SC" "Sarasa Gothic SC" "Sarasa Mono T SC" "Sarasa UI SC" "Sarasa Mono SC")
       ))))

(def-package! fcitx
  :config
  (setq-default
   fcitx-active-evil-states '(insert emacs hybrid))
  :commands
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
   :n "y" #'youdao-dictionary-play-voice-at-point))
