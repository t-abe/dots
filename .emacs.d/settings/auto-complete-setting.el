(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-ignore-case nil)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "white")
(set-face-background 'ac-selection-face "blue")
