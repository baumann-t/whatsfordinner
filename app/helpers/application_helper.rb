module ApplicationHelper
  include Pagy::Frontend
  def current_class?(test_path)
    return 'active' if request.path == test_path

    return 'inactive'
  end
end
