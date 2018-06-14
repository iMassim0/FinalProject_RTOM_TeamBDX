
desc "Envoi des infos essentielles : MONEY"
  task remember_chaton: :environment do
    @orders = 0
    @money_win = 0
    users = User.all
    p "recherche des informations sensibles"
    users.each do |user|
      if user.orders == "payé"
        user.orders.each do |order|
          @orders += 1
          order.products.each do |product|
            @items_purchased += 1
            @money_win += product.price
          end
        end
      end
    end
    p "informations récupérées && envoi du mail"
    OrderMailer.with(orders: @orders, items: @items_purchased, money: @money_win).info_to_admin.deliver_now
    p "informations envoyées"
    p "a une prochaine les boy'z"
  end
