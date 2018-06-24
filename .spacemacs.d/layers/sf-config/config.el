(eval-after-load "fcitx"
  '(progn
    (setq fcitx-active-evil-states '(insert emacs hybrid))
    (fcitx-aggressive-setup)
    (fcitx-prefix-keys-add "M-m")))
