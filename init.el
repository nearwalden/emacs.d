;; Dave's emacs customizations

;; put my customizations 
(if window-system 
  (progn
    
    ;; gpg tools
    (require 'epa-file)
    (custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg"))
    (epa-file-enable)

    ;; go modes
    ;; (add-to-list 'load-path "~/.emacs.d/vendor/go-mode.el/")
    ;; (require 'go-mode-autoloads)


    ;; set line wrapping
    (visual-line-mode)

    ;; themes
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
    (load-theme 'ample t)
    ;; (emable-theme 'ample)
    ))

;; markdown
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
(require 'markdown-mode)
;; GFM mode does some smarter things than straight markdown mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.tid\\'" . gfm-mode))

;; fish mnode
(add-to-list 'load-path "~/.emacs.d/vendor/fish-mode")
(require 'fish-mode)


    ;; backup files

(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; Electrify the buffer list:
(global-set-key "" 'electric-buffer-list)

;; Line wrapping
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
	  '(lambda() (set-fill-column 80)))

;; set window size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 100))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (ample)))
 '(custom-safe-themes
   (quote
    ("5dc8ea509d300f9b751fce3d94d9885d264c5bda240e90e884d48601955b3f8c" default)))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Hack"))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :foreground "dark green" :weight bold)))))
