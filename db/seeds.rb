# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed products
Product.delete_all
Product.create!(title: 'Design and Build Great Web APIs',
description:
%{<p>
<em>Robust, Reliable, and Resilient</em>
APIs are transforming the business world at an increasing pace. Gain
the essential skills needed to quickly design, build, and deploy
quality web APIs that are robust, reliable, and resilient. Go from
initial design through prototyping and implementation to deployment of
mission-critical APIs for your organization. Test, secure, and deploy
your API with confidence and avoid the “release into production”
panic. Tackle just about any API challenge with more than a dozen
open-source utilities and common programming patterns you can apply
right away.
</p>},
image_url: 'maapis.jpg',
price: 24.95)

Product.create!(title: 'Ruby Programming for Beginners',
description:
%{<p>
<em>Learn Ruby from Scratch</em>
Are you new to programming? Start your journey with Ruby, a beginner-friendly and elegant programming language. This book will guide you through the basics of Ruby programming, from variables and data types to control flow and object-oriented programming. With clear explanations and hands-on exercises, you'll gain the skills to write your own Ruby programs and build a solid foundation for further learning.
</p>},
image_url: 'ruby_book.jpg',
price: 19.99)

Product.create!(title: 'Mastering Ruby on Rails',
description:
%{<p>
<em>Become a Rails Expert</em>
Take your Ruby skills to the next level with Ruby on Rails, a powerful web application framework. In this book, you'll learn how to build full-featured web applications using Rails' conventions and best practices. From creating models and controllers to handling authentication and deploying your app, you'll master the key concepts and techniques of Rails development. Whether you're a beginner or an experienced Rubyist, this book will help you become a Rails expert.
</p>},
image_url: 'rails_book.jpg',
price: 29.99)
# . . .