#Esta clase envía un email de bienvenida a cada usuario cunado es creado.

class WelcomeUserMailer < ApplicationMailer

  #En este metodo recibimos el nuevo usuario al que se le enviara el email.
  def notify(user)
    
    @user = user
		mail to: @user.email, subject: 'Bienvenido a la comunidad de Campo a la Mano.'
		
  end
  
  #En este metodo recibimos el nuevo usuario al que se le enviara el email.
  def confirmation(user)
    
    @user = user
		mail to: @user.email, subject: 'Confirmación de registro.'
		
  end
  
  #En metodo se usa de prueba para el envio de email.
  def prueba(iduser)
    
    @user = User.full_user(iduser).first
		mail to: @user.email, subject: 'Bienvenido a la comunidad de Campo a la Mano.'
		
  end
  
  
end
