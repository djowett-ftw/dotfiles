(setq cabbage-mac-use-shell-path t)

(setq cabbage-bundles '(
                        accessibility
                        completion
                        css
                        diff
                        ergonomic
                        git
                        html
                        javascript
                        latex
                        lisp
                        markdown
                        maximize
                        org
                        plone
                        power-edit
                        project
                        python
                        ruby
                        irc
                        rect-mark

                        cabbage-developer
                        snippets
                        ))


(global-set-key (kbd "<f6>") 'theme-roller-cycle)
(setq theme-roller-active-themes '(color-theme-railscasts color-theme-lazy color-theme-monokai))
(setq cabbage-theme 'color-theme-lazy)

(setq jabber-account-list
      '(("tschouns@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)))
      jabber-show-offline-contacts nil
      jabber-roster-show-bindings nil)

(add-to-list 'completion-ignored-extensions ".egg-info")


;; Robot framework

(defun jone-setup-robot-mode ()
  (load-file (expand-file-name "~/.emacs.d/vendor/robot-mode/robot-mode.el"))
  (add-to-list 'auto-mode-alist '("/tests/.*\\.txt\\'" . robot-mode))

  (define-key robot-mode-map (kbd "M-e") 'jone-execute-robot-tests))

(add-hook 'cabbage-initialized-hook 'jone-setup-robot-mode)


(defun jone-setup-robot-mode-testing ()
  (when (and buffer-file-name (string-match "/tests" buffer-file-name))
    (setq cabbage-testing-execute-function
          'cabbage-plone--run-single-file-tests)))

(add-hook 'robot-mode-hook 'cabbage-plone--python-setup-testing)
