require 'spec_helper'

describe PictureUploader do
  it { expect(PictureUploader::LIMIT_WIDTH).to eq(2500) }
  it { expect(PictureUploader::LIMIT_HEIGHT).to eq(2500) }
  it { expect(PictureUploader::CROP_AREA_WIDTH).to eq(1200) }
  it { expect(PictureUploader::CROP_AREA_HEIGHT).to eq(800) }
  it { expect(PictureUploader::SMALL_THUMB_WIDTH).to eq(315) }
  it { expect(PictureUploader::SMALL_THUMB_HEIGHT).to eq(210) }
  it { expect(PictureUploader::THUMB_WIDTH).to eq(495) }
  it { expect(PictureUploader::THUMB_HEIGHT).to eq(330) }
  it { expect(PictureUploader::THUMB_ASPECT_RATIO).to eq(PictureUploader::THUMB_WIDTH.to_f / PictureUploader::THUMB_HEIGHT) }
end
