;;; private/keybindings/config.el  -*- lexical-binding: t; -*-

(map!
 :leader
 ;;(:desc "toggle" :prefix "t"
 (:prefix ("t" . "toggle")
   :desc "Transparency"                  :n "t"  #'+steamedfish/toggle-transparency)
 (:when (featurep! :intl chinese)
   (:prefix ("t" . "toggle")
     :desc "Increase Fontsize"           :n "+"  #'cnfonts-increase-fontsize
     :desc "Decrease Fontsize"           :n "-"  #'cnfonts-decrease-fontsize
     :desc "Reset Fontsize"              :n "0"  #'cnfonts-reset-fontsize)
   :prefix ("h" . "help")
   :desc "Lookup Dictionary"             :n "l"  #'youdao-dictionary-search-at-point)
 (:prefix ("F" . "Frame")
   :desc "Delete Frame"                  :n "d"  #'delete-frame
   :desc "Delete Other Frame"            :n "D"  #'delete-other-frame
   :desc "Other Frame"                   :n "o"  #'other-frame
   :desc "Make Frame"                    :n "n"  #'make-frame
   :desc "Make Frame"                    :n "n"  #'make-frame
   :desc "Switch to buffer Other Frame"  :n "f"  #'switch-to-buffer-other-frame
   :desc "Display buffer Other Frame"    :n "O"  #'display-buffer-other-frame))
