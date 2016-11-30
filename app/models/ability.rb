class Ability
  include CanCan::Ability

  def initialize(user)

     can :update, Article do | article |
         article.user == article
     end  

     can :destroy, Article do | article |
         article.user == article
     end 
  end
end
