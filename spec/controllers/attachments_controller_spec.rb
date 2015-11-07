require 'rails_helper'

RSpec.describe AttachmentsController, :type => :controller do
  describe "POST #create" do
    it "saves the new attachment in the database" do
      expect{
        post :create, attachment: attributes_for(:attachment)
      }.to change(Attachment, :count).by(1)
    end

    it "returns the json which has image_name and image_url" do
      post :create, attachment: attributes_for(:attachment)
      res = JSON.parse response.body
      expect(res["image_name"]).to eq "test.jpg"
      expect(res["image_url"]).to eq "/uploads/attachment/image/1/test.jpg"
    end

    it "retuns the json for fail if the new attachment is not saved" do
      allow_any_instance_of(Attachment).to receive(:save).and_return(false)
      post :create, attachment: attributes_for(:attachment)
      res = JSON.parse response.body
      expect(res["image_name"]).to eq "画像のアップロードに失敗しました"
      expect(res["image_url"]).to be_nil
    end
  end
end
