(package-initialize)
(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (blackboard)))
 '(custom-safe-themes
   (quote
    ("2d9a34be43868d42766e41ffa66db457161783cc5b9c7570c57ac672bca8db5c" default)))
 '(erc-track-position-in-mode-line t)
 '(flyspell-mode-line-string nil)
 '(projectile-mode-line (quote (:eval (format "[%s]" (projectile-project-name)))))
 '(undo-tree-mode-lighter ""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:inherit nil :background "Blue" :foreground "gray95" :box (:line-width -1 :color "gray50") :weight light))))
 '(mode-line-inactive ((t (:background "gray30" :foreground "grey80")))))
