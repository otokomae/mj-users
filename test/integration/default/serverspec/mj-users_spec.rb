require 'serverspec'

# .bashrc_common のチェック
#
# /home/maji/.bashrc_common があり、
# PS1 の設定がしてある
#
describe file('/home/maji/.bashrc_common') do
    it { should be_file }
    it { should contain "PS1="}
end
