crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_items_path
  #  parent :root
end

crumb :profile do
  link "プロフィール", profile_items_path
  parent :mypage
end

crumb :personal do
  link "本人情報の登録", personal_items_path
  parent :mypage
end

crumb :card_tmp1 do
  link "支払方法", card_tmp1_card_index_path
  parent :mypage
end

crumb :card_tmp2 do
  link "クレジットカード情報入力", card_tmp2_card_index_path
  parent :card_tmp1
end

crumb :logout do
  link "ログアウト", logout_items_path
  parent :mypage
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).