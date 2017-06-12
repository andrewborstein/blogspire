module ApplicationHelper
  def flash_class(name)
    {
      notice: 'teal lighten-3',
      alert: 'red lighten-3'
    }[name.to_sym]
  end
end
