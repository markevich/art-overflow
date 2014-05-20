class SetDefaultSexForUsers < ActiveRecord::Migration
  def change
    User.update_all(sex: :male)
  end
end
