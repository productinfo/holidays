# == Schema Information
#
# Table name: requested_days
#
#  id                  :integer          not null, primary key
#  day                 :date             not null
#  status              :integer          default(0)
#  vacation_request_id :integer          not null
#  validator_id        :integer
#  validated_at        :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_requested_days_on_vacation_request_id  (vacation_request_id)
#  index_requested_days_on_validator_id         (validator_id)
#

class RequestedDaySerializer < ActiveModel::Serializer
  attributes  :id,
              :status,
              :day,
              :user_avatar,
              :user_full_name

  def user_avatar
    object.vacation_request.user.avatar_url(:tiny)
  end

  def user_full_name
    object.vacation_request.user.full_name
  end
end
