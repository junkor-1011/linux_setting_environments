create conda environment for nvim
====================================

- enable `python3` and `nodejs`
- run below:

```Bash
$ conda env create -f create_env_nvim.yml

# Result EXAMPLE:
#
# Collecting package metadata (repodata.json): done
# Solving environment: done
#
# Downloading and Extracting Packages
# python_abi-3.8       | 4 KB      | ############################################################ | 100%
# msgpack-python-1.0.0 | 93 KB     | ############################################################ | 100%
# greenlet-0.4.15      | 22 KB     | ############################################################ | 100%
# libuv-1.34.0         | 922 KB    | ############################################################ | 100%
# nodejs-14.3.0        | 15.8 MB   | ############################################################ | 100%
# ld_impl_linux-64-2.3 | 616 KB    | ############################################################ | 100%
# certifi-2020.4.5.1   | 151 KB    | ############################################################ | 100%
# pynvim-0.4.1         | 63 KB     | ############################################################ | 100%
# pip-20.1.1           | 1.1 MB    | ############################################################ | 100%
# setuptools-47.1.0    | 652 KB    | ############################################################ | 100%
# icu-67.1             | 12.9 MB   | ############################################################ | 100%
# pygments-2.6.1       | 683 KB    | ############################################################ | 100%
# python-3.8.2         | 70.8 MB   | ############################################################ | 100%
# ctags-5.8            | 143 KB    | ############################################################ | 100%
# Preparing transaction: done
# Verifying transaction: done
# Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate nvim_backend
#
# To deactivate an active environment, use
#
#     $ conda deactivate
```

- then, run below:

```Bash
$ npm install -g neovim
# ***
# + neovim@4.9.0
# added 42 packages from 36 contributors in 3.243s
```

```Bash
# for ternjs
npm install -g tern
```

- CAUTION
    - `conda`の`node`はその環境に入っていないとうまく使えない
        - 外から`g:node_host_prog`で絶対パスを指定して使おうとしてもエラーが出る（ことがある）
    - システムで`sudo npm install -g neovim`をしておくのが無難


```Ruby
# ついでにRubyを使う場合
sudo gem install neovim
```

- Windowsだとそもそも`conda`でインストール出来なさそうなので、システムから入れるのが良さそう?
- 複数の`Ruby`がある場合、`g:ruby_host_prog`が使えそう


------------

- 上記の場合だと`pyenv`と`conda`を使っており、neovimに適切なbackendを指定するには工夫が必要
- 今回は`.bashrc`に環境変数として`neovim`用の`Python3`のパスを記述し、`init.vim`の中で読み出す

```bash
### ~/.bashrc ###

# *** 省略 ***

### pyenv ###
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# `anaconda3-2019.03`の部分は適宜変える:
# `pyenv which python`や`which python`で調べておく

### neovim ###
export PYTHON3_NVIM_BACKEND="~/.pyenv/versions/anaconda3-2019.03/envs/nvim_backend/bin/python3"
# conda環境内のnodeを外から指定してもERRORが出た
# `npm install -g neovim`を行ったconda環境に切り替えるか、`sudo npm install -g neovim`を実行する必要
# export NODE_NVIM_BACKEND="~/.pyenv/versions/anaconda3-2019.03/envs/nvim_backend/bin/node"

```

```vim

" *** 省略 ***

" 以下を追記
"neovim backend --------------------------

" Python3
let s:python3_nvim_backend = getenv("PYTHON3_NVIM_BACKEND")
if s:python3_nvim_backend != v:null
    let g:python3_host_prog = s:python3_nvim_backend
endif
unlet s:python3_nvim_backend

" nodejs
let s:node_nvim_backend = getenv("NODE_NVIM_BACKEND")
if s:node_nvim_backend != v:null
    let g:node_host_prog = s:node_nvim_backend
endif
unlet s:node_nvim_backend

" ruby
let s:ruby_nvim_backend = getenv("RUBY_NVIM_BACKEND")
if s:ruby_nvim_backend != v:null
    let g:ruby_host_prog = s:ruby_nvim_backend
endif
unlet s:ruby_nvim_backend

" *** 省略 ***
```

- `nvim`を開いて`:checkhealth`を実行：

```vim

## Python 3 provider (optional)
  - INFO: Using: g:python3_host_prog = "~/.pyenv/versions/anaconda3-2019.03/envs/nvim_backend/bin/python3"
  - INFO: Executable: /home/tomoyuki/.pyenv/versions/anaconda3-2019.03/envs/nvim_backend/bin/python3
  - INFO: Python version: 3.8.2
  - INFO: pynvim version: 0.4.1
  - OK: Latest pynvim is installed.

## Ruby provider (optional)
  - INFO: Ruby: ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]
  - INFO: Host: /usr/local/bin/neovim-ruby-host
  - OK: Latest "neovim" gem is installed: 0.8.1

## Node.js provider (optional)
  - INFO: Node.js: v14.3.0
  - INFO: Neovim node.js host: /usr/lib/node_modules/neovim/bin/cli.js
  - OK: Latest "neovim" npm/yarn package is installed: 4.9.0

```


