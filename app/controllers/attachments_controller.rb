class AttachmentsController < ApplicationController
	protect_from_forgery with: :null_session

	def create
		attachment = Attachment.new(attachment_params)
		
		if attachment.save
			render json: {
				image_name: attachment.image.identifier,
				image_url: attachment.image.url
			}
		else
			render json: {
				image_name: '画像のアップロードに失敗しました',
				image_url: nil
			}
		end
	end

	private 
	def attachment_params
		params.require(:attachment).permit(:image, :advent_calendar_item_id)
	end
end
