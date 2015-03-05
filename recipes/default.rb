#
# Cookbook Name:: mj-users
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#
# usersクックブックを利用するので基本的には data_bags/users にあるユーザーを作成
# するものとする。
#

# sysadmin グループのユーザー作成
include_recipe "users::sysadmins"

# workグループとして定義しているユーザーを作成
# group名を node['mj-users']['work_group_name'] とする
#
users_manage "work" do
    group_name node['mj-users']['work_group_name'] || "work"
    action [ :remove, :create ]
end


# bashrc_common_users に定義されているユーザーに対して、
#
# ~/.bashrc に
#
# * ~/.bashrc_commn
# * ~/.bashrc_user
#
# の両ファイルを Includeする様指示
#
# ~/.bashrc_common は files/default/mj-bashrc_common にて(git の ps編集など)
#
package "git" do
    action :install
end

node['mj-users']['bashrc_common_users'].each do |u|
    cookbook_file "/home/#{u}/.bashrc_common" do
        cookbook    node['mj-users']['bashrc_cookbook'] || "mj-users"
        source      "mj-bashrc_common"
        user        u
        mode        00644
    end

    # .bashrc に .bashrc_common, .bashrc_user を includeする様対応
    ruby_block "include-bashrc-user" do
        block do
            file = Chef::Util::FileEdit.new("/home/#{u}/.bashrc")
            file.insert_line_if_no_match(
                "# Include common and user profile",
                "\n# # Include common and user profile\nif [ -f ~/.bashrc_common ]; then . ~/.bashrc_common; fi\nif [ -f ~/.bashrc_user ]; then . ~/.bashrc_user; fi"
            )
            file.write_file
        end
    end
end

