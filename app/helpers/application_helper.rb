module ApplicationHelper
  def flash_class(name)
    {
      alert: 'red lighten-3',
      notice: 'teal lighten-3',
      warning: 'yellow lighten-3'
    }[name.to_sym]
  end
end
