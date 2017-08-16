(package-initialize)
(org-babel-load-file "~/.emacs.d/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-track-position-in-mode-line t)
 '(flyspell-mode-line-string nil)
 '(package-selected-packages
   (quote
    (with-editor evil-magit magit helm-flyspell yaml-mode yasnippet which-key use-package spaceline restart-emacs psci org-bullets neotree helm-projectile helm-gtags helm-dash haskell-mode flycheck evil-surround evil-leader evil-indent-textobject evil-iedit-state engine-mode dumb-jump dired-open dired+ diff-hl company)))
 '(projectile-mode-line (quote (:eval (format "[%s]" (projectile-project-name)))))
 '(undo-tree-mode-lighter ""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:inherit nil :background "Blue" :foreground "gray95" :box (:line-width -1 :color "gray50") :weight light))))
 '(mode-line-inactive ((t (:background "gray30" :foreground "grey80")))))
