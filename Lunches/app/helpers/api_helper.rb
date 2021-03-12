module ApiHelper
  def name_product(id)
    if id.class == Integer
      Product.find(id).title
    else
      ''
    end
  end

  def organisation_name(user_id)
    User.find(user_id).organisation.name
  end

  def user_name(id)
    User.find(id).username
  end
end
