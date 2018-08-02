module ApplicationHelper
  def link_to_add_step name, form, association, **args
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |b|
      render(association.to_s.singularize, f: b)
    end

    link_to(name, "#", class: "add_step_fields " + args[:class],
      data: {id: id, fields: fields.delete("\n")})
  end

  def link_to_add_ingredient name, form, association, **args
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |b|
      render(association.to_s.singularize, f: b)
    end

    link_to(name, "#", class: "add_ingredient_fields " + args[:class],
      data: {id: id, fields: fields.delete("\n")})
  end
end
