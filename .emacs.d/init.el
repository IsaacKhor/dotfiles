;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/customize.el")
(load custom-file)

; Prompt to save new options upon exit
(add-hook 'kill-emacs-query-functions
          'custom-prompt-customize-unsaved-options)

; Parinfer for all the Lisps
(add-hook 'clojure-mode-hook          #'parinfer-mode)
(add-hook 'emacs-lisp-mode-hook       #'parinfer-mode)
(add-hook 'ielm-mode-hook             #'parinfer-mode)
(add-hook 'lisp-mode-hook             #'parinfer-mode)
(add-hook 'lisp-interaction-mode-hook #'parinfer-mode)
(add-hook 'scheme-mode-hook           #'parinfer-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'parinfer-mode)

; CIDER for Clojure(Script)
(add-hook 'clojure-mode-hook #'cider-mode)

; Auto wrap for text
(add-hook 'text-mode (lambda () (longlines-mode 1)))

; Smart mode line
(sml/setup)

; Enable Fill Column Idicator (FCI) as a global minor mode
(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)
(global-fci-mode 1)

; Enable rainbow-delimiters-mode globally
(define-globalized-minor-mode
  global-rainbow-delimiters-mode rainbow-delimiters-mode
  (lambda () (rainbow-delimiters-mode 1)))
(global-rainbow-delimiters-mode 1)

; Keybindings
(require 'bind-key)
(bind-key "C-x C-r" 'recentf-open-files)
(bind-key "<f8>" 'neotree-toggle)
(bind-key "C-x k" 'kill-this-buffer)
(bind-key "C-x C-b" 'bs-show)
(bind-key "C-{" 'bs-cycle-next) 
(bind-key "C-}" 'bs-cycle-previous)
