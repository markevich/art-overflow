module ActivitiesHelper
  def declinatie(male_form, female_form, user)
    user.male? ? male_form : female_form
  end
end
