" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
 
 
"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
if has("win32")
    set fileencoding=cp936
else
    set fileencoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,cp936,utf-16,gbk,big5,gb18030,latin1
 
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8
 
filetype on
filetype plugin indent on
colorscheme evening	"配色方案
colorscheme desert
set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
set tabstop=4		"设置tab的跳数
set softtabstop=4   "设置软制表符
set expandtab
set backspace=2 	"设置退格键可用
set nu! 		"设置显示行号
set relativenumber "显示相对行号
set wrap 		"设置不自动换行
set textwidth=0
set wrapmargin=0
autocmd FileType text setlocal textwidth=0
"set whichwrap+=<,>,h,l
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set tags=tags;
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set mouse=a 		"设置在任何模式下鼠标都可用
set nobackup 		"设置不生成备份文件
set noundofile 		"设置不生成撤销文件
"set go=				"不要图形按钮
set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
set foldenable      " 允许折叠  
"set foldmethod=indent
set foldmethod=manual   " 手动添加折叠标签
 
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找
 
"===========================
"状态栏的设置
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行
 
"===========================
"代码设置
"===========================
syntax enable "打开语法高亮
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
set shiftwidth=4 "换行时，交错使用4个空格
set autoindent "设置自动对齐
let g:tex_indent_items=0
set ai! "设置自动缩进
set cursorcolumn "启用光标列
set cursorline	"启用光标行
"set guicursor+=a:blinkon0 "设置光标不闪烁
"set fdm=indent
set guifont=Courier_New:h12 "设置默认字体
"设置leader键，用户快捷键空间
:let mapleader = ";"    
 
 
"插件管理
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'godlygeek/tabular'
Plugin 'tarikgraba/vim-systemverilog'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/matchit'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'sqliuchang/vim-snippets-sqliuchang'
"Plugin 'WolfgangMehner/vim-plugins'
"Plugin 'w0rp/ale'
call vundle#end()
 
" 关闭NERDTree快捷键 : + t
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=21
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" delimitMate配置
" 为latex配置专属delimiter
au FileType tex let b:delimitMate_smart_quotes = '^\%(\w\|\!\|[£$]\|[^[:space:][:punct:]]\)'
au FileType tex let b:delimitMate_quotes = '$'
" 换成c-j跳转
" autocmd VimEnter * imap <silent> <expr> <c-j> delimitMate#ShouldJump() ? delimitMate#JumpAny() : "\<C-r>=UltiSnips#JumpForward()OrJump()\<CR>"
" 禁用默认的S-tab
" autocmd VimEnter * inoremap <S-TAB> <S-TAB>
" 回车缩进换行。
let delimitMate_expand_cr = 1
" 括号内空格左右会出现两个空格
let delimitMate_expand_space = 1
" 临时停用
" let delimitMate_autoclose = 0

" indentLine 代码缩进线标志线
let g:indentLine_char = '|' 
let g:indentLine_color_term = 239  
autocmd FileType json,markdown,tex let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,vim,shell let g:indentLine_conceallevel=2
" 开关快捷键映射到; + t键
map <leader>i :IndentLinesToggle<CR>  


" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_key_list_stop_completion = ['<CR>']

"提示部分背景设置
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
" C-j和UltiSnips delimitMate冲突
"let g:ycm_key_list_select_completion = ['<C-j>']
"let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_error_symbol = '>>'    "错误的显示符号
let g:ycm_warning_symbol = '>*'  "警告的显示符号
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=3	" 从第3个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>f :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nmap <F4> :YcmDiags<CR>
nnoremap <leader>lo :lopen<CR>	"open locationlist
nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"跳转到定义处

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript,tex': ['re!\w{2}'],
            \ }
"let g:ycm_filetype_whitelist = { 
"			\ "c":1,
"			\ "cpp":1, 
"			\ "objc":1,
"			\ "sh":1,
"			\ "zsh":1,
"			\ "zimbu":1,
"			\ }
"


"delimitMate设置
"允许cr扩展
let delimitMate_expand_cr = 1


"syntastic 语法错误检查
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"每次自动调用 :SyntasticSetLocList, 将错误覆盖 **quickfix**
let g:syntastic_always_populate_loc_list = 1
" 自动拉起/关闭错误窗口, 不需要手动调用 :Errors
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
map <F2> :SyntasticToggleMode<CR>
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_matlab_checkers = ['mlint']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_lacheck_quiet_messages = {
        \ "!level":  "errors",
        \ "type":    "style",
        \ "regex":   '\m\[C03\d\d\]',
        \ "file:p":  ['\m\.tex$'] }




"" ale配置
"" 显示侧边栏
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0
"" 自定义图标
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
""在vim自带的状态栏中整合ale
"let g:airline#extensions#ale#enabled = 1
"let g:ale_statusline_format = ['>> %d', '>* %d', 'OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>a :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"let g:ale_linters = {
"\   'verilog': ['iverilog'],
"\   'systemverilog': ['iverilog'],
"\   'python': ['pylint'],
"\}

"tagbar配置
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags' 

"vimtex配置
let g:tex_flavor='latex'
let g:vimtex_texcount_custom_arg=' -ch -total'
"映射VimtexCountWords！\lw 在命令模式下enter此命令可统计中英文字符的个数
au FileType tex map <buffer> <silent>  <leader>lw :VimtexCountWords!  <CR><CR>
"这里是LaTeX编译引擎的设置，这里默认LaTeX编译方式为-pdf(pdfLaTeX),
"vimtex提供了magic comments来为文件设置编译方式
"例如，我在tex文件开头输入 % !TEX program = xelatex   即指定-xelatex （xelatex）编译文件
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
"这里是设置latexmk工具的可选参数
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-shell-escape',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
" 阅读器相关的配置 包含正反向查找功能 仅供参考
let g:vimtex_view_general_viewer = 'sumatrapdf'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
"编译过程中忽略警告信息
let g:vimtex_quickfix_open_on_warning=0

" ultisnips配置
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEditSplit="context"
