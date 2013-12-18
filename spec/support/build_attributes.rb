module FactoryGirl
  module BuildAttributes
    # This helper provides convenient way to generate parameters for controller's test because attributes_for ignores association ids
    #
    # Examples:
    # => FactoryGirl.attributes_for(:user)
    # => {:name => 'Tom'} # didn't return country's id which we have defined in the :user factory
    #
    # => FactoryGirl.build_attributes_for(:user)
    # => {:name => 'Tom', :country_id => 1} # returns foreigh key for country association
    def build_attributes_for(*args)
      FactoryGirl.build(*args).attributes.delete_if do |k, v|
        ["id", "created_at", "updated_at"].member?(k)
      end
    end
  end
end
