class CompanySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :companyname, :city, :fieldofbusiness, :user_id
end
