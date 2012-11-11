module ApplicationHelper
  def flash_messages
    render(
      :partial => 'layouts/flash_messages',
      :locals => {:flash => flash}
    )  unless flash.empty?
  end
end
