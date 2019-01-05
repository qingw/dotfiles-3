;;; intl/chinese/config.el  -*- lexical-binding: t; -*-

(when (display-graphic-p)
  (def-package! cnfonts
    :commands
    (cnfonts-enable)))

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
   youdao-dictionary-use-chinese-word-segmentation t))
