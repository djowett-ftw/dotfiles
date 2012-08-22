(setq e-max-mac-use-shell-path t)

(setq e-max-bundles '(
                      accessibility
                      completion
                      css
                      diff
                      e-max-developer
                      ergonomic
                      git
                      html
                      irc
                      jabber
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
                      rect-mark
                      ruby
                      snippets
                      terminal
                      ))


(global-set-key (kbd "<f6>") 'theme-roller-cycle)
(setq theme-roller-active-themes '(color-theme-railscasts color-theme-lazy color-theme-monokai))
(setq e-max-theme 'color-theme-lazy)

(setq jabber-account-list
      '(("tschouns@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)))
      jabber-show-offline-contacts nil
      jabber-roster-show-bindings nil)

(add-to-list 'completion-ignored-extensions ".egg-info")
