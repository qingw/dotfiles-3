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
