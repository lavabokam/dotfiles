(package-initialize)
(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-track-position-in-mode-line t)
 '(flyspell-mode-line-string nil)
 '(p4-executable "/opt/bin/p4")
 '(p4-my-clients (quote ("lava_p4devil")))
 '(package-selected-packages
   (quote
    (evil-collection magit-p4 p4 protobuf-mode company-irony-c-headers dockerfile-mode noflet org-bullets evil-magit magit diff-hl company-irony yaml-mode jinja2-mode js2-mode psci purescript-mode haskell-mode markdown-mode company counsel-gtags dumb-jump counsel swiper ivy ag restart-emacs which-key treemacs-evil treemacs-projectile treemacs evil-iedit-state evil-leader evil use-package spaceline diminish)))
 '(projectile-mode-line (quote (:eval (format "[%s]" (projectile-project-name)))) t)
 '(undo-tree-mode-lighter ""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:inherit nil :background "Blue" :foreground "gray95" :box (:line-width -1 :color "gray50") :weight light))))
 '(mode-line-inactive ((t (:background "gray30" :foreground "grey80")))))
