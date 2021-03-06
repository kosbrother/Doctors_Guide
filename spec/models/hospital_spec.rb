require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it{ is_expected.to have_and_belong_to_many(:doctors)}
  it { is_expected.to have_fields(:name, :phone, :address, :grade, :assess, :nhiUrl, :code, :coUrl, :on) }
  it { is_expected.to have_field(:cHours).with_alias(:clinic_hours) }
  it { is_expected.to have_field(:divs).with_alias(:divisions) }
  it { is_expected.to have_field(:ss).with_alias(:services) }
  it { is_expected.to have_index_for(name: 1) }
end
