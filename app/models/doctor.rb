class Doctor
  include Mongoid::Document

  field :name, type: String
  field :hosp, type: String
  field :phone, type: String
  field :address, type: String
  field :div, as: :division, type: String
  field :exp, as: :experience, type: String
  field :spe, as: :specialty, type: String

  field :coUrl, type: String
  field :bUrl, type: String

  index({ coUrl: 1 } , { sparse: true, unique: true } )
  index({ bUrl: 1 } , { sparse: true, unique: true } )
  index({ name: 1 })
  index({ div: 1 })

  has_and_belongs_to_many :hospitals, index: true
end
