;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; ==============
;; CUSTOMISATIONS
;; ==============

; Put customisations in a seperate file
(setq custom-file "~/.emacs.d/customize.el")
(load custom-file)

; Prompt to save new options upon exit
(add-hook 'kill-emacs-query-functions
          'custom-prompt-customize-unsaved-options)

(defun add-minor-mode-to-hooks (mode hooks)
  (dolist (hook hooks)
    (add-hook hook mode)))

; Fix auto indentation in some modes
(defun fix-indent ()
  (setq electric-indent-inhibit t))

(add-minor-mode-to-hooks #'fix-indent
   '(emacs-lisp-mode-hook
     lisp-interaction-mode-hook
     lisp-mode-hook))

; Icicles don't want to work with Customize for some reason, so
; we enable it manually
(icy-mode 1)

; Enable rainbow-delimiters-mode globally
(define-globalized-minor-mode
  global-rainbow-delimiters-mode rainbow-delimiters-mode
  (lambda () (rainbow-delimiters-mode 1)))
(global-rainbow-delimiters-mode 1)

;; IntelliJ Integration
(set-default 'server-socket-dir "~/.emacs.d/server")
(if (functionp 'window-system)
    (when (and (window-system)
           (>= emacs-major-version 24))))
(server-start)

;; ===========
;; Keybindings
;; ===========
(bind-key "C-x k" #'kill-this-buffer)
(bind-key "C-c <f1> v" #'customize-variable)
(bind-key "C-k" #'kill-region)
(bind-key "M-k" #'kill-ring-save)

; Company
(use-package company
  :bind
  (("<tab>" . company-indent-or-complete-common) 
   :map company-active-map
   ("<up>"   . company-select-previous)
   ("<down>" . company-select-next)
   ("C-p" . comany-select-previous)
   ("C-n" . company-select-next)
   ("C-d" . company-show-doc-buffer)
   ("M-." . company-show-location))

  :config
  (global-company-mode))

; Helm
(use-package helm
  :init
  (require 'helm-config)
  (bind-key "C-c h" 'helm-command-prefix)
  (unbind-key "C-x c")
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-echo-input-in-header-line t
        projectile-completion-system 'helm)

  :bind
  (("M-x"     . helm-M-x)
   ("C-x C-r" . helm-recentf)
   ("C-x C-b" . helm-mini)
   ("C-x C-," . helm-mini)
   ("C-x C-f" . helm-find-files)
   ("C-'"     . helm-projectile-find-file)

   :map helm-map
   ("<tab>" . helm-execute-persistent-action)
   ("C-z"   . helm-select-action))

  :config
  (helm-mode 1)
  (projectile-global-mode)
  (helm-projectile-on))

(use-package fill-column-indicator
  :config
  (add-minor-mode-to-hooks #'fci-mode
    '(emacs-lisp-mode-hook
      lisp-mode-hook
      lisp-interaction-mode-hook
      clojure-mode-hook))
  
  ; Disable FCI while company presents popup; workaround described
  ; here: https://github.com/company-mode/company-mode/issues/180
  ; Or else fci will interfere with the popup
  (defvar-local company-fci-mode-on-p nil)
  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setq company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))
  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci))

(use-package parinfer
  :config
  (add-minor-mode-to-hooks #'parinfer-mode
   '(clojure-mode-hook
     emacs-lisp-mode-hook
     ielm-mode-hook
     lisp-mode-hook
     lisp-interaction-mode-hook
     scheme-mode-hook
     eval-expression-minibuffer-setup-hook))
  (setq parinfer-lighters '(" (i)" . " (p)")))

(use-package cider
  :config
  (add-hook 'clojure-mode-hook #'cider-mode))

(use-package smart-mode-line
  :init
  (setq sml/theme 'dark)
  
  :config
  (sml/setup))

(use-package dim
  :config
  (dim-major-names
   '((emacs-lisp-mode "ELisp")
     (lisp-interaction-mode "LispInt")))

  (dim-minor-names
    '((helm-mode "")
      (company-mode "")
      (visual-line-mode ""))))

(use-package magit
  :bind
  (("C-c m" . magit-status)))

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))
  
(use-package neotree
  :bind
  (("<f8>" . neotree-project-dir)))

(use-package bs
  :bind
  (("C-{" . bs-cycle-previous)
   ("C-}" . bs-cycle-next)
   ("C-x b" . bs-show)))
