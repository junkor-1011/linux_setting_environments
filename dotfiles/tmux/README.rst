================
tmux
================

tmux conf
---------------

- `.tmux.conf <./.tmux.conf>`_

color test
-------------

- `参考 <https://kotaro7750.hatenablog.com/entry/tmux_vim_undercurl>`_

.. code-block:: Bash

    # exec in terminal (bash)
    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'

.. image:: https://user-images.githubusercontent.com/57840144/83319457-969f8280-a279-11ea-810e-706651f7fa81.png

Useful Links
---------------

- https://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b
- https://qiita.com/yujiG/items/b6971684dd97235f73f9
- https://kotaro7750.hatenablog.com/entry/tmux_vim_undercurl
- https://qiita.com/jiroshin/items/ee86ea426a51fa24b319#7-tmux%E5%B0%8E%E5%85%A5%E3%81%97%E3%81%A6%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E7%92%B0%E5%A2%83%E3%82%92%E6%95%B4%E3%81%88%E3%82%88%E3%81%86-family_wwbb
- https://techracho.bpsinc.jp/miyason/2019_12_25/85275
- https://blog.abekoh.dev/post/prj-command/
- https://blog.craftz.dog/my-dev-workflow-using-tmux-vim-48f73cc4f39e
- https://rcmdnk.com/blog/2017/11/17/computer-vim/
- https://qiita.com/purutane/items/1d1dc4818013bbbaead4
- https://inokara.hateblo.jp/entry/2013/07/04/233051
- https://qiita.com/nl0_blu/items/9d207a70ccc8467f7bab
- https://qiita.com/murachi1208/items/36d7676558d5535b44db
- https://qiita.com/ijiest/items/4a42e8543df373babcf2


