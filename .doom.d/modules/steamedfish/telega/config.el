;;; steamedfish/telega/config.el -*- lexical-binding: t; -*-

;; copied from https://github.com/sarg/dotfiles/
(use-package! telega
  :commands (telega)
  :defer t
  :hook (telega-chat-mode . doom-mark-buffer-as-real-h)
  :config
  (telega-mode-line-mode 1)
  (set-popup-rule! "^\\*Telega Root" :side 'left :size 0.2 :quit nil :select t)
  (set-popup-rule! "^◀\\[.*@.*\\]" :side 'right :size 0.6 :quit nil :select t)
  (when (featurep! :completion ivy)
    (load! "+ivy"))
  (when (featurep! :editor evil)
    (map!
     (:map telega-msg-button-map
       "k" nil
       "l" nil))))
