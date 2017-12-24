require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { create(:user) }
  let(:admin) { create(:user, :admin) }
  let(:scope) { create_list(:user, 3) }

  subject { described_class }

  permissions :show? do
    it { is_expected.to permit user, user }
  end

  permissions :create? do
    it { is_expected.to permit admin, user }
    it { is_expected.not_to permit user, admin }
  end

  permissions :update? do
    it { is_expected.to permit admin, user }
    it { is_expected.to permit user, user }
    it { is_expected.not_to permit user, admin }
  end

  permissions :change_role? do
    it { is_expected.to permit admin, user }
    it { is_expected.not_to permit user, user }
    it { is_expected.not_to permit user, admin }
  end

  permissions :destroy? do
    it { is_expected.to permit admin, user }
    it { is_expected.not_to permit user, admin }
  end
end
