if g:dein#_cache_version !=# 410 || g:dein#_init_runtimepath !=# '/Users/2022keita/.config/nvim,/etc/xdg/nvim,/Users/2022keita/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/opt/homebrew/Cellar/neovim/0.6.1/share/nvim/runtime,/opt/homebrew/Cellar/neovim/0.6.1/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/2022keita/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/2022keita/.config/nvim/after,/Users/2022keita/.config/nvim/.dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#min#_load_cache_raw(['/Users/2022keita/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/2022keita/.config/nvim/.dein'
let g:dein#_runtime_path = '/Users/2022keita/.config/nvim/.dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/2022keita/.config/nvim/.dein/.cache/init.vim'
let &runtimepath = '/Users/2022keita/.config/nvim,/etc/xdg/nvim,/Users/2022keita/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/2022keita/.config/nvim/.dein/repos/github.com/Shougo/dein.vim,/Users/2022keita/.config/nvim/.dein/.cache/init.vim/.dein,/opt/homebrew/Cellar/neovim/0.6.1/share/nvim/runtime,/Users/2022keita/.config/nvim/.dein/.cache/init.vim/.dein/after,/opt/homebrew/Cellar/neovim/0.6.1/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/2022keita/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/2022keita/.config/nvim/after'
filetype off
