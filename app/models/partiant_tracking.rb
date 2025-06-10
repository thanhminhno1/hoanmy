class PartiantTracking < ApplicationRecord
  enum :service_type, { normal: "normal", premium: "premium"}, default: :normal
  enum :insurance_status, { pending: "pending", rejected: "rejected", confirmed: "confirmed" }, prefix: :insurance, default: :pending

  belongs_to :department
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["assignee", "created_at", "department_id", "id", "insurance_company", "insurance_confirm_time", "insurance_status", "name", "note", "partiant_id", "phone", "request_time", "room", "send_time", "service_type", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["department", "user"]
  end
end
