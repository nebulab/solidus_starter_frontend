# frozen_string_literal: true

require 'spec_helper'

describe 'Product', type: :request, with_signed_in_user: true do
  let!(:product) { create(:product, available_on: 1.year.from_now) }
  let(:user) { mock_model(Spree.user_class) }

  context 'when not admin user' do
    it "cannot view non-active products" do
      expect do
        get spree.product_path(product.to_param)
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "provides the current user to the searcher class" do
      get spree.products_path

      expect(assigns[:searcher].current_user).to eq user
      expect(response.status).to eq(200)
    end
  end

  context 'when an admin' do
    let(:user) { mock_model(Spree.user_class, has_spree_role?: 'admin', spree_api_key: 'fake') }

    # Regression test for https://github.com/spree/spree/issues/1390
    it "allows admins to view non-active products" do
      get spree.product_path(id: product.to_param)
      expect(assigns[:products]).to include(product)
      expect(response.status).to eq(200)
    end

    # Regression test for https://github.com/spree/spree/issues/2249
    it "doesn't error when given an invalid referer" do
      # Previously a URI::InvalidURIError exception was being thrown
      get spree.product_path(product.to_param), headers: { 'HTTP_REFERER' => 'not|a$url' }
    end
  end
end
