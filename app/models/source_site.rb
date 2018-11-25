# == Schema Information
#
# Table name: source_sites
#
#  id                          :bigint(8)        not null, primary key
#  is_crawl(クロール対象かどうか)        :boolean          default(TRUE), not null
#  key(ユニークキー)                 :string(255)      not null
#  login_password(ログインパスワード情報) :string(255)      not null
#  login_user(ログインユーザー情報)      :string(255)      not null
#  name(サイト名)                  :string(255)      not null
#  url(サイトURL)                 :string(255)      not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_source_sites_on_key  (key) UNIQUE
#

class SourceSite < ApplicationRecord
  KEY_HAPPY_MAIL = "happy_mail".freeze

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true
  validates :url, presence: true
  validates :login_user, presence: true
  validates :login_password, presence: true
end