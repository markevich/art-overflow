module Uploaders
  module Mixin
    module Base
      def crop(width, height)
        if model.crop_x.present?
          resize_to_limit(width, height)
          manipulate! do |img|
            x = model.crop_x.to_i
            y = model.crop_y.to_i
            w = model.crop_w.to_i
            h = model.crop_h.to_i
            img.crop("#{w}x#{h}+#{x}+#{y}")
            img
          end
        end
      end

      def extension_white_list
        %w(jpg jpeg gif png)
      end

      def interlace
        manipulate! do |img, index, options|
          img.interlace("plane")
          img
        end
      end

    end
  end
end
