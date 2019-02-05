# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  address    :string
#  category   :string           not null
#  city       :string
#  post_at    :datetime         not null
#  prefecture :string
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :post_at, presence: true
  validates :category, presence: true

  belongs_to :profile, optional: true

  def self.prepare(title, url, post_at, category, prefecture, city, address)
    post = {}
    post[:title] = title
    post[:url] = url
    post[:post_at] = post_at
    post[:category] = category
    post[:prefecture] = prefecture
    post[:city] = city
    post[:address] = address
    post
  end

  def self.compose(post_hash, profile_hash)
    return nil if Post.find_by(url: post_hash[:url])

    profile_obj = Profile.find_or_initialize_by(profile_hash)
    profile_obj.build_post(post_hash)
  end
end
