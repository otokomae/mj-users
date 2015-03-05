# mj-users の Attributes 設定
#
# "mj-users":  {
#       # .bashrc_common に git用の ps などを定義。共通した設定を行わせる
#       # .bashrc に .bashrc_common, .bashrc_user を include する対応
#       #
#       "bashrc_common_users": ["mj", "otokomae"],
#
#       # work_user としての定義
#       # ix-gitolite サーバーへの ssh_config 設定を行っておく
#       #
#       "work_user": "mj"
# }
#
# .bashrc系の設定対象ユーザー
default['mj-users']['bashrc_cookbook']      = nil
default['mj-users']['bashrc_common_users']  = []

# 作業ユーザー定義
default['mj-users']['work_group_name']      = nil
default['mj-users']['work_user']            = ""