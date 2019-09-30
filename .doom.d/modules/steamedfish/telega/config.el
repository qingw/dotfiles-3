;;; steamedfish/telega/config.el -*- lexical-binding: t; -*-

;; copied from https://github.com/sarg/dotfiles/
(use-package! telega
  :commands (telega)
  :defer t
  :hook (telega-chat-mode . doom-mark-buffer-as-real-h)
  :init
  (when (eq window-system 'mac)
    (defadvice! +telega--fix-emacs-mac-svg-embed-a
      (svg image image-type datap &rest args)
      "Emacs-mac uses macOS's buildin svg parser, which cannot handle the
deprecated `xlink:href' attribute. Change it to `href' ."
      :override #'svg-embed
      (svg--append
       svg
       (dom-node
        'image
        `((href . ,(svg--image-data image image-type datap))
          ,@(svg--arguments svg args))))))
  :config
  (telega-mode-line-mode 1)
  (set-popup-rule! "^\\*Telega Root" :side 'left :size 50 :quit nil :select t)
  (set-popup-rule! "^◀\\[.*\\]$" :side 'right :size 94 :quit nil :select t)
  (set-popup-rule! "^◀\\(.*\\)$" :side 'right :size 94 :quit nil :select t)
  (set-popup-rule! "^◀{.*}$" :side 'right :size 94 :quit nil :select t)
  (set-popup-rule! "^◀<.*>$" :side 'right :size 94 :quit nil :select t)
  (setq telega-use-tracking t
        telega-known-inline-bots '("@shufmbot")
        telega-sticker-set-download t
        telega-chat-button-width 28
        telega-root-fill-column 48)
  (when (featurep! :completion ivy)
    (load! "+ivy"))
  (when (featurep! :completion company)
    (add-hook 'telega-chat-mode-hook
              (lambda ()
                (set (make-local-variable 'company-backends)
                     (append '(telega-company-emoji
                               telega-company-username
                               telega-company-hashtag)
                             (when (telega-chat-bot-p telega-chatbuf--chat)
                               '(telega-company-botcmd)))))))
  (when (featurep! :editor evil)
    (map!
     (:map telega-msg-button-map
       "k" nil
       "l" nil))))
