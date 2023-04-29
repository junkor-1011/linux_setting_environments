====================
neovim configration
====================


config file location
~~~~~~~~~~~~~~~~~~~~~~

- PATH of ``init.vim`` and ``dein``

.. code:: bash

   tree ~/.config -a -P "*vim*" --prune
   # ~/.config
   # └── nvim
   #     └── init.vim

   tree ~/.config -a -P "*dein*" --prune
   # ~/.config
   #  └── nvim
   #      ├── dein.toml
   #      └── dein_lazy.toml



In Trouble
~~~~~~~~~~~~


when installing ``denite`` , ``deoplete``, ``msgpack`` error occur
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- ``:check health`` , then ``Error: Require msgpack 1.0.0+ was not succellful``
    - https://github.com/Shougo/deoplete.nvim/issues/1077

.. code:: bash

   # for fix errors:
   pip3 install --user pynvim --upgrade msgpack


Useful Links
~~~~~~~~~~~~~~

- Recommends Plugins
    - https://qiita.com/lighttiger2505/items/3065164798bc9cd615d4
    - https://qiita.com/yutakatay/items/f19b2a0a962a587db5cf
    - https://liginc.co.jp/469142
    - https://qiita.com/karasu78/items/d1489f7cff0c2e0be890
    - https://www.slideshare.net/ShunIwase/vim-141450302
    - https://www.air-h.jp/articles/emopro/%E3%80%90vim%E3%80%91neovim%E3%81%AE%E3%81%99%E3%81%99%E3%82%81/
    - https://note.com/nanigashi/n/n5f7ec9608e76
    - https://knowledge.sakura.ad.jp/23248/
    - https://career.levtech.jp/guide/knowhow/article/29/
    - https://tech.libinc.co.jp/entry/2019/11/29/135510
    - https://qiita.com/reireias/items/5364dcaada1a5b88a206
    - https://qiita.com/reireias/items/beaa3bb0e299ae934217
    - https://qiita.com/ryutah/items/8a4acdb01ad15ebe99f2
    - https://qiita.com/kooooooooooooooooohe/items/fb106e0a0f0969b4ee38

- General
    - https://postd.cc/vim3/
    - https://postd.cc/how-to-boost-your-vim-productivity/
    - https://nanasi.jp/articles/vim/cmdex_vim.html
    - https://qiita.com/tamago3keran/items/cdfd66b627b3686846d2
    - https://qiita.com/tetsuya/items/75987487ffac42250d3b
    - https://qiita.com/hisayuki/items/99ea1b667de71e908891
    - https://qiita.com/lighttiger2505/items/e0ada17634516c081ee7
    - https://qiita.com/lighttiger2505/items/592caac64fd1e1781596
    - https://qiita.com/reireias/items/beaa3bb0e299ae934217
    - https://qiita.com/hrsh7th@github/items/e405b4f4228e10a43201
    - https://liginc.co.jp/409849
    - https://wonderwall.hatenablog.com/entry/2019/07/30/233000

- ``dein``
    - https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
    - https://qiita.com/delphinus/items/cd221a450fd23506e81a
    - http://katsumeshix.hatenablog.jp/entry/2017/10/16/103709
        - in ``init.vim`` , write ``call map(dein#check_clean(), "delete(v:val, 'rf')")``
        - excute ``:call dein#recache_runtimepath()``

- ``defx``
    - https://qiita.com/arks22/items/9688ec7f4cb43444e9d9
    - https://qiita.com/hisawa/items/aeb0f0400079fdaebc8b
    - https://tech.39.gy/terminal/defx/
    - https://castleobj.com/defx/
    - https://takkii.hatenablog.com/entry/2018/08/19/133847
    - https://jsapachehtml.hatenablog.com/entry/2019/08/11/184952

- ``fzf`` , ``grep``
    - http://someneat.hatenablog.jp/entry/2017/03/12/011335

- ``vim-airline``
    - https://original-game.com/vim-airline/
    - https://qiita.com/park-jh/items/557a9d5b470947aef2f5
    - https://qiita.com/myouga/items/2f241731c16cf09273ff
    - https://dev.classmethod.jp/articles/vim-ricty-for-powerline/
    - https://shotat.hateblo.jp/entry/2016/09/13/014358
    - http://saihoooooooo.hatenablog.com/entry/2013/09/14/013840
    - https://itchyny.hatenablog.com/entry/20130820/1376978742

- ``vim-lsp``
    - https://furutsuki.hatenablog.com/entry/2019/12/15/115000
    - https://shase428.hatenablog.jp/entry/2019/05/10/203917
    - https://qiita.com/lighttiger2505/items/29fecc9df0fddc80927a
    - https://hiroyukim.hatenablog.com/entry/2020/01/31/162614

-------------


CheatSheet
~~~~~~~~~~~~

- https://vim-jp.org/vimdoc-ja/usr_01.html
    - ``vim`` 本家
- https://neovim.io/doc/user/
    - ``neovim`` 本家
- https://qiita.com/nyantera/items/4bf29ca6f11bc797a9cb
- https://tech.libinc.co.jp/entry/2019/08/02/140439
- https://qiita.com/fasahina/items/2767891134028648f288
- https://qiita.com/jnchito/items/57ffda5712636a9a1e62
- https://qiita.com/takeharu/items/9d1c3577f8868f7b07b5
- https://qiita.com/tpywao/items/bd119f0075e40d47c88b
- https://qiita.com/iwaseasahi/items/f536bb3772d2fad5e03c
- https://qiita.com/tsumac/items/3972d5347a5f6e37ca09
- https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
- http://yskwkzhr.blogspot.com/2013/12/10-vim-tips-to-help-the-server-management.html
- https://thinca.hatenablog.com/entry/vim-short-tips-advent-calendar-2019
