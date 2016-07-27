;; Initializations
;; JSX/ESLINT setup from http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
(add-to-list 'auto-mode-alist 
             '("\\.jsx$" . web-mode))

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
    "Hooks for Web mode. Adjust indents"
      ;;; http://web-mode.org/
        (setq web-mode-markup-indent-offset 2)
          (setq web-mode-css-indent-offset 2)
            (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
             (if (equal web-mode-content-type "jsx")
                   (let ((web-mode-enable-part-face nil))
                           ad-do-it)
                       ad-do-it))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (hipster)))
 '(custom-safe-themes
   (quote
    ("ee17bcdaa3ce2c5b287dff4d4c1da13f45bfa2f1aa9e11ff0bbbebb2e6be79c5" "754b61c05f9ec4d0462aee7c73e350a56f3d8f88610e67b1fe7b5efc646dc0ce" default)))
 '(custom-theme-directory "~/.emacs.d/themes")
 '(custom-theme-load-path (quote ("~/.emacs.d/themes" custom-theme-directory t)))
 '(flycheck-disabled-checkers (quote (javascript-jshint json-jsonlist)))
 '(flycheck-mode-hook (quote (flycheck-mode-set-explicitly)))
 '(global-flycheck-mode t)
 '(ido-mode (quote both) nil (ido))
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-enable-at-startup t)
 '(package-user-dir "~/.emacs.d/elpa")
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
