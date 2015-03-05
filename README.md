mj-users Cookbook
======================

users Cookbook を元にユーザーの作成を行うクックブック。
users Cookbookよりユーザーを作成する対応。
.bashrc に .bashrc_common, .bashrc_user を includeして共通の設定を指定出来る様な対応。
.bashrc_common はクックブックであらかじめ設定した bashrc設定情報を記述し、ユーザー個別の設定は .bashrc_user で行ってもらう。


Requirements
------------

* users Cookbook

Attributes
----------

* bashrc_cookbook  
  bashrc_common_users で指定したユーザー用の共通で読み込む .bashrc_common の設定が入った file のある cookbookを指定する（デフォルトは mj-users クックブック）
* bashrc_common_users  
  .bashrc_common を読み込む対応を行うユーザー。配列で複数設定
* work_group_name  
  作業用ユーザーが所属するグループ名
* work_user
  作業用ユーザーを指定
