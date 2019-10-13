There is no export settings feature for Vimium right now. Therefore just copy and paste the following in Vimium settings: 

Custom Key Mappings:

# Insert your preferred key mappings here.
map <c-w>l nextTab
map <c-w>h previousTab
map <c-j> scrollDown
map <c-k> scrollUp
map <c-d> scrollPageDown
map <c-u> scrollPageUp
map $ lastTab
map ^ firstTab
unmap t

unmap J
unmap K
map J scrollToTop
map K scrollToBottom
map <m-*>t createTab
map <c-H> goBack
map <c-L> goForward

