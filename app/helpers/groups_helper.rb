module GroupsHelper
  def render_group_description(group)
    simple_format(group.decription)
  end
end
