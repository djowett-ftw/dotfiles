(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq cabbage-repository (expand-file-name "/Users/jone/projects/cabbage/"))
(load (concat cabbage-repository "cabbage"))
(put 'narrow-to-region 'disabled nil)
(put 'ido-exit-minibuffer 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
