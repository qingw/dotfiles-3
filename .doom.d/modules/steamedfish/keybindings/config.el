;;; steamedfish/keybindings/config.el  -*- lexical-binding: t; -*-

(map!
 :leader
 (:prefix ("b" . "buffer")
   :desc "Read Only"                     :n "r"   #'view-mode
   :desc "Revert Edit"                   :n "R"   #'revert-buffer)
 (:prefix ("F" . "Frame")
   :desc "Delete Frame"                  :n "d"   #'delete-frame
   :desc "Delete Other Frame"            :n "D"   #'delete-other-frame
   :desc "Other Frame"                   :n "o"   #'other-frame
   :desc "Make Frame"                    :n "n"   #'make-frame
   :desc "Switch to buffer Other Frame"  :n "f"   #'switch-to-buffer-other-frame
   :desc "Toggle Frame Maximized"        :n "F"   #'toggle-frame-maximized
   :desc "Toggle Frame Fullscreen"       :n "C-F" #'toggle-frame-fullscreen
   :desc "Display buffer Other Frame"    :n "O"   #'display-buffer-other-frame))

;; when at the edge of buffers, go to the next node
(after! info
  (map!
   :map Info-mode-map
   :n "j"    (λ!
              (condition-case nil
                  (evil-next-line)
                (error (Info-scroll-up))))
   :n "k"    (λ!
              (condition-case nil
                  (evil-previous-line)
                (error (Info-scroll-down))))))
