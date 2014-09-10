module Uploadbox
  module ImgHelper
    def s3_policy
      Base64.encode64(policy_data.to_json).gsub("\n", "")
    end

    def s3_signature
      Base64.encode64(
        OpenSSL::HMAC.digest(
          OpenSSL::Digest::Digest.new('sha1'),
          CarrierWave::Uploader::Base.fog_credentials[:aws_secret_access_key],
          s3_policy
        )
      ).gsub("\n", "")
    end

    def img(source, options={})
      if source.respond_to?(:url) and source.respond_to?(:width) and source.respond_to?(:height)
        if source.processing?
          data = {
            processing: source.processing?,
            original: source.original_file,
            original: options[:default] || source.original_file,
            component: 'ShowImage'
          }
          content_tag :div, class: 'uploadbox-image-container uploadbox-processing', style: "width: #{source.width}px; height: #{source.height}px", data: data do
            image_tag(source.url, {width: source.width, height: source.height, style: 'display: none'}.merge(options))
          end
        else
          data = {}
          content_tag :div, class: 'uploadbox-image-container', width: source.width, height: source.height, data: data do
            image_tag(source.url, {width: source.width, height: source.height}.merge(options))
          end
        end
      else
        image_tag(source, options)
      end
    end

    private
      def policy_data
        {
          expiration: 10.hours.from_now.utc.iso8601,
          conditions: [
            ["starts-with", "$key", 'uploads/'],
            ["content-length-range", 0, 500.megabytes],
            ["starts-with","$content-type",""],
            {bucket: CarrierWave::Uploader::Base.fog_directory},
            {acl: 'public-read'}
          ]
        }
      end
  end
end
