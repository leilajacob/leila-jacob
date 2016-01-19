class CartController < ApplicationController

	before_filter :authenticate_user!, :except => [:add_to_cart, :view_order]
  def add_to_cart
    art = Art.find(params[:product_id])
    if art.quantity < params[:qty].to_i
      redirect_to art, notice: "Not enough quantity in stock."
    else
      item = Item.new
      item.product_id = params[:product_id].to_i
      item.quantity = params[:qty]

      
      item.save

      redirect_to view_order_path
    end
  end

  def view_order
  	@items = Item.all
  end

  def checkout
  	@items = Item.all
  	@order = Order.new
  	@order.user_id = current_user.id

  	sum = 0

  	@items.each do |item|
  		@order.order_items[item.art_id] = item.quantity
  		sum += item.line_item_total
  	end

  	@order.subtotal = sum
  	@order.sales_tax = sum * 0.07
  	@order.grand_total = @order.subtotal + @order.sales_tax
  	@order.save

  	@items.each do |item|
  		item.art.quantity 
  		item.art.save
  	end

  	Item.destroy_all
  end

   def order_complete
    @order = Order.find(params[:order_id])
    @amount = (@order.grand_total.to_f.round(2) * 100).to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
