# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'assets:precompile' do
  before do
    system({}, 'bin/rails', 'assets:precompile', chdir: 'spec/dummy_app', exception: true)
  end

  it 'compiles Turbo static assets' do
    expect(Dir['spec/dummy_app/public/assets/turbo-*.js']).not_to be_empty
  end
end
