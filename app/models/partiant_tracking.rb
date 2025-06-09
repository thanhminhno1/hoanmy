class PartiantTracking < ApplicationRecord
  enum :service_type, { normal: "normal", premium: "premium"}, default: :normal
  enum :insurance_status, { pending: "pending", rejected: "rejected", confirmed: "confirmed" }, prefix: :insurance

  belongs_to :department
end
