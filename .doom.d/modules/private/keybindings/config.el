;;; private/keybindings/config.el  -*- lexical-binding: t; -*-

(map!
 :leader
 ;;(:desc "toggle" :prefix "t"
 (:prefix ("t" . "toggle")
   :desc "Transparency"                  :n "t"  #'+default/toggle-transparency)
 (:when (featurep! :intl chinese)
 (:prefix ("t" . "toggle")
   :desc "cnfonts-increase-fontsize"     :n "+"  #'cnfonts-increase-fontsize
   :desc "cnfonts-decrease-fontsize"     :n "-"  #'cnfonts-decrease-fontsize
   :desc "cnfonts-reset-fontsize"        :n "0"  #'cnfonts-reset-fontsize)
  :prefix ("h" . "help")
   :desc "lookup dictionary"             :n "l"  #'youdao-dictionary-search-at-point)
 (:prefix ("F" . "Frame")
   :desc "Delete Frame"                  :n "d"  #'delete-frame
   :desc "Delete Other Frame"            :n "D"  #'delete-other-frame
   :desc "Other Frame"                   :n "o"  #'other-frame
   :desc "Make Frame"                    :n "n"  #'make-frame
   :desc "Make Frame"                    :n "n"  #'make-frame
   :desc "Switch to buffer Other Frame"  :n "f"  #'switch-to-buffer-other-frame
   :desc "Display buffer Other Frame"    :n "O"  #'display-buffer-other-frame))
