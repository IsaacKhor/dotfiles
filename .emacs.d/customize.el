(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bs-configurations
   (quote
    (("all" nil nil nil nil nil)
     ("files-and-scratch" "^\\*scratch\\*$" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last))))
 '(bs-cycle-configuration-name nil)
 '(bs-default-configuration "all")
 '(bs-default-sort-name "by name")
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(debug-on-error t)
 '(default-frame-alist (quote ((height . 60) (width . 115))))
 '(electric-pair-mode t)
 '(fci-rule-color "dark gray")
 '(fci-rule-column 80)
 '(helm-mode nil)
 '(ido-mode nil nil (ido))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(neo-show-hidden-files t)
 '(neo-theme (quote icons))
 '(neo-window-fixed-size nil)
 '(neo-window-position (quote left))
 '(neo-window-width 30)
 '(ns-command-modifier (quote control))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (smart-mode-line ac-slime ac-cider slime helm-projectile bind-key rainbow-delimiters rainbow-mode helm helm-cider helm-css-scss fill-column-indicator all-the-icons-dired all-the-icons-gnus all-the-icons-ivy all-the-icons neotree lacarte icicles magit markdown-mode markdown-mode+ lua-mode luarocks brainfuck-mode bookmark+ org parinfer color-theme-sanityinc-solarized color-theme auto-complete cider)))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 100)
 '(recentf-mode t)
 '(rm-blacklist (quote (" Helm" " ICY")))
 '(scroll-bar-mode nil)
 '(sml/replacer-regexp-list
   (quote
    (("^~/\\.emacs\\.d/elpa/" ":elpa:")
     ("^~/\\.emacs\\.d/" ":emacs:")
     ("^~/Documents/" ":Doc:")
     ("^~/Documents/code/" ":code:"))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Fira Code")))))
