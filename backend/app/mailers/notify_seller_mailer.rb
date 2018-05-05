#Cuando se vende un producto, este mailer envia un correo a su respectivo vendedor.

class NotifySellerMailer < ApplicationMailer

  #En este metodo recibimos el nuevo usuario al que se le enviara el email.
  def notify(sale)
    
    @sale = sale
    @user = User.full_user(@sale.seller_id).first
		mail to: @user.email, subject: 'Felicitaciones, has realizado una venta!'
		
  end
  
end
