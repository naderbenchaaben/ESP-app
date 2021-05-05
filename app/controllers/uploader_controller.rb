class UploaderController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def upload
      blob = ActiveStorage::Blob.create_after_upload!(
        io: params[:file],
        filename: params[:file].original_filename,
        content_type: params[:file].content_type
      )
  
      render json: direct_upload_json(blob)
    end
  
    private
  
    def direct_upload_json(blob)
      blob.as_json(root: false, methods: :signed_id).merge( previewable: blob.previewable?, preview: blob.previewable? ? url_for( blob.preview( resize_to_limit: nil ) ) : rails_blob_path( blob, only_path: true ) )
    end
  end
  