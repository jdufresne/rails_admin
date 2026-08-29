# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Datetimepicker widget', type: :request, js: true do
  subject { page }

  before do
    RailsAdmin.config FieldTest do
      edit do
        field :datetime_field
      end
    end
  end

  it 'is initially blank' do
    visit new_path(model_name: 'field_test')
    datetime_input = find('[name="field_test[datetime_field]"]')
    expect(datetime_input[:type]).to eq 'datetime-local'
    expect(datetime_input.value).to be_blank
  end

  it 'accepts a native datetime-local value' do
    visit new_path(model_name: 'field_test')
    datetime_input = find('[name="field_test[datetime_field]"]')
    datetime_input.set '2015-10-08T14:00'
    expect(datetime_input.value).to eq '2015-10-08T14:00'
  end

  it 'loads an existing datetime into a native datetime-local input' do
    visit new_path(model_name: 'field_test', field_test: {datetime_field: '2021-01-02T03:45:00'})
    expect(find('[name="field_test[datetime_field]"]').value).to eq '2021-01-02T03:45'
  end
end
