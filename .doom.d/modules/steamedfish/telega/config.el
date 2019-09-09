;;; steamedfish/telega/config.el -*- lexical-binding: t; -*-

(use-package! telega
  :commands (telega)
  :defer t
  :config
  (telega-mode-line-mode 1)
  (set-popup-rule! "^\\*Telega Root" :side 'left :size 0.2 :quit nil)
  (set-popup-rule! "^◀\\[.*@.*\\]" :side 'right :size 0.6 :quit nil))
