require 'rails_helper'

describe Item do
  it "returns deafult value if title is empty" do
    item = build(:item, title: "")
    expect(item.title).to eq(I18n.t("activerecord.attributes.item.title_empty"))
  end
end
