# == Schema Information
#
# Table name: profiles
#
#  id             :bigint(8)        not null, primary key
#  age            :string           not null
#  from           :string           not null
#  name           :string           not null
#  sex            :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  source_site_id :integer          not null
#

require "rails_helper"

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
