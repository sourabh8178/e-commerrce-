class CartsController < ApplicationController
  # skip_before_action :authenticate_user!
  def index
    if current_user.cart.present?
      @cart = current_user.cart
    else  
      @cart = Cart.create(user_id: current_user.id)
    end 
    @cart_items = @cart.cart_items
  end

  def checkout
    byebug
    if params["order"]["cash_on_delivery"].present?
      OrderStatus.create(order_id: params[:order_id], refund: "NotApplicabel")
      @cart_items = Product.where(id: current_user.cart.cart_items.map(&:item_id))
      order = OrderBooking.new
      order.customer_email = current_user.email
      order.customer_id = current_user.id
      order.user_id = current_user.id
      order.product_id = current_user.cart.cart_items.map(&:item_id)
      order.amount_total = current_user.cart.subtotal
      order.address_id = params["order"]["address_id"]
      # order.customer_address_line_one = params["address"]["line1"]
      # order.customer_address_line_two = customer["address"]["line2"]
      # order.post_code = params["address"]["postal_code"]
      # order.customer_state = params["address"]["state"]
      # order.phone = params["address"]["phone"]
      order.cash_on_delivery = true
      order.save
      OrderStatus.create(order_id: params[:order_id], status: "created")
      current_user.cart.clear
      redirect_to "/success"
    else  
      Stripe.api_key = "sk_test_51KWwrwSJkerzRPBUxkXVy9PTD9clPnX2KrEycutGuZxdFULjpNu1W6Lev5jSpYUmCc99SumqCo3JKOUD2mYr2nvD00UY2qQ9hk"
      @session = Stripe::Checkout::Session.create({
        line_items: [{
          price_data: {
            currency: 'inr',
            product_data: {
              name: "#{current_user.cart.cart_items.map{|data| data.item.id}}",
            },
            
            unit_amount: (current_user.cart.subtotal.to_f*100.0).to_i,
          },
          quantity: 1,
        }],
       
        mode: 'payment',
        shipping_address_collection: {
          allowed_countries: ['IN'],
        },
        # These placeholder URLs will be replaced in a following step.
        success_url: "http://localhost:3000//carts/success?session_id={CHECKOUT_SESSION_ID}&product_ids=#{current_user.cart.cart_items.map(&:item_id)}&address_id=#{params["order"]["address_id"]}",
        cancel_url: 'https://flip-cart-lite.herokuapp.com//carts/cancel',
      })
      # http://localhost:3000
    end  
  end


  def success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    customer = Stripe::Customer.retrieve(session.customer)
    @cart_items = Product.where(id: params[:product_ids].split(/\D+/).reject(&:empty?).map(&:to_i))
    order = OrderBooking.new
    order.customer_email = customer["email"]
    order.customer_id = customer["id"]
    order.user_id = current_user.id
    order.product_id = params[:product_ids].split(/\D+/).reject(&:empty?).map(&:to_i).to_a
    order.customer_city = customer["address"]["city"]
    order.customer_country = customer["address"]["country"]
    order.customer_address_line_one =  customer["address"]["line1"]
    order.customer_address_line_two = customer["address"]["line2"]
    order.post_code = customer["address"]["postal_code"]
    order.customer_state = customer["address"]["state"]
    order.phone = customer["phone"]
    order.payment_intent = session["payment_intent"]
    order.amount_total = session["amount_total"]
    order.address_id = params[:address_id]
    order.save
    OrderStatus.create(order_id: params[:order_id], status: "created")
    current_user.cart.clear
    redirect_to "/success"
  end

  def cancel
    redirect_to "/cancel"
  end
  
  def cancel_page
    
  end

  def success_page
    
  end

  def create
    @carts = Cart.create(name: params[:form][:name], email: params[:current_user.email])
    CartshopMailer.cart_mail(@carts).deliver_now 
    redirect_to homes_path
  end

  def address
    @address = Address.all
  end

end
