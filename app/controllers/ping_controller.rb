class PingController < ActionController::Base
  def index
    info = ''
    info << "<b>git_branch:</b><br> #{`git rev-parse --abbrev-ref HEAD`} <br><br>"
    info << "<b>git_last_commit:</b><br> #{`git log -1`.split("\n").join("<br>")} <br><br>"
    info << "<b>last_deploy:</b><br> #{`stat -c %y Rakefile`} <br><br>"

    render text: info
  end
end
