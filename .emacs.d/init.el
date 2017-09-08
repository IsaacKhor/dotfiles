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

; Autocomplete setup
; CIDER
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

; SLIME
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

; Longlines mode for text
; Change nav behaviour when dealing with text
(add-hook 'text-mode (lambda () (longlines-mode 1)))

; Smart mode line
(sml/setup)

; Icicles don't want to work with Customize for some reason, so
; we enable it manually
(icy-mode 1)

; Enable Fill Column Idicator (FCI) as a global minor mode
(define-globalized-minor-mode global-fci-mode fci-mode turn-on-fci-mode)
(global-fci-mode 1)

; Enable rainbow-delimiters-mode globally
(define-globalized-minor-mode
  global-rainbow-delimiters-mode rainbow-delimiters-mode
  (lambda () (rainbow-delimiters-mode 1)))
(global-rainbow-delimiters-mode 1)

; Helm configuration
(require 'helm-config)
(bind-key "C-c h" 'helm-command-prefix)
(unbind-key "C-x c")
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(setq
  ; open helm buffer inside current window, not occupy whole other window
  helm-split-window-in-side-p           t
  ; move to end or beginning of source when reaching top or bottom of source.
  helm-move-to-line-cycle-in-source     t
  ; search for library in `require' and `declare-function' sexp.
  helm-ff-search-library-in-sexp        t
  ; scroll 8 lines other window using M-<next>/M-<prior>
  helm-scroll-amount                    8
  helm-ff-file-name-history-use-recentf t
  helm-echo-input-in-header-line t)
(helm-mode 1)

; Keybindings
(require 'bind-key)
(bind-key "C-x C-r" #'recentf-open-files)
(bind-key "<f8>" #'neotree-toggle)
(bind-key "C-x k" #'kill-this-buffer)
(bind-key "C-x C-b" #'bs-show)
(bind-key "C-{" #'bs-cycle-next) 
(bind-key "C-}" #'bs-cycle-previous)
(bind-key "M-x" #'helm-M-x)
(bind-key "C-x b" #'helm-mini)
(bind-key "C-x C-f" #'helm-find-files)
