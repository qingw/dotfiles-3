;;; private/keybindings/+org.el -*- lexical-binding: t; -*-

(map!
 :map evil-org-mode-map
 :localleader
 :desc "Agenda"            "a"  #'org-agenda
 :desc "Attach"            "A"  #'org-attach
 :desc "Capture"           "c"  #'org-capture
 :desc "Deadline"          "d"  #'org-deadline
 :desc "Goto"              "g"  #'org-goto
 :desc "Filter"            "f"  #'org-match-sparse-tree
 :desc "Priority"          "p"  #'org-priority
 :desc "Refile"            "r"  #'org-refile
 :desc "Reveal"            "R"  #'org-reveal
 :desc "Schedule"          "s"  #'org-schedule
 :desc "Create/Edit Todo"  "t"  #'org-todo
 :desc "Tag heading"       "T"  #'org-set-tags-command)
