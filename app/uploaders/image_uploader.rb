# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  storage :file
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  include CarrierWave::RMagick
  process convert:'jpg'
  process resize_to_fill: [900, 900]
  version :thumb do
    process resize_to_limit(200, 200)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
