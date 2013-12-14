require 'spec_helper'

describe PictureUploader do
  it { expect(PictureUploader::CROP_AREA_WIDTH).to eq(800) }
  it { expect(PictureUploader::CROP_AREA_HEIGHT).to eq(600) }
  it { expect(PictureUploader::THUMB_WIDTH).to eq(315) }
  it { expect(PictureUploader::THUMB_HEIGHT).to eq(210) }
end
