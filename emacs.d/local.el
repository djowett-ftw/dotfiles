(setq cabbage-mac-use-shell-path t)

(add-to-list 'cabbage-bundle-dirs (expand-file-name "~/.emacs.d/bundles/"))
(add-to-list 'cabbage-vendor-dirs (expand-file-name "~/.emacs.d/vendor/"))

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
                        robot-mode

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

(defun jone-after-loading-cabbage ()
  (setq *textmate-gf-exclude*
        (replace-regexp-in-string "\|\\\\\.app\|" "|" *textmate-gf-exclude*)))

(add-hook 'cabbage-initialized-hook 'jone-after-loading-cabbage)
