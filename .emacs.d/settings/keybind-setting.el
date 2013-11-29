;; M-lでgoto-line
(global-set-key "\M-l" 'goto-line)

;; C-h -> Backspace
(global-set-key "\C-h" 'delete-backward-char)

;; C-x C-b, C-x b -> anything
;; (global-set-key "\C-xb" 'my-anything-file)
;; (global-set-key "\C-x\C-b" 'my-anything-file)
;; (global-set-key "\C-xf" 'my-anything-file)

;; mac
(if window-system
    (progn
      ;; Command-RETでmac-toggle-max-window
      (global-set-key [(alt return)] 'ns-toggle-fullscreen)
      (setq mac-command-modifier 'alt)
      (setq mac-control-modifier 'control)
      (setq mac-option-modifier 'meta)
      ))

;; flymake
(define-key global-map (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
(define-key global-map (kbd "C-c n") 'flymake-goto-next-error)
(define-key global-map (kbd "C-c p") 'flymake-goto-prev-error)

;; auto-complete
(global-set-key "\M-/" 'auto-complete)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-f" 'ac-stop)

;; magit
(global-set-key "\C-x\C-j" 'magit-status)
(global-set-key "\C-xj" 'magit-status)
