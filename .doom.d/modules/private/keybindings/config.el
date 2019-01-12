;;; private/keybindings/config.el  -*- lexical-binding: t; -*-

(map!
 :leader
 ;;(:desc "toggle" :prefix "t"
 (:prefix ("t" . "toggle")
   :desc "Transparency"                  :n "t"  #'+steamedfish/toggle-transparency)
 (:prefix ("F" . "Frame")
   :desc "Delete Frame"                  :n "d"  #'delete-frame
   :desc "Delete Other Frame"            :n "D"  #'delete-other-frame
   :desc "Other Frame"                   :n "o"  #'other-frame
   :desc "Make Frame"                    :n "n"  #'make-frame
   :desc "Make Frame"                    :n "n"  #'make-frame
   :desc "Switch to buffer Other Frame"  :n "f"  #'switch-to-buffer-other-frame
   :desc "Toggle Frame Maximized"        :n "F"  #'toggle-frame-maximized
   :desc "Display buffer Other Frame"    :n "O"  #'display-buffer-other-frame))
