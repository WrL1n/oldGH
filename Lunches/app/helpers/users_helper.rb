module UsersHelper
  def all_organisations
    if User.count == 0
      Organisation.all.order(id: :asc)
    else
      Organisation.where.not(name: 'Non-organisation').order(id: :asc)
    end
  end
end
