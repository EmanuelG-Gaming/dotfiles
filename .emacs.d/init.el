;;; Before package
;;; Evil   
(require 'evil)
 (evil-mode 1)


;; Set theme
;(load-theme 'wombat)

;;; Do not use GNU-style indentation with 2 spaces per tab
(setq-default tab-width 4)
(setq-default ident-tabs-mode nil)
(setq ident-line-function 'insert-tab)
(setq c-default-style "linux")
(setq c-basic-offset 4)
(c-set-offset 'comment-intro 0)

;;; Display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(eglot-inactive-regions evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
