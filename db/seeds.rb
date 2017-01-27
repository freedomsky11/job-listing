# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 並且創建一些jobs"

create_account = User.create([email: '1@qq.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."

jobs = [
  "api程序员",
  "iOS开发工程师",
  "Html5工程师",
  "Android开发工程师",
  "测试工程师",
  "rails工程师",
  "法律顾问",
  "人力资源主管",
  "UI设计师",
  "行政主管",
  "平面设计师",
  "工业设计师",
]
category = [
  "技术",
  "运营",
  "市场与销售",
  "职能",
  "金融",
  "法律",
  "人力资源",
  "企业管理",
]
company = [
  "小米",
  "百度",
  "阿里巴巴",
  "腾讯",
  "锥子科技",
  "京东",
]
city = [
  "北京",
  "上海",
  "广州",
  "深圳",
  "杭州",
  "厦门",
]

create_jos = for i in 1..30 do
  Job.create!([
    title: jobs[rand(jobs.length)],
    # title: "JOB.no#{i}",
    description: "这是用种子建立的第 #{i} 个Public工作哦",
    wage_upper_bound: rand(50..99)*100 + 5000,
    wage_lower_bound: rand(10..49)*100 + 5000,
    contact_email: 'text@gmail.com',
    is_hidden: "false",
    city: city[rand(city.length)],
    company: company[rand(company.length)],
    category: category[rand(category.length)]
  ])
end

puts "30 Public jobs created."

create_jos = for i in 1..30 do
  Job.create!([
    title: jobs[rand(jobs.length)],
    # title: "JOB.no#{i}",
    description: "这是用种子建立的第 #{i+10} 个hidden工作哦",
    wage_upper_bound: rand(50..99)*100 + 5000,
    wage_lower_bound: rand(10..49)*100 + 5000,
    contact_email: 'text@gmail.com',
    is_hidden: "true",
    city: city[rand(city.length)],
    company: company[rand(company.length)],
    category: category[rand(category.length)]
  ])
end
puts "30 Hidden jobs created."
