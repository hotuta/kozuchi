# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Settings::PartnerAccountsController do
  fixtures :users, :accounts, :preferences
  set_fixture_class  :accounts => Account::Base

  describe "/settings/accounts/partners" do
    include_context "太郎 logged in"
    before do
      visit "/settings/accounts/partners"
    end
    it "口座名選択欄がある" do
      page.should have_css('select#account_partner_account_id')
    end
  end
end