" 设置不兼容模式
set nocompatible

" 禁用模式行
set modelines=0

" 获取当前文件所在目录,便于后续加载其他配置
let s:script_dir = expand('<sfile>:p:h')

" 定义要加载的配置列表
let s:files_to_source = ['basic.vim' ]

" 循环加载文件
for file in s:files_to_source
  execute 'source' fnameescape(s:script_dir . '/' . file)
endfor
